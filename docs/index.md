---
title: Whitespace Hider for GitHub
---

# Whitespace Hider for GitHub

<div class="hero">
  <img class="hero-icon" src="assets/icon-256.png" alt="" width="112" height="112">
  <div class="hero-text">
    <p class="hero-title" role="heading" aria-level="1">Whitespace Hider for GitHub</p>
    <p class="hero-tagline">A Safari extension for iPhone, iPad and Mac that turns on "Hide
    whitespace" by default on GitHub pull request diffs.</p>
  </div>
</div>

[Get it free on the App Store](https://apps.apple.com/app/id6827008239){ .app-store }

GitHub shows whitespace-only changes in pull request diffs unless you tick "Hide whitespace"
each time. This extension adds `?w=1` to a pull request's "Files changed" URL when the URL
doesn't set `w` already, which is the same thing GitHub does when you tick the box.

To see whitespace changes on a particular pull request, untick "Hide whitespace" in GitHub's
diff settings. GitHub then loads the page with `w=0`, and the extension leaves it alone.

The extension runs only on github.com and doesn't collect any data. See the
[privacy policy](privacy.md) for details, and [support](support.md) for setup help and how to
report a problem.
