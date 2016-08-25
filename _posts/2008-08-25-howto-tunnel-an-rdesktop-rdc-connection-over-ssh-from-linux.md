---
id: 12
title: HOWTO Tunnel an Rdesktop (RDC) connection over SSH from Linux
date: 2008-08-25T19:25:54+00:00
author: jsha
layout: post
guid: http://jacob.hoffman-andrews.com/README/?p=12
permalink: /howto-tunnel-an-rdesktop-rdc-connection-over-ssh-from-linux/
categories:
  - HOWTO
---
I have an SSH connection into work, and wanted to be able to access a Windows machine there via rdesktop.  I tried this:

$ ssh -L 3890:windows-machine:3890

$ rdesktop localhost:3890

But the rdesktop command hung for a long time then died.  Some poking around revealed this page: <http://www.bluestream.org/Networking/SSHTunnelRDP.htm>, which details an occasional problem that occurs when trying to connect to a forwarded port on localhost.  Their suggestion was to bind to a non-localhost interface.  Since their tutorial is for Putty, here&#8217;s the equivalent for OpenSSH:

$ ssh -L mymachinename:3890:windows-machine:3890

$ rdesktop mymachinename:3890

Where mymachinename is the actual hostname of your machine, which should in theory resolve to the IP of your ethernet adaptor.