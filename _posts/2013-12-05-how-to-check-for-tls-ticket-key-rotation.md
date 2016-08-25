---
id: 173
title: How to check for TLS ticket key rotation
date: 2013-12-05T19:06:36+00:00
author: jsha
layout: post
guid: http://jacob.hoffman-andrews.com/README/?p=173
permalink: /how-to-check-for-tls-ticket-key-rotation/
categories:
  - Uncategorized
---
As I mentioned [in this blog post](https://blog.twitter.com/2013/forward-secrecy-at-twitter-0), in order to do forward secrecy right, you need to make sure you rotate the keys for your session tickets regularly. Here&#8217;s how to check that a host implements ticket key rotation.

Make sure you are using a recent version of openssl:

`$ /usr/local/ssl/bin/openssl version<br />
OpenSSL 1.0.1e 11 Feb 2013`

Establish a connection and store the session ticket in \`sess.&#8217; If the output doesn&#8217;t contain &#8217;0000 &#8211; &#8216;, either your openssl or the server doesn&#8217;t support TLS session tickets.

``As I mentioned [in this blog post](https://blog.twitter.com/2013/forward-secrecy-at-twitter-0), in order to do forward secrecy right, you need to make sure you rotate the keys for your session tickets regularly. Here&#8217;s how to check that a host implements ticket key rotation.

Make sure you are using a recent version of openssl:

`$ /usr/local/ssl/bin/openssl version<br />
OpenSSL 1.0.1e 11 Feb 2013`

Establish a connection and store the session ticket in \`sess.&#8217; If the output doesn&#8217;t contain &#8217;0000 &#8211; &#8216;, either your openssl or the server doesn&#8217;t support TLS session tickets.

`` 

Try resuming a session using the ticket in \`sess.&#8217; Note the changed param \`-sess\_in sess&#8217;. You should expect to see \`Reused&#8217; and the same set of hex bytes. These sixteen hex bytes are the key\_name field* for for the ticket, and are used by the server to look up the correct ticket key when multiple ones are available.

`$ openssl s_client -connect twitter.com:443 < /dev/null <strong>-sess_in sess</strong> | egrep '0000 - |Reused|New'<br />
DONE<br />
<strong>Reused</strong>, TLSv1/SSLv3, Cipher is ECDHE-RSA-AES128-GCM-SHA256<br />
0000 - <strong>da 6c e8 07 f2 54 02 71-2a 9e 13 05 dc bd 25 1b</strong> .l...T.q*.....%.`

Now, wait a while to see if a key rotation happens. The actual amount of time depends on server configuration, but twelve or twenty-four hours are probably good. Run the same command again.

`$ openssl s_client -connect twitter.com:443 < /dev/null -sess_in sess | egrep '0000 - |Reused|New'<br />
DONE<br />
<strong>Reused</strong>, TLSv1/SSLv3, Cipher is ECDHE-RSA-AES128-GCM-SHA256<br />
0000 - <strong>9d da 29 68 a6 6b b2 69-b8 69 9a b1 3c 0a ff 3e</strong> ..)h.k.i.i..`

You may see \`Reused&#8217; along with a different set of hex bytes, as above. If so, that means the server still has the ticket key it used to encrypt your first session ticket, but after successfully finishing an abbreviated handshake with that ticket, it gave you a new ticket encrypted with a more recent ticket key. This is common practice to smooth out key transitions so there is not a dip in resumption rates as old ticket keys are suddenly rejected.

If you wait long enough, eventually you should see \`New&#8217; along with a different set of hex bytes:

`<strong>New</strong>, TLSv1/SSLv3, Cipher is ECDHE-RSA-AES128-GCM-SHA256<br />
0000 - aa 47 08 d1 58 c4 9d fb-7c 19 9b 41 1b 0a ea d7 .G..X...|..A....`

This means that the server finally removed the ticket key it used to encrypt your session. It was therefore unable to decrypt the provided ticket and had to do a full handshake, establishing a new session and assigning a new ticket. You can consider the server to be correctly rotating session ticket keys.

The lifetime hint provides a rough idea of how long you should expect a session ticket to last:

`$ openssl s_client -connect twitter.com:443 < /dev/null | grep lifetime.hint<br />
TLS session ticket lifetime hint: <strong>129600</strong> (seconds)`

*If the remote server is using OpenSSL. In general, session tickets are opaque blobs, but OpenSSL specifically uses the first 16 bytes to identify a session ticket key.