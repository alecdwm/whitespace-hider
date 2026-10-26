<h1 align="center">
  <img src="extension/images/icon-256.png" alt="" width="112"><br>
  Whitespace Hider for GitHub
</h1>

<p align="center">
  Safari extension that turns on "Hide whitespace" by default on GitHub pull
  request diffs (<code>/pull/&lt;n&gt;/files</code> and <code>/pull/&lt;n&gt;/changes</code>).<br>
  <a href="https://apps.apple.com/app/id6827008239">App Store</a> ·
  <a href="https://whitespacehider.shirls.org/">Website</a> ·
  <a href="https://whitespacehider.shirls.org/privacy/">Privacy</a> ·
  <a href="https://whitespacehider.shirls.org/support/">Support</a>
</p>

It adds `?w=1` to those URLs when `w` isn't already set. Unticking "Hide
whitespace" makes GitHub load the page with `w=0`, which the extension leaves
alone, so you can still show whitespace on a particular PR.

## Install

Get it free from the [App Store](https://apps.apple.com/app/id6827008239) for iPhone,
iPad and Mac. Then turn the extension on and allow it on github.com: in
Settings → Apps → Safari → Extensions on an iPhone or iPad, or in Safari →
Settings → Extensions on a Mac.

## Building

You need a Mac with Xcode 27 or later. The app icon uses Icon Composer 27
features that older versions can't compile.

1. Open `Whitespace Hider for GitHub/Whitespace Hider for GitHub.xcodeproj`.
2. Under Signing & Capabilities, set your Team on all four targets (a free
   Apple ID works). The bundle IDs `org.shirls.whitespacehider` and
   `org.shirls.whitespacehider.Extension` belong to another team, so change
   their `org.shirls` prefix to your own.
3. Pick the "Whitespace Hider for GitHub (iOS)" or "(macOS)" scheme and a
   device, then press Run (⌘R).
4. Turn the extension on and allow it on github.com: in Safari → Settings →
   Extensions on a Mac, or in Settings → Apps → Safari → Extensions on an
   iPhone or iPad.

`Whitespace Hider for GitHub/Shared (Extension)/Resources` holds a copy of
`extension/`. Copy your changes into it before building.

With a free Apple ID, apps installed from Xcode stop launching after 7 days
and have to be rebuilt.
