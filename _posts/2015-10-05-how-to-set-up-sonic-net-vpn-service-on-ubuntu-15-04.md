---
id: 272
title: How to set up Sonic.net VPN service on Ubuntu 15.04
date: 2015-10-05T22:27:31+00:00
author: jsha
layout: post
guid: https://jacob.hoffman-andrews.com/README/?p=272
permalink: /how-to-set-up-sonic-net-vpn-service-on-ubuntu-15-04/
categories:
  - Uncategorized
---
Sonic.net offers a free [VPN service to all customers](https://wiki.sonic.net/wiki/VPN_Service). Here are instructions on how to set it up on Ubuntu:

\# sudo apt-get install network-manager-vpnc vpnc

Click on wireless icon in toolbar, select &#8220;Edit connections&#8230;&#8221;

[<img alt="network connections" src="https://jacob.hoffman-andrews.com/README/wp-content/uploads/2015/10/network-connections.png" width="400" height="328" />](https://jacob.hoffman-andrews.com/README/wp-content/uploads/2015/10/network-connections.png)

Click &#8220;Add&#8221;

[<img class="alignnone size-full wp-image-275" alt="add connection" src="https://jacob.hoffman-andrews.com/README/wp-content/uploads/2015/10/add-connection.png" width="544" height="565" />](https://jacob.hoffman-andrews.com/README/wp-content/uploads/2015/10/add-connection.png)

Select &#8220;Cisco Compatible VPN (vpnc)&#8221;

Fill in the details from [Sonic&#8217;s help page](https://wiki.sonic.net/wiki/VPN_Service). At the time of writing, that&#8217;s:

Gateway: ipsec.vpn.sonic.net

Username: your username from members.sonic.net.

Password: your password from members.sonic.net. You need to change the dropdown on the right-hand side from &#8220;Always ask&#8221; to &#8220;Saved&#8221; if you want to store your password here. Otherwise you will be prompted when you connect.

Group name: Standard VPN

Group password: standard. You need to change the dropdown on the right-hand side from &#8220;Always ask&#8221; to &#8220;Saved&#8221; to store your password here. Since it&#8217;s a publicly-known password, there&#8217;s no downside choosing &#8220;Saved.&#8221;

Set Connection name to &#8220;sonic.net&#8221; or anything you like.

[<img class="alignnone size-full wp-image-275" alt="add connection" src="https://jacob.hoffman-andrews.com/README/wp-content/uploads/2015/10/add-connection.png" width="544" height="565" />](https://jacob.hoffman-andrews.com/README/wp-content/uploads/2015/10/add-connection.png) [<img class="alignnone size-full wp-image-276" alt="edit vpn" src="https://jacob.hoffman-andrews.com/README/wp-content/uploads/2015/10/edit-vpn.png" width="538" height="506" />](https://jacob.hoffman-andrews.com/README/wp-content/uploads/2015/10/edit-vpn.png)

Click &#8220;Save.&#8221; Click &#8220;Close&#8221; on the Network Connections window. Click the wireless icon in the top bar, select &#8220;VPN Connections,&#8221; and then &#8220;sonic.net&#8221; (or whatever you named your VPN config). The wireless icon will make a &#8220;connection&#8221; animation for a few seconds, and then a small lock icon should appear in the lower right. If the lock icon does not appear, the VPN connection failed and you need to do some troubleshooting.

[<img class="alignnone size-full wp-image-277" alt="lock icon" src="https://jacob.hoffman-andrews.com/README/wp-content/uploads/2015/10/lock-icon.png" width="29" height="23" />](https://jacob.hoffman-andrews.com/README/wp-content/uploads/2015/10/lock-icon.png)

If you&#8217;d like to auto-connect to VPN for certain networks (e.g. open wifi), click the wireless icon in the top bar, select &#8220;Edit connections,&#8221; select the network you are interested in. Click &#8220;Edit&#8221; and select the &#8220;General&#8221; tab. Select &#8220;Automatically connect to VPN when using this connection,&#8221; and choose your VPN from the drop-down below (if it is not already chosen).