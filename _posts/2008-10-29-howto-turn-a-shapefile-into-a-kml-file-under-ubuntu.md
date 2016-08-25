---
id: 20
title: HOWTO Turn a shapefile into a KML file under Ubuntu
date: 2008-10-29T11:50:02+00:00
author: jsha
layout: post
guid: http://jacob.hoffman-andrews.com/README/?p=20
permalink: /howto-turn-a-shapefile-into-a-kml-file-under-ubuntu/
categories:
  - HOWTO
---
[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

`[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

` 

Become the postgres user to create the procedural language, initialize the geographic functions, and fill the spatial\_ref\_sys table:

``[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

`[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

` 

Become the postgres user to create the procedural language, initialize the geographic functions, and fill the spatial\_ref\_sys table:

`` 

Import the shapefile into your database. The -d parameter drops the table before creating it, useful if you may be reimporting the data multiple times. If you have a large file you may want to add the -D parameter, which uses the more efficient dump format for faster ingestion. The -s parameter specifies the SRID of your input data, and you should be able to figure it out from the .prj file that came with the shapefile.

```[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

`[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

` 

Become the postgres user to create the procedural language, initialize the geographic functions, and fill the spatial\_ref\_sys table:

``[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

`[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

` 

Become the postgres user to create the procedural language, initialize the geographic functions, and fill the spatial\_ref\_sys table:

`` 

Import the shapefile into your database. The -d parameter drops the table before creating it, useful if you may be reimporting the data multiple times. If you have a large file you may want to add the -D parameter, which uses the more efficient dump format for faster ingestion. The -s parameter specifies the SRID of your input data, and you should be able to figure it out from the .prj file that came with the shapefile.

``` 

And dump output into KML.  Note that you can put any criteria you want into the -sql param, so you could restrict the set of features you output.

````[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

`[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

` 

Become the postgres user to create the procedural language, initialize the geographic functions, and fill the spatial\_ref\_sys table:

``[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

`[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

` 

Become the postgres user to create the procedural language, initialize the geographic functions, and fill the spatial\_ref\_sys table:

`` 

Import the shapefile into your database. The -d parameter drops the table before creating it, useful if you may be reimporting the data multiple times. If you have a large file you may want to add the -D parameter, which uses the more efficient dump format for faster ingestion. The -s parameter specifies the SRID of your input data, and you should be able to figure it out from the .prj file that came with the shapefile.

```[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

`[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

` 

Become the postgres user to create the procedural language, initialize the geographic functions, and fill the spatial\_ref\_sys table:

``[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

`[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

` 

Become the postgres user to create the procedural language, initialize the geographic functions, and fill the spatial\_ref\_sys table:

`` 

Import the shapefile into your database. The -d parameter drops the table before creating it, useful if you may be reimporting the data multiple times. If you have a large file you may want to add the -D parameter, which uses the more efficient dump format for faster ingestion. The -s parameter specifies the SRID of your input data, and you should be able to figure it out from the .prj file that came with the shapefile.

``` 

And dump output into KML.  Note that you can put any criteria you want into the -sql param, so you could restrict the set of features you output.

```` 

Note: KML explicitly supports only one SRID: 4326. That refers to [WGS84](http://en.wikipedia.org/wiki/WGS84). So in the ogr2ogr command above, you need the transform(&#8230;, 4326) call to produce valid lat/longs for KML. Evidently Google Maps has another SRID, 900913, but I haven&#8217;t played with that one at all. If you&#8217;re using KML as your input to Google Maps, 4326 should be fine.

You can increase or decrease the parameter to simplify(). Higher numbers mean more simplification, lower numbers mean less.

The NameField param is a KML-specific parameter to ogr2ogr which specifies which field from the query should be used as the name for a given KML feature.

Here are some other pages I found useful when working this all out:

[PostGIS Wiki : Postgis On Ubuntu](http://postgis.refractions.net/support/wiki/index.php?PostgisOnUbuntu)
  
[PerryGeo » Converting Shapefiles (and more) to KML](http://www.perrygeo.net/wordpress/?p=56)
  
[Projected coordinates listed by name](http://www.arcwebservices.com/arcwebonline/services/pcs_alpha.htm)[[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

`[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

` 

Become the postgres user to create the procedural language, initialize the geographic functions, and fill the spatial\_ref\_sys table:

``[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

`[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

` 

Become the postgres user to create the procedural language, initialize the geographic functions, and fill the spatial\_ref\_sys table:

`` 

Import the shapefile into your database. The -d parameter drops the table before creating it, useful if you may be reimporting the data multiple times. If you have a large file you may want to add the -D parameter, which uses the more efficient dump format for faster ingestion. The -s parameter specifies the SRID of your input data, and you should be able to figure it out from the .prj file that came with the shapefile.

```[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

`[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

` 

Become the postgres user to create the procedural language, initialize the geographic functions, and fill the spatial\_ref\_sys table:

``[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

`[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

` 

Become the postgres user to create the procedural language, initialize the geographic functions, and fill the spatial\_ref\_sys table:

`` 

Import the shapefile into your database. The -d parameter drops the table before creating it, useful if you may be reimporting the data multiple times. If you have a large file you may want to add the -D parameter, which uses the more efficient dump format for faster ingestion. The -s parameter specifies the SRID of your input data, and you should be able to figure it out from the .prj file that came with the shapefile.

``` 

And dump output into KML.  Note that you can put any criteria you want into the -sql param, so you could restrict the set of features you output.

````[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

`[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

` 

Become the postgres user to create the procedural language, initialize the geographic functions, and fill the spatial\_ref\_sys table:

``[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

`[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

` 

Become the postgres user to create the procedural language, initialize the geographic functions, and fill the spatial\_ref\_sys table:

`` 

Import the shapefile into your database. The -d parameter drops the table before creating it, useful if you may be reimporting the data multiple times. If you have a large file you may want to add the -D parameter, which uses the more efficient dump format for faster ingestion. The -s parameter specifies the SRID of your input data, and you should be able to figure it out from the .prj file that came with the shapefile.

```[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

`[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

` 

Become the postgres user to create the procedural language, initialize the geographic functions, and fill the spatial\_ref\_sys table:

``[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

`[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

` 

Become the postgres user to create the procedural language, initialize the geographic functions, and fill the spatial\_ref\_sys table:

`` 

Import the shapefile into your database. The -d parameter drops the table before creating it, useful if you may be reimporting the data multiple times. If you have a large file you may want to add the -D parameter, which uses the more efficient dump format for faster ingestion. The -s parameter specifies the SRID of your input data, and you should be able to figure it out from the .prj file that came with the shapefile.

``` 

And dump output into KML.  Note that you can put any criteria you want into the -sql param, so you could restrict the set of features you output.

```` 

Note: KML explicitly supports only one SRID: 4326. That refers to [WGS84](http://en.wikipedia.org/wiki/WGS84). So in the ogr2ogr command above, you need the transform(&#8230;, 4326) call to produce valid lat/longs for KML. Evidently Google Maps has another SRID, 900913, but I haven&#8217;t played with that one at all. If you&#8217;re using KML as your input to Google Maps, 4326 should be fine.

You can increase or decrease the parameter to simplify(). Higher numbers mean more simplification, lower numbers mean less.

The NameField param is a KML-specific parameter to ogr2ogr which specifies which field from the query should be used as the name for a given KML feature.

Here are some other pages I found useful when working this all out:

[PostGIS Wiki : Postgis On Ubuntu](http://postgis.refractions.net/support/wiki/index.php?PostgisOnUbuntu)
  
[PerryGeo » Converting Shapefiles (and more) to KML](http://www.perrygeo.net/wordpress/?p=56)
  
[Projected coordinates listed by name](http://www.arcwebservices.com/arcwebonline/services/pcs_alpha.htm)](http://postgis.refractions.net/documentation/manual-1.3/) [PostGIS Manual](http://postgis.refractions.net/documentation/manual-1.3/)
  
[PostGIS Simplify](http://www.bostongis.com/postgis_simplify.snippet)
  
[PostGIS ver. 1.3.1 Quick Guide &#8211; Cheatsheet](http://www.bostongis.com/postgis_quickguide.bqg)
  
[#2271 (Add built in reprojection support to KML driver) &#8211; GDAL &#8211; Trac](http://trac.osgeo.org/gdal/ticket/2271)
  
[[postgis] SRID for LAT/LONG](http://postgis.refractions.net/pipermail/postgis-users/2001-September/000330.html)
  
[[postgis-users] addgeometrycolumn() does not exist](http://postgis.refractions.net/pipermail/postgis-users/2004-June/005011.html)
  
[[FWTools] ogr2ogr shp &#8211;> kml conversion failing on some complicated polygons](http://lists.maptools.org/pipermail/fwtools/2007-April/000750.html)
  
[Generalize Vectors &#8211; GEO UTILITIES](http://www.geo-news.net/index_norm.php)
  
[[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

`[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

` 

Become the postgres user to create the procedural language, initialize the geographic functions, and fill the spatial\_ref\_sys table:

``[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

`[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

` 

Become the postgres user to create the procedural language, initialize the geographic functions, and fill the spatial\_ref\_sys table:

`` 

Import the shapefile into your database. The -d parameter drops the table before creating it, useful if you may be reimporting the data multiple times. If you have a large file you may want to add the -D parameter, which uses the more efficient dump format for faster ingestion. The -s parameter specifies the SRID of your input data, and you should be able to figure it out from the .prj file that came with the shapefile.

```[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

`[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

` 

Become the postgres user to create the procedural language, initialize the geographic functions, and fill the spatial\_ref\_sys table:

``[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

`[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

` 

Become the postgres user to create the procedural language, initialize the geographic functions, and fill the spatial\_ref\_sys table:

`` 

Import the shapefile into your database. The -d parameter drops the table before creating it, useful if you may be reimporting the data multiple times. If you have a large file you may want to add the -D parameter, which uses the more efficient dump format for faster ingestion. The -s parameter specifies the SRID of your input data, and you should be able to figure it out from the .prj file that came with the shapefile.

``` 

And dump output into KML.  Note that you can put any criteria you want into the -sql param, so you could restrict the set of features you output.

````[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

`[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

` 

Become the postgres user to create the procedural language, initialize the geographic functions, and fill the spatial\_ref\_sys table:

``[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

`[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

` 

Become the postgres user to create the procedural language, initialize the geographic functions, and fill the spatial\_ref\_sys table:

`` 

Import the shapefile into your database. The -d parameter drops the table before creating it, useful if you may be reimporting the data multiple times. If you have a large file you may want to add the -D parameter, which uses the more efficient dump format for faster ingestion. The -s parameter specifies the SRID of your input data, and you should be able to figure it out from the .prj file that came with the shapefile.

```[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

`[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

` 

Become the postgres user to create the procedural language, initialize the geographic functions, and fill the spatial\_ref\_sys table:

``[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

`[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

` 

Become the postgres user to create the procedural language, initialize the geographic functions, and fill the spatial\_ref\_sys table:

`` 

Import the shapefile into your database. The -d parameter drops the table before creating it, useful if you may be reimporting the data multiple times. If you have a large file you may want to add the -D parameter, which uses the more efficient dump format for faster ingestion. The -s parameter specifies the SRID of your input data, and you should be able to figure it out from the .prj file that came with the shapefile.

``` 

And dump output into KML.  Note that you can put any criteria you want into the -sql param, so you could restrict the set of features you output.

```` 

Note: KML explicitly supports only one SRID: 4326. That refers to [WGS84](http://en.wikipedia.org/wiki/WGS84). So in the ogr2ogr command above, you need the transform(&#8230;, 4326) call to produce valid lat/longs for KML. Evidently Google Maps has another SRID, 900913, but I haven&#8217;t played with that one at all. If you&#8217;re using KML as your input to Google Maps, 4326 should be fine.

You can increase or decrease the parameter to simplify(). Higher numbers mean more simplification, lower numbers mean less.

The NameField param is a KML-specific parameter to ogr2ogr which specifies which field from the query should be used as the name for a given KML feature.

Here are some other pages I found useful when working this all out:

[PostGIS Wiki : Postgis On Ubuntu](http://postgis.refractions.net/support/wiki/index.php?PostgisOnUbuntu)
  
[PerryGeo » Converting Shapefiles (and more) to KML](http://www.perrygeo.net/wordpress/?p=56)
  
[Projected coordinates listed by name](http://www.arcwebservices.com/arcwebonline/services/pcs_alpha.htm)[[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

`[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

` 

Become the postgres user to create the procedural language, initialize the geographic functions, and fill the spatial\_ref\_sys table:

``[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

`[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

` 

Become the postgres user to create the procedural language, initialize the geographic functions, and fill the spatial\_ref\_sys table:

`` 

Import the shapefile into your database. The -d parameter drops the table before creating it, useful if you may be reimporting the data multiple times. If you have a large file you may want to add the -D parameter, which uses the more efficient dump format for faster ingestion. The -s parameter specifies the SRID of your input data, and you should be able to figure it out from the .prj file that came with the shapefile.

```[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

`[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

` 

Become the postgres user to create the procedural language, initialize the geographic functions, and fill the spatial\_ref\_sys table:

``[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

`[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

` 

Become the postgres user to create the procedural language, initialize the geographic functions, and fill the spatial\_ref\_sys table:

`` 

Import the shapefile into your database. The -d parameter drops the table before creating it, useful if you may be reimporting the data multiple times. If you have a large file you may want to add the -D parameter, which uses the more efficient dump format for faster ingestion. The -s parameter specifies the SRID of your input data, and you should be able to figure it out from the .prj file that came with the shapefile.

``` 

And dump output into KML.  Note that you can put any criteria you want into the -sql param, so you could restrict the set of features you output.

````[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

`[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

` 

Become the postgres user to create the procedural language, initialize the geographic functions, and fill the spatial\_ref\_sys table:

``[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

`[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

` 

Become the postgres user to create the procedural language, initialize the geographic functions, and fill the spatial\_ref\_sys table:

`` 

Import the shapefile into your database. The -d parameter drops the table before creating it, useful if you may be reimporting the data multiple times. If you have a large file you may want to add the -D parameter, which uses the more efficient dump format for faster ingestion. The -s parameter specifies the SRID of your input data, and you should be able to figure it out from the .prj file that came with the shapefile.

```[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

`[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

` 

Become the postgres user to create the procedural language, initialize the geographic functions, and fill the spatial\_ref\_sys table:

``[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

`[Shapefiles](http://en.wikipedia.org/wiki/Shapefile) and [KML](http://en.wikipedia.org/wiki/KML) are two common geographic formats.  Shapefiles tend to be used by geographic databases like ESRI and PostGIS, while KML originated with Google Earth, back when it was called Keyhole.  KML files are more common for data that is intended primarily to display to users.  They are supported both in Google Earth and in Google Maps, through [importing to a My Map](http://local.google.com/support/bin/answer.py?hl=en&answer=68480#import).

But for all that both formats are really popular, it&#8217;s not easy to go back and forth between the two.  Further, it&#8217;s really hard to simplify a KML file that has highly detailed polygons.  This is important because, while Google Earth may be able to handle a large number of points, Google Maps has to execute in the browser and so has tight limits on how many points can be in a polygon.  This can result in a group of polygons being split by Maps across multiple pages so they can be rendered in a reasonable amount of time.

I had some shapefile data I wanted to simplify and display in a My Map. My solution was to bite the bullet and install PostgreSQL and PostGIS.  Both are free software and are available as packages on Ubuntu Intrepid Ibex. Similar directions should apply for other Linux distributions.

First, install PostgreSQL and the PostGIS geographic layer on top of it:

` 

Become the postgres user to create the procedural language, initialize the geographic functions, and fill the spatial\_ref\_sys table:

`` 

Import the shapefile into your database. The -d parameter drops the table before creating it, useful if you may be reimporting the data multiple times. If you have a large file you may want to add the -D parameter, which uses the more efficient dump format for faster ingestion. The -s parameter specifies the SRID of your input data, and you should be able to figure it out from the .prj file that came with the shapefile.

``` 

And dump output into KML.  Note that you can put any criteria you want into the -sql param, so you could restrict the set of features you output.

```` 

Note: KML explicitly supports only one SRID: 4326. That refers to [WGS84](http://en.wikipedia.org/wiki/WGS84). So in the ogr2ogr command above, you need the transform(&#8230;, 4326) call to produce valid lat/longs for KML. Evidently Google Maps has another SRID, 900913, but I haven&#8217;t played with that one at all. If you&#8217;re using KML as your input to Google Maps, 4326 should be fine.

You can increase or decrease the parameter to simplify(). Higher numbers mean more simplification, lower numbers mean less.

The NameField param is a KML-specific parameter to ogr2ogr which specifies which field from the query should be used as the name for a given KML feature.

Here are some other pages I found useful when working this all out:

[PostGIS Wiki : Postgis On Ubuntu](http://postgis.refractions.net/support/wiki/index.php?PostgisOnUbuntu)
  
[PerryGeo » Converting Shapefiles (and more) to KML](http://www.perrygeo.net/wordpress/?p=56)
  
[Projected coordinates listed by name](http://www.arcwebservices.com/arcwebonline/services/pcs_alpha.htm)](http://postgis.refractions.net/documentation/manual-1.3/) [PostGIS Manual](http://postgis.refractions.net/documentation/manual-1.3/)
  
[PostGIS Simplify](http://www.bostongis.com/postgis_simplify.snippet)
  
[PostGIS ver. 1.3.1 Quick Guide &#8211; Cheatsheet](http://www.bostongis.com/postgis_quickguide.bqg)
  
[#2271 (Add built in reprojection support to KML driver) &#8211; GDAL &#8211; Trac](http://trac.osgeo.org/gdal/ticket/2271)
  
[[postgis] SRID for LAT/LONG](http://postgis.refractions.net/pipermail/postgis-users/2001-September/000330.html)
  
[[postgis-users] addgeometrycolumn() does not exist](http://postgis.refractions.net/pipermail/postgis-users/2004-June/005011.html)
  
[[FWTools] ogr2ogr shp &#8211;> kml conversion failing on some complicated polygons](http://lists.maptools.org/pipermail/fwtools/2007-April/000750.html)
  
[Generalize Vectors &#8211; GEO UTILITIES](http://www.geo-news.net/index_norm.php)
  
](http://postgis.refractions.net/documentation/manual-1.3/) [](http://postgis.refractions.net/support/wiki/index.php?PostgisOnUbuntu)