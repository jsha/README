---
title: Using Git Blame on Refactored or Reformatted Code
date: 2018-12-07T18:01:31+00:00
author: jsha
layout: post
---

If you want to know when or why a particular line of code was written, “git blame” is a powerful tool. However, very often you’ll find that “git blame” leads you to a routine refactor or reformatting of code, rather than the meaningful change you were looking for. Fortunately, there’s a fairly quick way to chase down the true origin of a line of code, using git blame’s revision argument and the ~ (parent) operator.

First, you run the normal “git blame” command. These examples are from the Signal Desktop repo.

```
$ export PAGER=less
$ git blame main.js
```

I’m interested in the commit that commented out “sandbox: true”, so I search for that using less’ “/” (search) operator.

```
1dd87ad19 (Daniel Gasienica 2018-04-27 17:25:04 -0400 215)         // sandbox: true,
```

Now I want to see what happened in that commit:

```
$ git show 1dd87ad19
commit 1dd87ad1971f86dc954bbfbf365673172a5ba990
Author: Daniel Gasienica <daniel@signal.org>
Date:   Fri Apr 27 17:25:04 2018 -0400

    Format all source code using Prettier
```

This is pretty clearly a reformat. If I want to be sure of what changed, I could use “/” (search) again to find the diff and check for myself.

Now I want to find: What was the commit that touched that line *before* that? In other words, if I stepped back to the commit one before `1dd87ad19`, what is the output of `git blame`? Fortunately git has a convenient syntax: `1dd87ad19~` (note the tilde) means “the commit one before `1dd87ad19`”. Also, `git blame` has a parameter that specifies the revision to look at. So instead of checking out the whole repo to `1dd87ad19~`, we just do:

```
$ git blame 1dd87ad19~ main.js
```

Searching for sandbox: true shows an earlier commit:

```
64fe9dbfb (Scott Nonnenberg 2018-01-08 13:19:25 -0800 187)       // sandbox: true,
```

Now we repeat the process:

```
$ git show 64fe9dbfb
commit 64fe9dbfb2ef3e8c9afbc78c9879ad596c3fb43b
Author: Scott Nonnenberg <scott@nonnenberg.com>
Date:   Mon Jan 8 13:19:25 2018 -0800

    Clean logs on start - and eslint/mocha with code coverage (#1945)
…
-      //sandbox: true,
-      preload: path.join(__dirname, 'preload.js')
+      // sandbox: true,
+      preload: path.join(__dirname, 'preload.js'),
```

This is another formatting diff, so we chase it further with

```
git blame 64fe9dbfb~ main.js
```

And so forth. Eventually, we get to the original commit, which has a meaningful explanation:

```
commit 77d5ef2f6888079356222fec96fa9bd155f28f7e
Author: lilia <liliakai@gmail.com>
Date:   Wed Apr 19 15:25:03 2017 -0700

    Add spellcheck
    
    As of Electron 1.6.5, this requires disabling the sandbox in order to
    get access to the `webFrame` api.
```    

It’s possible to speed up the process somewhat by piping the output of `git blame` through a grep for the thing of interest, but sometimes this doesn’t work as well if lines got split up at some point.

If files were renamed or split up at some point in the git history, this will show up in your `git show` commands. In that case you’ll need to change the name of the file that you pass to `git blame`.

Hopefully this helps you understand code bases faster. I’ve thought about writing a tool to semi-automate the process but haven’t come up with a great workflow. Let me know if you’ve got one!
