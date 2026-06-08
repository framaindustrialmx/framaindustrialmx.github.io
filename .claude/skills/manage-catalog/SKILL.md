---
name: manage-catalog
description: Add, edit, or remove products and categories in the FRAMA Industrial Supply catalog. Use when changing the CATEGORIES or PRODUCTS data in index.html, or anything that affects catalog rendering, filtering, CSV export, or the quote/WhatsApp actions.
---

# Manage the product catalog

The catalog on `framaindustrialmx.github.io` is **data-driven**. The
`<!-- CATALOGO -->` section in `index.html` is rendered at runtime from two
JavaScript arrays in the `// DATA` part of the `<script>` block:

- `CATEGORIES` — the list of product categories used for filters.
- `PRODUCTS` — the list of products shown in the catalog.

Editing the catalog means editing these arrays — **do not** hand-edit the
rendered DOM.

## Workflow

1. Open `index.html` and find the `// DATA` section inside `<script>`.
2. Edit `CATEGORIES` and/or `PRODUCTS` following the existing object shape exactly
   (match the keys already used by the other entries — e.g. id/name/category/etc.).
3. Make sure every product's category references a value that exists in
   `CATEGORIES`, so filters keep working.
4. Keep all text in **Spanish**, consistent with existing entries.
5. Keep ids/keys unique.

## Things tied to the data — don't break them

These features in the `// RENDER, FILTROS Y ACCIONES` section consume the data:

- **Filtering** by category (relies on category values matching `CATEGORIES`).
- **CSV export** (column order/keys depend on the product shape).
- **`mailto:` quote** and **WhatsApp** actions (build messages from product fields).

If you add a new field to products, check whether render, filters, CSV, and the
quote/WhatsApp builders need updating too.

## Verify

The `// TESTS` section runs `runTests()` on page load and checks catalog
integrity, URLs, and CSV output. After editing the data, open `index.html` in a
browser and confirm there are **no failures in the console**. Then publish with
the **deploy-pages** skill.
