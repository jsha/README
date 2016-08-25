---
id: 88
title: Generate a self-signed SSL certificate with subjectAlternateName extension
date: 2010-12-06T16:07:38+00:00
author: jsha
layout: post
guid: http://jacob.hoffman-andrews.com/README/?p=88
permalink: /generate-a-self-signed-ssl-certificate-with-subjectalternatename-extension/
categories:
  - Uncategorized
---
It&#8217;s often useful to create self-signed SSL certificates for testing or when you don&#8217;t need the authentication that CA signing provides.  I started with Akadia&#8217;s handy tutorial on self-signing here: [http://www.akadia.com/services/ssh\_test\_certificate.html](http://www.akadia.com/services/ssh_test_certificate.html).

Then I needed to add a list of subjectAlternateName (SAN) fields.  This is an x509v3 extension that allows a single certificate to be valid for multiple DNS names.  Here&#8217;s a shortened version of how to create a self-signed cert using those fields:

`<br />
echo -e >extensions.cnf "basicConstraints=CA:true\nsubjectAltName=DNS:mysite1.com, DNS:mysite2.com"`

 ``

```It&#8217;s often useful to create self-signed SSL certificates for testing or when you don&#8217;t need the authentication that CA signing provides.  I started with Akadia&#8217;s handy tutorial on self-signing here: [http://www.akadia.com/services/ssh\_test\_certificate.html](http://www.akadia.com/services/ssh_test_certificate.html).

Then I needed to add a list of subjectAlternateName (SAN) fields.  This is an x509v3 extension that allows a single certificate to be valid for multiple DNS names.  Here&#8217;s a shortened version of how to create a self-signed cert using those fields:

`<br />
echo -e >extensions.cnf "basicConstraints=CA:true\nsubjectAltName=DNS:mysite1.com, DNS:mysite2.com"`

 ``

``` 

Import server.crt into your list of trusted root certs and install server.crt and server.key in your Apache configuration. Your Apache should now be able to serve trusted SSL for the domains you specified, to your browser or any other one that imports your new certificate as a root.

NOTE: Guard your server.key carefully. Because you have just imported this as a CA cert, an attacker who gained control of your server.key could use it to impersonate any server on the web to you.