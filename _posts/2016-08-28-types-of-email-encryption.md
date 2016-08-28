---
title: The Three Types of Email Encryption
author: jsha
layout: post
---

There are three types of encryption relevant to email:

 - SMTP STARTTLS: This is server-to-server, and is implemented by your email provider, not you as an end user. Uses SSL certificates.
 - S/MIME: This is person-to-person, and is implemented by you. Uses email certificates.
 - PGP: Person-to-person, implemented by you. Doesn't use certificates, uses PGP-format public keys. Includes both inline PGP and PGP/MIME.

Note that there's a difference between SSL certificates and email certificates.
The first identifies a server, and can be used for HTTPS, or SMTP STARTTLS, or a
number of other TLS (aka SSL) protocols. The second identifies a specific email
address.

[Some CA pages](https://www.instantssl.com/ssl-certificate-products/free-email-certificate.html)
use the phrase "SSL email certificate," but as far as I know the "SSL" part
of that is inaccurate. They appear to be offering email certificates on that page.

S/MIME and PGP are more or less mutually exclusive in that you'd receive and
send encrypted mail using one or the other. And most likely your mail software
is easiest to configure one way or the other.  However, it's entirely a matter
of local configuration. Just the act of getting an email certificate for use
with S/MIME doesn't prevent you from using PGP, but installing it may lead your
email client to think you want to use S/MIME rather than PGP.

Note that an email certificate for S/MIME is like your public key for PGP. It
tells other people how they can encrypt mail to you. It doesn't help you encrypt
mail to them. For that, you need *their* email certificate. My understanding is
that S/MIME encryption is most common within organizations, where there is a
shared infrastructure for fetching people's addresses and corresponding
certificates. PGP is more common between people who don't work for the same
organization.

STARTTLS works at a different level. So long as STARTTLS is implemented by both your
email provider and the provider of the person you are sending mail to, your
email will be encrypted in transit between those two providers. However, each
email provider will be able read your messages. STARTTLS interoperates invisibly
with S/MIME, PGP, and unencrypted email.
