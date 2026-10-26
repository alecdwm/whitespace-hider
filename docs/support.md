# Support

Report problems and ask questions in the
[GitHub issues](https://github.com/alecdwm/whitespace-hider/issues). Include your device,
iOS, iPadOS or macOS version, and a link to a pull request where the problem shows up, if it's
public.

## Turning the extension on

Install the app from the [App Store](https://apps.apple.com/app/id6827008239) first, then:

- **iPhone and iPad:** open Settings → Apps → Safari → Extensions → Whitespace Hider for
  GitHub, turn it on, and allow it on github.com.
- **Mac:** open Safari → Settings → Extensions, tick Whitespace Hider for GitHub, and allow it
  on github.com.

## Showing whitespace on one pull request

Untick "Hide whitespace" in the diff settings on the pull request's "Files changed" tab. GitHub
loads the page with `w=0` in the URL, and the extension doesn't change URLs that set `w`.

## Whitespace changes still show

Open a pull request's "Files changed" tab and look at the URL.

- **No `w=1` in the URL:** the extension isn't running on the page. Check that it's turned on
  and allowed on github.com, as above.
- **`w=1` is in the URL:** GitHub isn't applying the setting on that page. Please open an issue
  with a link to the pull request.
