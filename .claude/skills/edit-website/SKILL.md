---
name: edit-website
description: Conventions for editing the FRAMA Industrial Supply website. Use whenever changing markup, styles, copy, layout, or scripts in index.html — the single-file static site for framaindustrialmx.github.io.
---

# Edit the FRAMA Industrial Supply website

This repository is a **single-file static website** served via GitHub Pages at
`framaindustrialmx.github.io`. Everything lives in `index.html`: markup, an
embedded `<style>` block, and an embedded `<script>` block. There is no build
step, bundler, or framework.

## Project facts

- **Language:** All user-facing copy is in **Spanish (es)**. Keep `<html lang="es">`.
- **Audience:** Industrial supply for maquiladoras and companies (MRO, empaques,
  adhesivos, PPE, herramientas, etc.).
- **Font:** Google Fonts **Inter** (weights 400–800), loaded via `<link>` in `<head>`.
- **Single source of truth:** `index.html` at the repo root. Do not split into
  multiple files unless the user explicitly asks.

## Page structure

The body is organized into these sections (keep the order and the section comments):

```
<!-- NAV -->     navigation bar
<!-- HERO -->    headline / call to action
<!-- SERVICIOS --> services
<!-- CATALOGO -->  product catalog (rendered from JS data — see manage-catalog skill)
<!-- NOSOTROS -->  about us
<!-- CONTACTO -->  contact
<!-- FOOTER -->
```

The `<script>` block is organized into:
- `// DATA` — `CATEGORIES` and `PRODUCTS` arrays
- `// RENDER, FILTROS Y ACCIONES` — catalog rendering, filters, CSV export, `mailto:` and WhatsApp actions
- `// TESTS` — `runTests()`, called on load

## Conventions

- Keep CSS in the single `<style>` block; prefer CSS custom properties / variables
  for colors and spacing so the theme stays consistent.
- Keep the page **responsive**: it already uses `width=device-width` viewport.
- Preserve the section comment markers — they document the layout.
- Keep copy in Spanish and consistent with the existing tone.
- Validate your HTML structure (balanced tags, valid attributes) before finishing.

## After editing

- If you touched catalog data, also follow the **manage-catalog** skill.
- The page calls `runTests()` on load. Make sure your change doesn't break those
  assertions (open `index.html` in a browser and check the console for failures).
- To publish, follow the **deploy-pages** skill.
