---
id: 77
title: Youtube geotagging
date: 2010-08-08T08:25:40+00:00
author: jsha
layout: post
guid: http://jacob.hoffman-andrews.com/README/?p=77
permalink: /youtube-geotagging/
categories:
  - Uncategorized
---
The documentation on how geotagging works in Youtube is a little slim, so I&#8217;m documenting what I&#8217;ve learned about it recently.

When you pull a Youtube feed in JSON-C format, e.g. <http://gdata.youtube.com/feeds/api/users/greenpeaceusa/uploads?alt=jsonc&v=2&max-results=50&category=oilspilltruth>, sometimes you will get geotags like this:

<pre>{
  data: {
     ...
     items: [
       {
         id: "s-QQWRdF-5Y"
         ...
         geoCoordinates: {
           latitude: 29.149463653564453
           longitude: -90.47636413574219
         }
       }
       ....</pre>

And sometimes, instead of geoCoordinates, you will get `location`:

<pre>location: "cat island, louisiana"</pre>

The difference between these two lies in how the video was geotagged.  If a user geotagged the video by simply typing a location name into the map widget and hitting enter, it will receive a `location:` attribute. If a user geotagged the video by typing a location name and then dragging the marker, or simply by dragging the marker, then the video will receive a `geoCoordinates:` attribute. In theory whenever a video has a `location:` attribute, you should be able to send it through [Google&#8217;s geocoding service](http://code.google.com/apis/maps/documentation/geocoding/) and be confident that you will receive an answer close to what the user intended.  In practice, Google&#8217;s geocoding index will occasionally change, and the answer may not be exactly the same as what the user saw when they originally geotagged a video.

## How do I geotag a video?

Assuming you already have a video uploaded, go to <http://www.youtube.com/my_videos>.  Click &#8216;Edit&#8217; for one of your videos:

<img class="alignnone size-full wp-image-79" title="Youtube video list" src="/README/wp-content/uploads/2010/08/Screen-shot-2010-08-08-at-11.08.48-AM.png" alt="Youtube video list" width="832" height="202" />

In the lower right of the video Edit page, you will see a Date and Map panel:

<img class="alignnone size-full wp-image-80" title="Screen shot 2010-08-08 at 11.11.34 AM" src="/README/wp-content/uploads/2010/08/Screen-shot-2010-08-08-at-11.11.34-AM.png" alt="Screen shot 2010-08-08 at 11.11.34 AM" width="509" height="559" />

You can fly to a location by typing its name:

<img class="alignnone size-full wp-image-81" title="Screen shot 2010-08-08 at 11.13.14 AM" src="/README/wp-content/uploads/2010/08/Screen-shot-2010-08-08-at-11.13.14-AM.png" alt="Screen shot 2010-08-08 at 11.13.14 AM" width="497" height="551" />

Make sure to hit the &#8220;Save changes&#8221; button in the upper left.  After doing this, your video will receive a location: attribute.  However, if you want a more precise location, or you want your video to receive the easier-to-plot geoCoordinates attribute, zoom in and drag the pin to the exact location you want:

<img class="alignnone size-full wp-image-82" title="Screen shot 2010-08-08 at 11.15.55 AM" src="/README/wp-content/uploads/2010/08/Screen-shot-2010-08-08-at-11.15.55-AM.png" alt="Screen shot 2010-08-08 at 11.15.55 AM" width="501" height="558" />

Notice that the &#8220;Map Location&#8221; box now contains exact latitude and longitude coordinates.  Hit &#8220;Save changes&#8221; in the upper left, and your video is now tagged with precise coordinates.  You should see these show up as the geoCoordinates attribute in JSON-C output.

## How can I tell if a Youtube video is geotagged?

As far as I can tell, there is no way to figure this out through the user interface on Youtube.com.  I believe the only way to access Youtube geotags is through the API.