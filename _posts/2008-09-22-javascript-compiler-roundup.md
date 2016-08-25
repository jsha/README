---
id: 14
title: JavaScript compiler roundup
date: 2008-09-22T10:22:00+00:00
author: jsha
layout: post
guid: http://jacob.hoffman-andrews.com/README/?p=14
permalink: /javascript-compiler-roundup/
categories:
  - Uncategorized
---
I&#8217;m looking to start compiling JavaScript for a personal project, so I did a quick roundup of freely available JS compilers / obfuscators / minifiers.

Dojo Shrinksafe &#8211; http://dojotoolkit.org/docs/shrinksafe

YUI Compressor &#8211; http://www.julienlecomte.net/yuicompressor/

JavaScript Obfuscator by Stunnix &#8211; http://www.stunnix.com/prod/jo/

JSMin &#8211; http://www.crockford.com/javascript/jsmin.html

Packer- http://dean.edwards.name/packer/

So far I&#8217;ve tried Shrinksafe and YUI Compressor.  I couldn&#8217;t get Shrinksafe to produce any output, even though it seemed to be parsing my JS since it threw errors when I had something wrong.

YUI compressor ran on my input JS and produced output, but it had a couple of problems.  Backslash-escaped strings get unescaped from the output.  For instance,

<pre>alert("two \n lines");

Becomes:

alert("two
 lines");

Also, it seemed to have trouble with "else if (...) {" constructs, turning them into "else{if(...){".</pre>