# A Well-Known URL for Changing Passwords

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Table of Contents

- [Proposal](#proposal)
- [Frequently Asked Questions](#frequently-asked-questions)
  - [Why not allow sites to override this location with an HTTP Link header or an HTML `link` element?](#why-not-allow-sites-to-override-this-location-with-an-http-link-header-or-an-html-link-element)
  - [Why not serve a JSON resource with links to other account management functions?](#why-not-serve-a-json-resource-with-links-to-other-account-management-functions)
  - [What tools have implemented this feature?](#what-tools-have-implemented-this-feature)
  - [What about servers whose HTTP response codes are unreliable?](#what-about-servers-whose-http-response-codes-are-unreliable)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

Currently, if the user of a password manager would like to change their password on `example.com`, basically all the password manager can do is load `example.com` in a browser tab and hope the user can figure out how to update their password themselves.

The goal of this [specification](https://w3c.github.io/webappsec-change-password-url/) is to do the simplest possible thing to improve this situation, by defining the <code>/.well-known/change-password</code> [well-known resource](https://tools.ietf.org/html/rfc5785).

## Proposal

`example.com` provides a `/.well-known/change-password` resource which redirects to their change password form, wherever it happens to already be.

Password managers check for the existence of `/.well-known/change-password` on `https://example.com`.

If it's there (the response code is `2xx` or `3xx`), the password manager can cause the user's browser to navigate there when the user indicates they'd like to change their password.

That's it, really. It's a pretty simple idea.

## Frequently Asked Questions

### Why not allow sites to override this location with an HTTP Link header or an HTML `link` element?

Implementation complexity. (This would require keeping site-specific state client-side, verifying & invalidating said state periodically, etc.)

### Why not serve a JSON resource with links to other account management functions?

Specification complexity. If we determine we need other account management well-known resources in the future, we can specify them then.

### What tools have implemented this feature?

* iCloud Keychain on iOS 12
* Safari 12
* 1Password (1Password 8 and 1Password for Chrome, Firefox, Edge and macOS Safari)
* Chrome 86
* [Backdrop CMS](https://backdropcms.org/), via the [Well-known module](https://backdropcms.org/project/well_known).

### What about servers whose HTTP response codes are unreliable?

Sometimes, HTTP servers are configured to respond `200 OK` for resources that really aren't there. The [Detecting the reliability of HTTP status codes](https://w3c.github.io/webappsec-change-password-url/response-code-reliability.html) draft attempts to address this problem.
