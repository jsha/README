---
id: 111
title: 'It&#8217;s 2013, time to unshard your hostnames'
date: 2013-01-17T12:16:21+00:00
author: jsha
layout: post
guid: http://jacob.hoffman-andrews.com/README/?p=111
permalink: /its-2013-time-to-unshard-your-hostnames/
categories:
  - Uncategorized
---
For a long time, conventional web wisdom has been to shard your resources across multiple hostnames for better page load performance. The HTTP 1.1 RFC says: &#8220;[A single-user client SHOULD NOT maintain more than 2 connections with any server or proxy](http://www.w3.org/Protocols/rfc2616/rfc2616-sec8.html#sec8.1.4),&#8221; and for years all browsers followed this guideline. Steve Souders  wrote [this excellent post](http://www.stevesouders.com/blog/2009/05/12/sharding-dominant-domains/) on why two-connection limit hurts performance. In short, since each request on a given connection has to wait for the previous request to complete, you pay an extra round-trip time per resource, plus the backend server&#8217;s processing or loading time. With more connections, more resources are downloaded in parallel, saving time.

When Chrome launched  in 2008, it challenged the default. Chrome 1 created six connections per hostname in order to provide faster load times for the many web sites that didn&#8217;t implement hostname sharding. This was a big success, and now in 2013 [all major desktop browser create six connections per hostname](http://www.browserscope.org/?category=network&v=top-d-e), with the exception of IE10, which creates eight. Similar is true of mobile browsers.

So if you shard your resources across four domains, as is common, you now create twenty-four connections where you originally intended to create eight. Actually, [Yahoo published a report](http://yuiblog.com/blog/2007/04/11/performance-research-part-4/) indicating two aliases (four connections) were optimal for a sample load. That&#8217;s without even considering the impact of DNS and SSL connection setup time.

The biggest disadvantage of hostname sharding is that each additional domain requires an additional DNS lookup. Each additional lookup costs a round-trip time to the user&#8217;s DNS server, and possibly longer if that server needs to recurse. Worse, since DNS uses UDP, when a packet drops the client has to wait for a timeout ([typically one second](http://blogs.technet.com/b/stdqry/archive/2011/12/15/dns-clients-and-timeouts-part-2.aspx)) before retrying.

Now that more sites are using SSL for everything, there is the additional cost of setting up the SSL session for each of those connections. Depending on implementation and timing, those could be full handshakes (3.5 RTT + certificate, which can easily be 1.5kB+) or resumptions (2.5 RTT). You also need to get a separate certificate for each alias domain, or get a wildcard or SAN cert.

Sharding across multiple hostnames also adds code complexity. In order to maximize cacheability, you want every asset to map to exactly one hostname at all times. This is often done wrong, and doing it right can be a hassle. Best practice is typically hashing the path name and taking a modulus, but it can be annoying to keep the same logic between your frontend and backend code. It also means that all image paths need to be passed through a function to determine the correct hostname, which can complicate your templates.

In short, simplify your code and your DNS/SSL setup by using one hostname for all your assets, or two if you need a separate domain for your CDN. This will give you six or twelve concurrent connections, which is just about ideal.