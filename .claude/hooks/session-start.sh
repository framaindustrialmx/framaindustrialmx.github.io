#!/bin/bash
set -euo pipefail

# SessionStart hook for framaindustrialmx.github.io
#
# This is a plain static GitHub Pages site (a single index.html with embedded
# CSS/JS). There is no dependency manifest, build step, or test runner, so there
# is nothing to install. This hook does a lightweight readiness check and stays
# future-proof: if a Node toolchain (package.json) is ever added, it installs it.

# Only run setup in the remote (Claude Code on the web) environment.
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

cd "$CLAUDE_PROJECT_DIR"

# Future-proof: install dependencies if a Node toolchain is introduced later.
if [ -f package.json ]; then
  npm install
fi

# Readiness check: confirm the site entry point exists.
if [ -f index.html ]; then
  echo "index.html present — static site ready."
else
  echo "Note: index.html not found yet (site is still a scaffold)."
fi
