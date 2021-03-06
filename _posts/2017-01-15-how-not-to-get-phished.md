---
title: How Not To Get Phished
date: 2017-01-15T11:13:31+00:00
author: jsha
layout: post
---

#### Password managers are your best defense against phishing, and phishing is one of the best reasons to use a password manager.

A [clever phishing campaign](https://www.wordfence.com/blog/2017/01/gmail-phishing-data-uri/?utm_source=list&utm_campaign=011217&utm_medium=email) is making the rounds, using a `data:text/html` URI to disguise itself. The usual advice is also making the rounds in its wake, suggesting that everyone learn exactly what to look for in the URL bar before typing a password. I’d like to propose a much more effective and systematic fix instead:

Forget your passwords. No, really&mdash; forget them, and instead use a password manager with autofill.

Backing up a bit: Phishing is what happens when someone tricks you into typing the right password into the wrong website. Unfortunately, it’s all too easy to fall victim to phishing, because it takes advantage of a mismatch between what humans are good at and what computers are good at.

Computers are very good at comparing two things to see if they are exactly equal. If you ask a computer whether `www.paypal.com` and `ww.wpaypal.com` are the same site, it can easily determine that they are different, unrelated sites. Most humans can tell the difference most of the time, but if they are tired, or stressed, or in a rush, or have any number of other common obstacles to computer use, there's a good chance they won't notice the difference, will type their password into the wrong site, and will have their account taken over by bad guys.

As an individual, your entire defense against phishing hinges on the ability to make that distinction with the same inhuman perfection your computer does: before you type your password into a web site, you need to check the URL bar of your browser to make sure the domain name is exactly correct, and do it with 100% accuracy.

Fortunately, there's a better way: Use a password manager with autofill, and generate unique, complex passwords for every site. When a password manager fills in a password for you on a site, it will only fill in passwords that match that site's domain name. If you land on a lookalike domain name as part of a phishing attack, it will not fill in any passwords, because that lookalike domain name isn't an exact match for any of your saved passwords.

Faced with a password manager that is refusing to fill in a password, you may, in a weaker moment, go ahead and type in your password anyhow. This is why it's also important to use a unique, complex password for every site, ideally one randomly generated by your password manager. You want to make it impossible to remember your passwords, so you have to rely on your computer to autofill them.

## Saving passwords in the browser

Some outdated security advice recommends against using your browser's built-in saved passwords list. This advice is typically intended to defend against someone with in-person access to an unlocked computer. These days, phishing is a much more common attack than in-person access, and screen lock passwords are much more ubiquitous, so the tradeoff is different.

Since a browser's saved password list is effectively a built-in password manager, it's a good defense against phishing. The main thing browsers lack in the password management department is an easy way to generate random passwords, though [Chrome is working on it](https://www.chromium.org/developers/design-documents/password-generation). Browsers also tend to lack some of the fancier features of dedicated password managers, like auditing your passwords for quality, or automatically changing them. That said, they have the important advantage of already being installed.

## Vulnerabilities in password manager extensions

In July and August of 2016, [Tavis Ormandy](https://twitter.com/taviso) investigated password managers, and quickly [found](https://bugs.chromium.org/p/project-zero/issues/detail?id=884) [several](https://bugs.chromium.org/p/project-zero/issues/detail?id=888) [critical](https://bugs.chromium.org/p/project-zero/issues/detail?id=890) [vulnerabilities](https://bugs.chromium.org/p/project-zero/issues/detail?id=917), which were then fixed.  These vulnerabilities demonstrated the unfortunate truth that software marketed for security purposes often introduces its own security flaws.

This doesn't mean you should avoid password managers altogether. For most users, the benefit from using a password manager with autofill features is so large that it outweighs the risks from installing additional software that may be vulnerable. But it all depends on your estimation of how vulnerable the common password manager extensions are. The presence of past vulnerabilities is not always a good predictor of software quality, so it's hard to say. Using a browser's built-in password manager is probably a fairly safe bet, since browser security teams are generally larger and better-funded than password manager companies.

## Two-factor authentication

2FA is also commonly touted as a strong defense against phishing. It can be, but as [Bruce Schneier pointed out in 2005](https://www.schneier.com/blog/archives/2005/04/more_on_twofact.html), any 2FA that depends on the user typing in a secondary code (as most 2FA implementations today do) can be defeated by a phishing site that simply asks for the code and passes it along to the real site. So using a password manager with autofill and random passwords is actually a stronger phishing defense than most common two-factor authentication.

The recent [Universal 2nd Factor](https://en.wikipedia.org/wiki/Universal_2nd_Factor) (U2F) standard solves this problem by requiring a small hardware device (a "security key") that you insert instead of typing in a secondary code. Your browser talks to the security key, and includes the identity of the site you're trying to log into, so if you are trying to log into a phishing site, the security key will not send any data that could be used to log into your real account. This technique offers much stronger security, but is currently implemented only by a small number of browsers and sites, and requires purchase of an extra device.
