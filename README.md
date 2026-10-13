# Addai Yeboah Abraham | Flutter Developer

[![Checks](https://github.com/abraham-addai/abraham-addai.github.io/actions/workflows/checks.yml/badge.svg)](https://github.com/abraham-addai/abraham-addai.github.io/actions/workflows/checks.yml)

My portfolio: a one-page static site with my projects, experience, skills and CV.

**Live:** https://abraham-addai.github.io

Plain HTML, CSS and JavaScript. No framework, no build step, no third-party scripts. Light and dark themes, works without JavaScript (except the theme toggle).

## Run locally

Open `index.html` in a browser, or serve the folder (needed for `404.html`, which uses root paths):

```sh
npx serve .
```

## Project layout

```
index.html        the page
404.html          not-found page (GitHub Pages serves it automatically)
css/styles.css    design tokens, light and dark themes, components
js/main.js        theme toggle
assets/           images (WebP), og-image, favicon, CV
scripts/          check-todos.sh
docs/             spec, content (source of truth), tasks, decisions
```

All copy comes from `docs/CONTENT.md`. Edit that first, then the page.

## Checks

GitHub Actions (`.github/workflows/checks.yml`) runs on every push and pull request:

- HTML validation (`html-validate`)
- `scripts/check-todos.sh`: fails if any `TODO` marker is left on the page
- Link check (`lychee`). The live Flutter Web apps are checked separately and only warn, since they can be slow to respond.

Run them locally:

```sh
npx html-validate@8 index.html 404.html
sh scripts/check-todos.sh
```

## Deploy

GitHub Pages serves the `main` branch root. Push to `main` and the site updates in 1 to 2 minutes.

One-time setup: repo **Settings → Pages → Source: Deploy from a branch → Branch: `main`, folder `/ (root)` → Save**.

## Custom domain (later)

1. Add a `CNAME` file at the repo root containing the domain, e.g. `abraham.dev`.
2. Point the domain's DNS at GitHub Pages ([GitHub docs](https://docs.github.com/en/pages/configuring-a-custom-domain-for-your-github-pages-site)).
3. In `index.html`, replace `https://abraham-addai.github.io/` in the canonical link, `og:url`, `og:image`, `twitter:image` and the JSON-LD `url`.
4. Update `robots.txt` and `sitemap.xml` to the new domain.
5. In Settings → Pages, set the custom domain and tick **Enforce HTTPS**.

All internal links are relative, so nothing else changes.
