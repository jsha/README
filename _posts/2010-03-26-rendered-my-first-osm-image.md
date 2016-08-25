---
id: 73
title: Rendered my first OSM image!
date: 2010-03-26T13:47:41+00:00
author: jsha
layout: post
guid: http://jacob.hoffman-andrews.com/README/?p=73
permalink: /rendered-my-first-osm-image/
categories:
  - Uncategorized
---
I&#8217;ve been playing around with OpenStreetMaps recently. I downloaded a subset of the world data set covering San Francisco by using this tool: <http://78.46.81.38/>.  I loaded the data into a local PostGIS database with [osm2pgsql](http://wiki.openstreetmap.org/wiki/Osm2pgsql).  Then I spent a couple hours installing the prerequisites for [Mapnik](http://wiki.openstreetmap.org/wiki/Mapnik) and building Mapnik itself, which was the hardest part but still very doable.  Once Mapnik was installed, I was able to use the generate_image.py script to generate a quick map of SF.  Next step is to learn how to build tiles for slippy maps, and then how to customize them.

[<img class="alignnone" src="/osm/first-sf-render-thumb.png" alt="" width="400" height="400" />](/osm/first-sf-render.png)

The process was mostly easy and rewarding.  One funny quirk: osm2pgsql can&#8217;t do password authentication to the database, so it&#8217;s most convenient to use a passwordless account.  Mapnik, on the other hand, appears to choke if it is given an empty password string, so you need to add a password to the account once you get to the Mapnik stage.