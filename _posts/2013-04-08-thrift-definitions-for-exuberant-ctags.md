---
id: 117
title: Thrift definitions for exuberant ctags
date: 2013-04-08T19:27:16+00:00
author: jsha
layout: post
guid: http://jacob.hoffman-andrews.com/README/?p=117
permalink: /thrift-definitions-for-exuberant-ctags/
categories:
  - Uncategorized
---
If you want exuberant ctags to recognize Thrift, add this to your ~/.ctags:

<pre>--langdef=thrift
--langmap=thrift:.thrift
--regex-thrift=/^[ \t]*struct[ \t]*([a-zA-Z0-9_]+)/\1/c,classes/
--regex-thrift=/^[ \t]*enum[ \t]*([a-zA-Z0-9_]+)/\1/T,types/
--regex-thrift=/^[ \t]*[a-zA-Z0-9_&lt;&gt;\.]+[ \t]*([a-zA-Z0-9_]+)\(/\1/m,methods/
--regex-thrift=/^[ \t]*([A-Z0-9_]+)[ \t]*=/\1/C,constants/
</pre>