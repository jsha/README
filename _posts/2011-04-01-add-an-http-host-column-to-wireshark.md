---
id: 94
title: Add an HTTP Host column to Wireshark
date: 2011-04-01T13:55:24+00:00
author: jsha
layout: post
guid: http://jacob.hoffman-andrews.com/README/index.php/2011/04/01/add-an-http-host-column-to-wireshark/
permalink: /add-an-http-host-column-to-wireshark/
categories:
  - Uncategorized
---
Diagnosing HTTP traffic in Wireshark can be a pain because it is not always clear from the Info column where the traffic is going. All those &#8220;GET / HTTP/1.1&#8243; blend together. Fortunately it&#8217;s easy to add a column.

Go to Edit -> Preferences -> User Interface -> Columns. Click &#8220;+ Add&#8221;, and for &#8220;Field type&#8221; select Custom. The &#8220;Field name&#8221; box will now be enabled. In it type &#8220;http.host&#8221;. Click the &#8220;New column&#8221; text above to set the display name to &#8220;HTTP Host.&#8221; Hit OK and you are done!

<img class="alignnone  wp-image-99" title="Screen shot 2011-04-01 at 1.59.25 PM" src="/README/wp-content/uploads/2011/04/Screen-shot-2011-04-01-at-1.59.25-PM.png" alt="Screen shot 2011-04-01 at 1.59.25 PM" />