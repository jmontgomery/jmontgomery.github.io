# jacobmontgomery.com — Personal Academic Website

## Project overview
Professional academic website for Jacob Montgomery, Professor of Political Science at Washington University in St. Louis. Hosted on GitHub Pages at `jacobmontgomery.com`. Built with Hugo Blox (formerly Wowchemy/Hugo Academic).

## Key facts
- GitHub repo: `jmontgomery/jmontgomery.github.io`
- Custom domain: `jacobmontgomery.com` (configured via CNAME)
- This is a complete rebuild from the old R Markdown site
- Note: `politicaldatascience.com` is now a separate site
- Archive of old site: private GitHub repo at `https://github.com/jmontgomery/old-website`

## Tech stack
- Hugo (static site generator)
- Hugo Blox (academic theme)
- GitHub Pages (hosting)

## Development workflow
- Edit source files locally in this directory
- Build: `hugo` (generates `public/` directory)
- Deploy: push to GitHub (GitHub Pages serves from `main` branch)

## Directory structure (Hugo Blox)
- `content/` — all page content (.md files)
- `config/` — Hugo configuration files
- `assets/` — images, custom CSS
- `static/uploads/cv/` — long CV and short CV PDFs
- `static/uploads/papers/` — paper PDFs
- `static/uploads/talks/` — slides and talk materials
- `static/uploads/teaching/` — syllabi and course materials (add per-course subdirs as needed)
- `public/` — generated output (do not edit manually)

## Hugo Blox template override paths
Hugo Blox mounts its own partials under `blox/` in its module. Local overrides live at:
- `layouts/_partials/views/` — card, citation, etc. view templates
- `layouts/_partials/hbx/blocks/` — block templates (e.g. portfolio/block.html)
- `layouts/_partials/hooks/head-end/custom-styles.html` — inject custom CSS
The mount path is defined in `hugo.yaml` under `module.mounts`. Do NOT use `layouts/blox/`.

## Research page architecture (`content/research/_index.md`)
Five blocks in order:
1. `markdown` (id: `research-subnav`) — sticky anchor nav with links to each section
2. `content-collection` (id: `featured`) — featured papers, card view, 3-col grid
3. `content-collection` (id: `working-papers`) — preprint type, card view, 3-col grid
4. `portfolio` (id: `browse-by-topic`) — tag filter buttons (see current tag list below)
5. `content-collection` (id: `all-publications`) — citation view, sorted by date

CSS for 3-col grid is in `custom-styles.html` targeting `#featured .grid` and `#working-papers .grid`.

## Publication content files (`content/publications/<slug>/index.md`)
~55 total: ~12 featured, ~8 working papers (preprint type), rest featured: false.
Structured publication YAML format used throughout:
```yaml
publication:
  name: American Political Science Review
  short_name: APSR
  volume: "115"
  issue: "3"
  pages: 800-815
```
WARNING: publication names with colons must be quoted, e.g. `name: "PS: Political Science and Politics"`.

Working papers: use `publication_types: [preprint]` and omit PDF links until posted.
Featured papers: set `featured: true`.

### Publication template override
`layouts/_partials/views/card.html` — local override. Key customization:
- Shows all tags (not just first): `{{ range $item.GetTerms "tags" }}`
- Uses `{{ $pub := partial "functions/resolve_publication.html" $item }}` then `{{ $pub.display_short | markdownify }}` for venue display
- Never pipe the publication map directly to markdownify — use resolve_publication first

`layouts/_partials/hbx/blocks/portfolio/block.html` — local override for Browse by Topic section.
Same resolve_publication pattern needed here (portfolio block renders its own cards, does not use card.html).

## Tag taxonomy
Current tag buttons in Browse by Topic (alphabetical):
- AI & Politics
- Bayesian Statistics
- Causal Inference
- Machine Learning
- Measurement
- Misinformation
- Political Behavior
- Political Communication
- Public Opinion
- Social Media
- Text/Image

Rules: tags removed = Electoral Politics, Methodology. Tags added = Political Behavior, Political Communication, Bayesian Statistics, Text/Image (renamed from NLP/Natural Language Processing).

## Author profile (`data/authors/me.yaml`)
- Bio paragraph 1: research spans political behavior, public opinion, and political communication; technology focus (AI, social media, online political advertising, misinformation)
- Bio paragraph 2: awards (Warren Miller Prize, Emerging Scholar Award); journals (PNAS, APSR, AJPS, NeurIPS); funders (NSF, Carnegie, Democracy Fund, >$1.2M)
- Bio paragraph 3: PhD + MS from Duke, BA from Wake Forest; Founding Director TIADS (2022–2024), Director American Social Survey (2020–2023)
- TODO: Add Google Scholar URL (currently placeholder)
- TODO: Remove or update Twitter/X link

## TODOs — profile/config cleanup
- Add Twitter/X handle to `data/authors/me.yaml` or remove that link entirely
- Clean up ORCID entry at https://orcid.org/0000-0001-5632-2437 (make sure it's current)
- Add/verify GitHub profile at https://github.com/jmontgomery
- GitHub link hidden for now (profile needs cleanup before showing)
- Get LinkedIn verified (linkedin.com/in/jacob-montgomery-2a6ab4286/)
- Download remaining papers into `static/uploads/papers/`
- Confirm professional email is correct (`jacob.montgomery@wustl.edu`)

## TODOs — publications
- PolAds2 working paper: pending co-author + posting decision (Li, Zhang, McCoy, Edelson); add card once decided
- Book (Montgomery & Rossiter 2022, Cambridge UP): link to https://doi.org/10.1017/9781108862516 rather than hosting PDF
- Write a blog post explaining the adaptive inventories method accessibly, to post on the site

## TODOs — CV
- Create a short CV (source materials in Dropbox: "cv and related" folder)
- Add short CV PDF to `static/uploads/cv/` and link it from the homepage alongside the long CV

## Pages not yet built
- **Teaching** page
- **Lab** page (lab members, current and former)
- **Software** page
- **Data** page
- **News/Blog** — already scaffolded in `content/blog/`; just needs posts
- **Donate/support page**
- **Letter of recommendation page**
