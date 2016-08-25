---
id: 106
title: Easy custom mail merge with Python and GMail
date: 2012-03-27T21:29:21+00:00
author: jsha
layout: post
guid: http://jacob.hoffman-andrews.com/README/?p=106
permalink: /easy-custom-mail-merge-with-python-and-gmail/
categories:
  - Uncategorized
---
I recently had a moderately large bulk mail I wanted to send out to many of my friends. I wanted to automate the process, but I also wanted to personalize each mail a bit by addressing it directly to individuals. I wound up writing the below Python script, which takes as input a set of contacts exported in &#8220;Microsoft Outlook CSV&#8221; format (I exported mine from Google Contacts). It generates emails according to a pattern, but doesn&#8217;t send them. Instead it saves them to the Drafts folder of your GMail. From there you can manually review, tweak, and send them. If you prefer to simply send the mail straightaway, you can modify the script to do that, but be aware that you will hit rate limits sooner.


```
#!/usr/bin/python
import imaplib
import csv
import email
import time

srv = imaplib.IMAP4_SSL("imap.gmail.com")
srv.login('username@gmail.com', 'password')
srv.select('[Gmail]/Drafts')


def send_m(first_name, address):
  message = email.message_from_string("""To: %s
Subject: SUBJECT_GOES_HERE
Dear %s,

BODY_GOES_HERE
""" % (address, first_name))
  srv.append("[Gmail]/Drafts",
              '',
              imaplib.Time2Internaldate(time.time()),
              str(message))

csvreader = csv.reader(open("contacts.csv"))
for row in csvreader:
  first = row[0]
  full = row[0] + " " + row[2]
  addresses = [row[14]]
  if row[15] != "":
    addresses.append(row[15])
  if row[16] != "":
    addresses.append(row[16])

  a = ", ".join(map( lambda x: "%s <%s>" % (full, x), addresses))
  print first, a
  send_m(first, a)
  time.sleep(1)
```
