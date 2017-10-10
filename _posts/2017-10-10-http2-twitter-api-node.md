---
title: HTTP/2, the Twitter API, and Node
date: 2017-10-10T18:13:31+00:00
author: jsha
layout: post
---

[HTTP/2](https://http2.github.io/) is a major revision of the HTTP protocol,
most notable for multiplexing requests across a single TCP connection. Twitter
was an early supporter of HTTP/2 and its predecessor SPDY. Now that HTTP/2
is going to be natively supported in Node 8, I wanted to use it in [Block
Together](https://blocktogether.org/) to make more efficient use of resources.

Unfortunately, the Twitter API servers implement an earlier draft of HTTP/2.
Originally, client support for gzip and deflate was mandatory, so Twitter could
send deflated content even if the client did not send Accept-Encoding: deflate.
That requirement was removed in a later draft, so many clients, including Node's
`http2` package, don't support deflate natively. In order to use Node's HTTP/2
with Twitter, you'll need to add a little intermediate layer to deflate or
gunzip:

```
const http2 = require('http2');
const zlib = require('zlib');
const client = http2.connect('https://api.twitter.com');
const req = client.request({ ':path': '/robots.txt' });

let data = []
let expander = input => input;
req.on('response', response => {
  console.log(response)
  switch (response['content-encoding']) {
    case 'deflate':
      expander = zlib.inflateSync; break;
    case 'gzip':
      expander = zlib.gunzipSync; break;
  }
})
req.on('data', d => data.push(d))
req.on('end', (r) => {
  var buffer = Buffer.concat(data);
  console.log(expander(buffer).toString('utf8'));
  client.destroy()
});
req.end();
```

You'll need to pass the --expose_http2 flag for the above code snippet to work.
You can also use the [`node-http2`](https://github.com/molnarg/node-http2)
package, but note that it is deprecated.

```
node --expose_http2 h2.js
```

Note that it's easy to mess up the encoding by converting the data chunks to
strings too early using the wrong encoding. When you do that, the binary data
can get interpreted as UTF-8 and mangled.

To really use the Twitter API, of course, you'll need to use an OAuth library.
I've forked the node-oauth package and have an [http2
branch](https://github.com/jsha/node-oauth/tree/http2) that implements the
deflation code above. You can use it by adding a line like this to your
package.json:

```
    "oauth": "git://github.com/jsha/node-oauth#http2",
```

The upstream maintainer of node-oauath does not appear to be taking pull
requests, so this probably won't be upstreamed. And I don't intend to actively
maintain this branch other than for my own use, so consider this more along
the lines of example code than a package ready to be used.

The issue with Twitter and Content-Encoding: deflate has also been noticed and
[fixed by Go](https://github.com/golang/go/issues/18779).
