---
id: 131
title: Export iPhone contacts from an iTunes backup
date: 2013-10-06T16:44:35+00:00
author: jsha
layout: post
guid: http://jacob.hoffman-andrews.com/README/?p=131
permalink: /export-iphone-contacts-from-an-itunes-backup/
categories:
  - Uncategorized
---
`cd ~/"Library/Application Support/MobileSync/Backup"/*<br />
sqlite3 31bb7ba8914766d4ba40d6dfb6113c8b614be442.mddata > ~/contacts.csv <<EOF</p>
<p>.mode csv<br />
select first, last, abmultivalue.value from abperson join abmultivalue on abperson.rowid = abmultivalue.record_id;<br />
EOF`

Puts your contacts into ~/contacts.csv. Note that the hash value (31bb..) is common across all iPhones. It's a hash of the path to the on-phone DB storage.

If you have backups from multiple iPhones, you'll have to change the first line to replace the "*" with the UDID of your phone. Or just look in ~/Library/Application Support/MobileSync/Backup and see which directories are available.

This works without downloading any extra software. SQLite3 is a simple database format, and the tool should already be installed by default on Mac OS X.

If you're on Windows, the same SQLite command works but you'll have to find the DB under %HOMEPATH%\Application Data\Apple Computer\MobileSync\Backup\{UDID}.