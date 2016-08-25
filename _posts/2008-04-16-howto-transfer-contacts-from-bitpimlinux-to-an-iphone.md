---
id: 3
title: HOWTO Transfer contacts from BitPim/Linux to an iPhone
date: 2008-04-16T23:19:24+00:00
author: jsha
layout: post
guid: http://jacob.hoffman-andrews.com/README/?p=3
permalink: /howto-transfer-contacts-from-bitpimlinux-to-an-iphone/
categories:
  - HOWTO
---
[Bitpim](http://www.bitpim.org/) is an open source tool to sync data from a variety of CDMA phones. In particular it supports my LG VX-10, or it did until the thing got too beat up to sync.

Now I&#8217;m faced with the task of transferring my old contacts to my new phone. Here&#8217;s how I went about doing so.

**1. [Jailbreak](http://en.wikipedia.org/wiki/Jailbreak) your phone.**

I borrowed a Mac and ran [iJailbreak](http://ijailbreak.com/). I&#8217;d be interested to hear if anyone knows of a jailbreak program for Linux.

#### 2. Export your contacts.

In Bitpim, select File > Export > vCards&#8230; and save to the default bitpim.vcf. The Dialect section of the export dialog should be &#8220;vCard 3.0.&#8221;

[![bitpim-export.png](/README/wp-content/uploads/2008/04/bitpim-export.png)](/README/wp-content/uploads/2008/04/bitpim-export.png "bitpim-export.png")

[[Bitpim](http://www.bitpim.org/) is an open source tool to sync data from a variety of CDMA phones. In particular it supports my LG VX-10, or it did until the thing got too beat up to sync.

Now I&#8217;m faced with the task of transferring my old contacts to my new phone. Here&#8217;s how I went about doing so.

**1. [Jailbreak](http://en.wikipedia.org/wiki/Jailbreak) your phone.**

I borrowed a Mac and ran [iJailbreak](http://ijailbreak.com/). I&#8217;d be interested to hear if anyone knows of a jailbreak program for Linux.

#### 2. Export your contacts.

In Bitpim, select File > Export > vCards&#8230; and save to the default bitpim.vcf. The Dialect section of the export dialog should be &#8220;vCard 3.0.&#8221;

[![bitpim-export.png](/README/wp-content/uploads/2008/04/bitpim-export.png)](/README/wp-content/uploads/2008/04/bitpim-export.png "bitpim-export.png")

](/README/wp-content/uploads/2008/04/bitpim-export2.png "bitpim-export2.png") 

We have to fix up the output a little bit. Bitpim produces output like:

<pre>TEL;TYPE=CELL,PREF:(212) 555-1212</pre>

The &#8220;,PREF&#8221; here confuses Funambol. I haven&#8217;t checked whether this is valid per the vCard spec or not, but it&#8217;s easy to fix:

<pre>$ sed -i s/,PREF// ~/bitpim.vcf</pre>

#### 3. Sign up for a free account at [my.funambol.com](http://my.funambol.com/). While you&#8217;re there, download the sync app onto your iPhone.

#### 4. Set up [Evolution](http://www.gnome.org/projects/evolution/) and [SyncEvolution](http://www.estamos.de/projects/SyncML/).

Evolution is most likely available as part of your distribution. SyncEvolution, you will probably have to download separately from [estamos.de](http://www.estamos.de/projects/SyncML/ "estamos.de").

Now use File > Import&#8230; to import bitpim.vcf.

[![evolution-import1.png](/README/wp-content/uploads/2008/04/evolution-import1.thumbnail.png)](/README/wp-content/uploads/2008/04/evolution-import1.png "evolution-import1.png")[![evolution-import2.png](/README/wp-content/uploads/2008/04/evolution-import2.thumbnail.png)](/README/wp-content/uploads/2008/04/evolution-import2.png "evolution-import2.png")[![evolution-import3.png](/README/wp-content/uploads/2008/04/evolution-import3.thumbnail.png)](/README/wp-content/uploads/2008/04/evolution-import3.png "evolution-import3.png")[![evolution-import4.png](/README/wp-content/uploads/2008/04/evolution-import4.thumbnail.png)](/README/wp-content/uploads/2008/04/evolution-import4.png "evolution-import4.png")[![evolution-import5.png](/README/wp-content/uploads/2008/04/evolution-import5.thumbnail.png)](/README/wp-content/uploads/2008/04/evolution-import5.png "evolution-import5.png")

Neither SyncEvolution nor Funambol does a good job syncing deletions of contacts, so you&#8217;ll find that in order to delete a contact properly you&#8217;ll have to remove it from Evolution, Funambol, _and_ your iPhone. For that reason, I suggest that you go through your contacts now and remove any you don&#8217;t wish to keep.

Now you need to set up SynEvolution to talk to Funambol. For this you should follow the [Getting Started instructions on estamos.de](http://www.estamos.de/projects/SyncML/GettingStarted.html). It&#8217;s pretty straightforward but involves some editing of config files. When you&#8217;re done you&#8217;ll be able to two-way sync between Evolution and Funabol with:

`$ syncevolution funambol`

#### 5. Set up the Funambol iPhone app and sync!

[![snap_181149.jpg](/README/wp-content/uploads/2008/04/snap_181149.jpg)](/README/wp-content/uploads/2008/04/snap_181149.jpg "snap_181149.jpg")