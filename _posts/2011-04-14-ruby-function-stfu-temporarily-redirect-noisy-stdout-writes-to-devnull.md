---
id: 101
title: 'Ruby function STFU: temporarily redirect noisy stdout writes to /dev/null'
date: 2011-04-14T14:45:20+00:00
author: jsha
layout: post
guid: http://jacob.hoffman-andrews.com/README/index.php/2011/04/14/ruby-function-stfu-temporarily-redirect-noisy-stdout-writes-to-devnull/
permalink: /ruby-function-stfu-temporarily-redirect-noisy-stdout-writes-to-devnull/
categories:
  - Uncategorized
---
This function is handy if you have some third-party gem that generates writes to stdout or stderr which you wish to suppress. Simple wrap your call to the noisy function in an \`stfu&#8217; block. If an exception is thrown, it will be reopened with stdout and stderr pointing to the console again.

<pre>def stfu
    begin
      orig_stderr = $stderr.clone
      orig_stdout = $stdout.clone
      $stderr.reopen File.new('/dev/null', 'w')
      $stdout.reopen File.new('/dev/null', 'w')
      retval = yield
    rescue Exception => e
      $stdout.reopen orig_stdout
      $stderr.reopen orig_stderr
      raise e
    ensure
      $stdout.reopen orig_stdout
      $stderr.reopen orig_stderr
    end
    retval
  end

  require 'some_noisy_gem'
  stfu do
    some_function_that_generates_a_lot_of_cruft_on_stdout
  end
</pre>