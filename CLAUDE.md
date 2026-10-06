# jacobmontgomery.com — Personal Academic Website

## Project overview
Professional academic website for Jacob Montgomery, Professor of Political Science at Washington University in St. Louis. Built with Hugo Blox (academic-cv template), hosted on GitHub Pages at `jacobmontgomery.com` (live, HTTPS enforced).

## Key facts
- GitHub repo: `jmontgomery/jmontgomery.github.io`, branch `master`
- Custom domain `jacobmontgomery.com` set in Pages settings (DNS: A records → GitHub IPs; www CNAME → apex). No CNAME file in repo.
- `politicaldatascience.com` is a separate site. Old site archive: private repo `jmontgomery/old-website`; old sites.wustl.edu page being retired.

## Build & deploy
- Local preview: `hugo server` → http://localhost:1313 (the dev server occasionally crashes with a watcher panic under heavy file churn — just restart it)
- Deploy: push to `master` → `.github/workflows/deploy.yml` (GitHub Actions, Pages build_type=workflow). The deploy & build workflows BOTH watch `branches: ['master']` — do not change to `main` (there is no main branch).
- CI Hugo version pinned in `hugoblox.yaml` — keep it matching the local Hugo version (template partials require >= 0.163).
- Package manager is pnpm (`pnpm-lock.yaml`); do not add a package-lock.json.

## Domain + Pages setup (don't break this)
- Custom domain `jacobmontgomery.com` is configured in GitHub Pages (`gh api repos/.../pages`), not via a CNAME file in the repo. HTTPS is enforced.
- DNS at the registrar (GoDaddy): A records on `@` → `185.199.108.153 .109.153 .110.153 .111.153` (GitHub Pages IPs); CNAME on `www` → `jmontgomery.github.io`. No forwarding rule — the old one pointed at sites.wustl.edu/montgomery.
- `jmontgomery.github.io` 301-redirects to the custom domain; this is correct.
- If the live site breaks after a push: check `gh run list --workflow=deploy.yml` first; the workflow failing is almost always the issue, not DNS.
- To temporarily serve the raw site at `jmontgomery.github.io` (e.g. to view before DNS fixes), clear the Pages cname via API, trigger a redeploy, then re-set the cname when done.

## Hugo Blox template override paths
Local overrides live at (mounts defined in `hugo.yaml`; do NOT use `layouts/blox/`):
- `layouts/_partials/views/` — card, citation view templates
- `layouts/_partials/hbx/blocks/` — portfolio, content-collection, team-showcase, resume-biography-3 overrides
- `layouts/_partials/page_author_card.html` — author bylines render as plain text (no /authors/ pages exist)
- `layouts/_partials/hooks/head-end/custom-styles.html` — JSON-LD Person schema + custom CSS (teaching, CTA, course quotes, mobile overrides — see below)

Key customizations the theme does NOT do out of the box:
- **portfolio block**: card figures use `.Fit` + `object-contain` (not `.Fill` + `object-cover`) so they aren't cropped. Each card's `allowed_filters` list is augmented with `"*"` so a `*` activeFilter shows everything — the mobile default relies on this.
- **portfolio block mobile**: filter pill row is hidden (`hidden md:flex`) and mobile `activeFilter` defaults to `"*"` via `window.matchMedia`. A scheduled job replaces this with a dropdown; when it lands, remove both.
- **card view**: supports `show_image: false` design flag (used on software page). `object-cover` not `object-fill`.
- **team-showcase**: member name/photo links go to the "Website"-labeled link only (no `/authors/<slug>/` pages exist in this site).
- **resume-biography-3**: CV buttons + visible email appear ABOVE the bio (user intent: CV is the primary action). Avatar wrapper has fixed inline sizing — any mobile size override must target `.avatar-wrapper`, not just the inner `img.avatar`, or the box will overflow and shift the circle off-center.

