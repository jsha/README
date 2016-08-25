---
id: 51
title: HOWTO Encrypt an existing home directory on Ubuntu Karmic Koala
date: 2009-12-08T23:44:55+00:00
author: jsha
layout: post
guid: http://jacob.hoffman-andrews.com/README/?p=51
permalink: /howto-encrypt-an-existing-home-directory-on-ubuntu-karmic-koala/
categories:
  - Uncategorized
---
[Karmic Koala](https://wiki.ubuntu.com/KarmicKoala), the latest release of Ubuntu, made it really easy for new installs to use encryption for home directories.  However, for users who upgraded from previous releases (Jaunty Jackalope, Intrepid Ibex, etc), the process to encrypt an existing home directory is not so obvious.  Here&#8217;s one way to do it.

You&#8217;ll need enough free space for two copies of your entire home directory. If you don&#8217;t have that, first move your existing home directory onto external media, and modify these instructions as appropriate.

First, log out of your normal account, which we&#8217;ll term **myrealusername**. Login as root. Create a new, temporary user, using the &#8211;encrypt-home flag to adduser.  Use the same password as your current user account.<div class=instructions># adduser &#8211;encrypt-home tmpuser


  
\***\***\***\***\***\***\***\***\***\***\***\***\***\***\***\***\***\***\***\***\***\***\***\***
  
YOU SHOULD RECORD YOUR MOUNT PASSPHRASE AND STORE IT IN A SAFE LOCATION.
  
ecryptfs-unwrap-passphrase ~/.ecryptfs/wrapped-passphrase
  
THIS WILL BE REQUIRED IF YOU NEED TO RECOVER YOUR DATA AT A LATER TIME.
  
\***\***\***\***\***\***\***\***\***\***\***\***\***\***\***\***\***\***\***\***\***\***\***\***</p> 

Done configuring.

Enter new UNIX password: **USE YOUR EXISTING PASSWORD**
  
Retype new UNIX password:
  
No password supplied
  
Enter new UNIX password:
  
Retype new UNIX password:
  
passwd: password updated successfully
  
Changing the user information for tmpuser
  
Enter the new value, or press ENTER for the default
  
Full Name []:
  
Room Number []:
  
Work Phone []:
  
Home Phone []:
  
Other []:
  
Is the information correct? [Y/n] </div> 

When you ran &#8216;adduser&#8217;, it created two important directories: /home/.ecryptfs/tmpuser/.Private and /home/.ecryptfs/tmpuser/.ecryptfs. These are both symlinked into a skeleton home directory at /home/tmpuser. I say skeleton here, because the directory so created is only ever visible when &#8216;tmpuser&#8217; is logged out. Once &#8216;tmpuser&#8217; is logged in, the contents of /home/.ecryptfs/tmpuser/.Private are decrypted and mounted _on top of_ /home/tmpuser. We want the same thing to happen for **myrealusername**. Before we put the skeleton directory in place, however, we want to move your existing, unencrypted home aside. That way when you log in with an encrypted home it isn&#8217;t hidden and we&#8217;re able to copy files into your new, encrypted home.<div class=instructions># mv /home/

**myrealusername** /home/**myrealusername**.orig </div> 

Now you want to copy these skeleton files to /home/.ecryptfs/**myrealusername** and change the ownership:<div class=instructions># REALUSER=

**myrealusername**
  
\# cd /home
  
\# mkdir -m 0700 $REALUSER
  
\# cp -r .ecryptfs/tmpuser .ecryptfs/$REALUSER
  
\# chown -R $REALUSER.$REALUSER .ecryptfs/$REALUSER $REALUSER
  
\# ln -s /home/.ecryptfs/$REALUSER/.* $REALUSER/ </div> 

You also need to edit a mount description file which still refers to &#8216;tmpuser&#8217;:<div class=instructions># sed -i s/tmpuser/$REALUSER/ .ecryptfs/$REALUSER/.ecryptfs/Private.mnt </div> 

Just for good measure we&#8217;ll copy the two informational symlinks from the skeleton directory. These are handy because if they show up when you&#8217;re logged in, you know something went wrong and you&#8217;re not accessing your encrypted home dir.<div class=instructions># cp tmpuser/* $REALUSER/


  
\# chown $REALUSER.$REALUSER $REALUSER/* </div> 

At this point, you&#8217;re ready to log in as **myrealusername**. Go ahead. I&#8217;ll wait.

Got it? You should have a mostly empty home directory. If you have a file named Access-Your-Private-Data.desktop, something went wrong.

If all&#8217;s well, copy your original home directory into the new, encrypted home directory. It&#8217;s best to do this as root, on the off chance you have some files in your home dir which you don&#8217;t own, but want to preserve exactly. You may be tempted to do this as an &#8216;mv&#8217; if you&#8217;re low on disk space. That should work just the same, but it won&#8217;t actually unlink the original until \*everything\* is copied, meaning you still need enough space for two copies of your home dir. In a pinch you could move one subdirectory at a time, which means you don&#8217;t need as much spare space.

Note the trailing slashes on the rsync &#8211; those are important.<div class=instructions>

**myrealusername**$ su
  
\# rsync -av /home/**myrealusername**.orig/ /home/**myrealusername**/ </div> 

Bingo! Your home directory is now encrypted. Once you&#8217;re satisfied that everything is there, don&#8217;t forget to remove your original, unencrypted home. To be tidy you may want to delete the &#8216;tmpuser&#8217; account too.<div class=instructions># rm -rf /home/

**myrealusername**.orig
  
\# userdel -r tmpuser </div>