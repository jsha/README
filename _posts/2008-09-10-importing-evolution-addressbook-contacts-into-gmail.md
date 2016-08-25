---
id: 13
title: Importing Evolution addressbook contacts into GMail
date: 2008-09-10T14:48:43+00:00
author: jsha
layout: post
guid: http://jacob.hoffman-andrews.com/README/?p=13
permalink: /importing-evolution-addressbook-contacts-into-gmail/
categories:
  - HOWTO
---
GMail&#8217;s Contacts section now has support for a full-featured set of contacts, including phone numbers, addresses, etc.  I tried importing my addressbook from Evolution, but it wasn&#8217;t easy.  Step 1: Export your addressbook in vCard format.  Step 2: Tweak the output.GMail doesn&#8217;t like plain TEL records, it wants them to always beprefixed by phone., e.g.:phone.TEL;TYPE=CELL,OTHER:(510) 334-3594 

<p id=":2a" class="ArwC7c ckChnd">
  Versus
</p>

TEL;TYPE=CELL,OTHER:(510) 555-1212Also GMail doesn&#8217;t like blank lines between vCard records.Here are a pair of vim commands to fix the above two problems::%s,^TEL,phone.TEL:v/./d 

<p id=":2a" class="ArwC7c ckChnd">
   
</p>

<p id=":2a" class="ArwC7c ckChnd">
  Once you&#8217;ve edited the file appropriately you should be able to import it using the Contacts > Import function within GMail.
</p>