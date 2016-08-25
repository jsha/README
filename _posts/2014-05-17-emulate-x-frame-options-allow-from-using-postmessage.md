---
id: 244
title: 'Emulate X-Frame-Options: ALLOW-FROM using postMessage'
date: 2014-05-17T13:31:23+00:00
author: jsha
layout: post
guid: https://jacob.hoffman-andrews.com/README/?p=244
permalink: /emulate-x-frame-options-allow-from-using-postmessage/
categories:
  - Uncategorized
---
Clickjacking is a a web-based attack that can be mounted on a website when the attacker is able to display that website inside an iframe on another website. In short, the attacker tricks users into clicking a button on their target site, e.g. [delete account] or [[tweet](http://www.theregister.co.uk/Print/2009/03/20/twitter_viral_xss_flaw/)].

Websites prevent clickjacking by sending the [X-Frame-Options: SAMEORIGIN header](https://developer.mozilla.org/en-US/docs/Web/HTTP/X-Frame-Options), which tells browsers not to display their pages inside an iframe on any site other than their own. Since the iframe doesn&#8217;t display anything, there&#8217;s nothing to click.

However, sometimes a site want to allow limited framing by other hostnames (origins). For instance, Twitter shows extended tweet information from cards.twitter.com in an iframe loaded on twitter.com. Since there are sometimes buttons inside those cards, like &#8216;share this,&#8217; they want to make sure cards.twitter.com can **only** be displayed by twitter.com.

The X-Frame-Options header has another setting: X-Frame-Options: ALLOW-FROM <uri>. This allows, e.g. cards.twitter.com to serve &#8216;X-Frame-Options: ALLOW-FROM https://twitter.com&#8217;. That prevents iframing by third parties but not by twitter.com itself. Unfortunately, ALLOW-FROM is only supported on Firefox and IE. Eventually ALLOW-FROM will be supplanted by [CSP&#8217;s frame-ancestors directive](http://w3c.github.io/webappsec/specs/content-security-policy/csp-specification.dev.html), but that&#8217;s not ready for prime time yet.

So, what can we do today? It turns out you can get the equivalent ALLOW-FROM behavior today if you&#8217;re willing to require Javascript. We start with the antiClickjack CSS approach from Rydstedt, Burzstein, Boneh, and Jackson, described in short at [OWASP](https://www.owasp.org/index.php/Clickjacking_Defense_Cheat_Sheet#Best-for-now_Legacy_Browser_Frame_Breaking_Script) and with more detail in the original paper, [&#8220;Busting Frame Busting&#8221;](http://seclab.stanford.edu/websec/framebusting/). On top of that, we require the host frame to send a postMessage to the child frame. The content of the message doesn&#8217;t matter. The child frame will check the &#8216;origin&#8217; attribute of the received message, which is guaranteed by the browser, against a list of acceptable parent frames. If the sending origin is acceptable, the child frame removes the antiClickjack style node, and the content (including buttons) becomes visible. If the sending origin is not acceptable, the child frame does nothing and the content remains hidden and non-interactable.

Note: It&#8217;s important that the parent frame is not itself frameable. Typically that means the parent frame sends X-Frame-Options: SAMEORIGIN, though one could also implement the ALLOW-FROM strategy recursively if necessary.

You can see an example in action at [xfoaf1.crud.net](http://xfoaf1.crud.net). It looks like this:

**Parent frame**:

<pre style="border: 1px light grey;">function loadFrame(url) {                                                                                                                                      
  var ifr = document.createElement('iframe');                                                                                                                  
  ifr.src = url;                                                                                                                                               
  ifr.onload = function() {                                                                                                                                    
    // Send a dummy message just to prove we're here.                                                                                                          
    ifr.contentWindow.postMessage("openSesame", "*");                                                                                                          
  }                                                                                                                                                            
  document.body.appendChild(ifr);                                                                                                                              
};
</pre></p> 

**Child frame**:

<pre style="border: 1px light grey;">&lt;style id="antiClickjack"&gt;body{display:none !important;}&lt;/style&gt;                                                                                               
                                                                                                                                                               
&lt;script type="text/javascript"&gt;                                                                                                                                
   var validParents = {                                                                                                                                        
     "http://xfoaf1.crud.net": 1                                                                                                                               
   };                                                                                                                                                          
   window.addEventListener("message", function(message) {                                                                                                      
     if (validParents[message.origin] && message.data == "openSesame") {                                                                                       
       var antiClickjack = document.getElementById("antiClickjack");                                                                                           
       antiClickjack.parentNode.removeChild(antiClickjack);                                                                                                    
     }                                                                                                                                                         
   }, false);                                                                                                                                                  
&lt;/script&gt;
</pre>