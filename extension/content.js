// Adds ?w=1 (GitHub's "Hide whitespace" setting) to pull request diff URLs
// that don't set w at all. An explicit w=0, which GitHub sends when the
// checkbox is unticked, is left alone so whitespace can still be shown.

const PR_DIFF_PATH = /^\/[^/]+\/[^/]+\/pull\/\d+\/(files|changes)(\/|$)/;

function withHideWhitespace(href) {
  const url = new URL(href, location.href);
  if (url.origin !== location.origin) return null;
  if (!PR_DIFF_PATH.test(url.pathname)) return null;
  if (url.searchParams.has("w")) return null;
  url.searchParams.set("w", "1");
  return url.href;
}

// Rewrite the current page if it is a diff without w set.
function checkLocation() {
  const target = withHideWhitespace(location.href);
  if (target) location.replace(target);
}

// Rewrite links to diff pages so clicking "Files changed" lands on the
// whitespace-hidden view directly instead of loading and then redirecting.
function rewriteLinks(root) {
  if (!root.querySelectorAll) return;
  for (const a of root.querySelectorAll('a[href*="/pull/"]')) {
    const target = withHideWhitespace(a.getAttribute("href"));
    if (target) a.href = target;
  }
}

checkLocation();

// GitHub navigates without full page loads, and a content script can't hook
// the page's history.pushState, so poll for URL changes.
let lastHref = location.href;
setInterval(() => {
  if (location.href !== lastHref) {
    lastHref = location.href;
    checkLocation();
  }
}, 300);
window.addEventListener("popstate", checkLocation);
document.addEventListener("turbo:load", checkLocation);

new MutationObserver((mutations) => {
  for (const m of mutations) {
    for (const node of m.addedNodes) {
      if (node.nodeType === Node.ELEMENT_NODE) rewriteLinks(node);
    }
  }
}).observe(document, { childList: true, subtree: true });

document.addEventListener("DOMContentLoaded", () => rewriteLinks(document));
