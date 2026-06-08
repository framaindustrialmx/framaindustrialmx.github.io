---
name: deploy-pages
description: Publish the FRAMA Industrial Supply site to GitHub Pages. Use when the user wants to deploy, publish, release, or push the site live for framaindustrialmx.github.io.
---

# Deploy to GitHub Pages

`framaindustrialmx.github.io` is a **GitHub user/organization Pages site**. Because
the repository is named `<owner>.github.io`, GitHub Pages serves the site
**directly from the root of the default branch** — there is no build pipeline and
no `gh-pages` branch to manage. Publishing = getting the right files onto the
default branch.

## Pre-flight checks

1. `index.html` must exist at the **repository root** (Pages serves `index.html`
   from root as the homepage).
2. All asset/links are root-relative or absolute (the site lives at the domain root).
3. Open `index.html` locally and confirm `runTests()` reports no failures in the
   browser console.

## Publish

> Note: in this session you develop on a feature branch (e.g.
> `claude/...`). Deployment to the **default branch** is the user's call — do not
> push to the default branch without explicit permission.

Once the user approves publishing:

1. Commit the changes with a clear message.
2. Merge / push to the **default branch** (the one configured under
   Settings → Pages, usually `main`).
3. GitHub Pages rebuilds automatically within ~1 minute.
4. Verify the live site at https://framaindustrialmx.github.io and hard-refresh
   (Ctrl/Cmd+Shift+R) to bypass cache.

## Optional: custom domain

If a `CNAME` file is present at the root, Pages serves the site from that custom
domain. Don't add or remove `CNAME` unless the user asks.

## Troubleshooting

- **404 / old content:** Pages caches aggressively; wait a minute and hard-refresh.
- **Blank page:** check the browser console for JS errors from the `<script>` block.
- **Pages not building:** confirm the correct branch/folder under
  Settings → Pages, and that `index.html` is at the root.