## Mobile overrides (in custom-styles.html)
Narrow screens get specific overrides that must survive future template edits:
- `@media (max-width: 639px)`: homepage avatar wrapper + img forced to 300×300; social icon buttons shrink from 48px → 36px (icons 1.1rem).
- Research page (portfolio override, inline): filter row hidden `md:` and up only; `activeFilter` chosen at runtime based on viewport width.
When editing the homepage layout or portfolio block, re-verify on a narrow viewport (<640px) before pushing — the mobile customizations are brittle to upstream template changes.

## Research page (`content/research/_index.md`)
1. `portfolio` block (id: papers) — cards with filter buttons: Featured, Published, Working Papers | methods: AI/Machine Learning, Bayesian Statistics, Causal Inference, Measurement/Surveys, Research Design, Text/Image | topics: AI & Politics, American Politics, Comparative Politics, Political Communication, Public Opinion/Behavior
2. `content-collection` (id: citation-list) — "Citations for Published Work", citation view, reverse-chron (`sort_by: Date`), `filters.exclude_publication_type: preprint` (the block supports only the singular `publication_type`/`exclude_publication_type` keys)

## Publications (`content/publications/<slug>/index.md`)
~56 entries; every card has a `featured.png/jpg` image (figure from the paper, title-block screenshot, or book cover) with `image.preview_only: true`. Abstracts are verbatim from the published papers. 31 entries have verified Replication/Code links.
- Structured venue YAML (`publication.name/short_name/volume/issue/pages`); quote names containing colons.
- PDFs in `static/uploads/papers/` named `{firstauthor}{year}-{short-title}.pdf`.
- Venue display: always `resolve_publication` partial, never pipe the publication map to markdownify.
- **NEVER post working-paper/draft PDFs or link them unless Jacob explicitly says to post that specific paper** (see memory). Draft PDFs live OUTSIDE the repo in `~/Documents/working-papers-drafts/`. Working papers use `publication_types: [preprint]`.
- Featured = `featured: true` + `Featured` tag (currently: top-3 poli sci journal papers, AI papers, NeurIPS, book, Ends Against the Middle, PNAS papers, ying2022, Kim PSRM, Park PSRM, Congressional staff networks).

## CVs (`cv/*.tex`)
- Source of truth: `cv/jmmCV-July2026.tex` (long) and `cv/jmmCV-short-July2026.tex` (2 pages — must stay 2 pages).
- Build: `pdflatex` twice; deploy by copying PDFs to `static/uploads/cv/jmmCV[-short]-MM-DD-YYYY.pdf` and updating the homepage button URLs in `content/_index.md`. Compiled PDFs are gitignored in `cv/`.
- `\student{}` marks WashU student co-authors (long CV). Keep titles/authors/citations in sync with publication pages (site is ground truth).

## Lab page
`team-showcase` block + `data/authors/*.yaml`. Alumni show current positions; links list (Google Scholar/Website/LinkedIn) renders as icons; names/photos link to the "Website" entry. Avatars: `assets/media/authors/<slug>.jpg`.

## Other pages
- Teaching: hand-built HTML in markdown block; no colons/em-dashes in course blurbs; student eval pull quotes (never publish eval numbers — see memory on eval handling)
- Homepage: resume-biography-3 (visible email under CV buttons) + CTA block (Join Our Lab → /lab/#join, Support Our Research → /support/)
- Software, Support: built. Blog: scaffolded, no posts yet.

## Remaining TODOs
- Hongyu Yu headshot (none exists online — waiting on Jacob)
- Replication archives: montgomery2022 (JOP) and xu2026 data/code, if located
- PolAds2 (edelson2026b) author order needs confirmation; xi2026 + edelson2026b PDFs are blinded review copies — swap when unblinded versions available
- lee2024 local PDF is the arXiv preprint; swap for ACM camera-ready if desired
- Blog posts (incl. accessible adaptive-inventories explainer); letter-of-recommendation page
- Old drafts remain in git HISTORY (removed from HEAD 2026-10-05); full purge needs git filter-repo + force push if desired
