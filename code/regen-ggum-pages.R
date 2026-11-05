#!/usr/bin/env Rscript
##
## Regenerate the GGUM-for-Congress master page + 37 chamber sub-pages.
##
## Reads /data/ggum_dataverse.yaml for the single source of truth on download
## URLs.  When that file has empty values, falls back to /uploads/... paths
## (the staging pre-deposit state).  When it's filled in with Dataverse DOIs,
## every link, button, and citation swaps in one re-run.
##
## Run from the website repo root:
##
##   Rscript code/regen-ggum-pages.R
##
## Depends on: /tmp/claude-504/ggum-stage/*-ggum-scores.csv (the staged
## chamber CSVs).  If that directory doesn't exist, re-stage first.

suppressPackageStartupMessages({
    library(dplyr)
    library(yaml)
})

SITE   <- "/Users/jmontgomery/GitHub/jmontgomery.github.io"
STAGE  <- "/tmp/claude-504/ggum-stage"
PARENT <- file.path(SITE, "content/data/ggum-congress")
SCRATCH <- "/private/tmp/claude-504/-Users-jmontgomery-GitHub-jmontgomery-github-io/e79ac533-c1cd-443d-8513-6a12081183a3/scratchpad"

ordinal <- function(n) {
    last_two <- n %% 100; last_one <- n %% 10
    suf <- if (last_two %in% 11:13) "th"
           else if (last_one == 1) "st"
           else if (last_one == 2) "nd"
           else if (last_one == 3) "rd"
           else "th"
    paste0(n, suf)
}

## ---- Load Dataverse mapping ------------------------------------------------
dv_cfg_path <- file.path(SITE, "data/ggum_dataverse.yaml")
dv <- yaml::read_yaml(dv_cfg_path)
has_dataverse <- !is.null(dv$dataset_doi) && nzchar(dv$dataset_doi)

## ---- Load plot-dropout list (members excluded from scatter + off-diag) -----
dropouts_path <- file.path(SITE, "data/ggum_plot_dropouts.yaml")
dropouts <- if (file.exists(dropouts_path)) yaml::read_yaml(dropouts_path) else list()
chamber_dropouts <- function(tag) {
    v <- dropouts[[tag]]
    if (is.null(v)) integer(0) else as.integer(v)
}

## ---- Procedural-exclusion block (makes 'see notes' honest on Reid chambers) -
chamber_procedural_block <- function(tag, mem_df) {
    ids <- chamber_dropouts(tag)
    if (length(ids) == 0) return("")
    labels <- character(0)
    for (id in ids) {
        r <- subset(mem_df, icpsr == id)
        if (nrow(r) == 0) next
        lab <- sprintf("%s (%s-%s)",
                       sub(",.*", "", r$bioname[1]),
                       ifelse(r$party_code[1] == 100, "D",
                              ifelse(r$party_code[1] == 200, "R", "I")),
                       r$state_abbrev[1])
        labels <- c(labels, lab)
    }
    if (length(labels) == 0) return("")
    paste(c("",
            "### Procedural exclusions",
            "",
            sprintf("The following member was excluded from the GGUM fit for this Congress because the procedural voting that comes with their institutional role distorts the estimate: **%s**.  The row still appears in the released CSV with `ggum_flag = procedural_role` and `NA` for theta/SD/PSRF.",
                    paste(labels, collapse = ", "))),
          collapse = "\n")
}

## ---- Load worry notes (chamber-specific caveats about implausible fits) ----
worry_path <- file.path(SITE, "data/ggum_worry_notes.yaml")
worry <- if (file.exists(worry_path)) yaml::read_yaml(worry_path) else list()
chamber_worry_block <- function(tag, mem_df) {
    entries <- worry[[tag]]
    if (is.null(entries) || length(entries) == 0) return("")
    lines <- character(0)
    lines <- c(lines, "", "### Placements worth a second look",
               "", paste("GGUM's placement of the following members differs from",
                         "what their established political reputations might lead a",
                         "reader to expect.  This does not mean these estimates",
                         "are necessarily wrong, but analysts might want to look."))
    for (e in entries) {
        mrow <- subset(mem_df, icpsr == as.integer(e$icpsr))
        name <- if (nrow(mrow) > 0) sub(",.*", "", mrow$bioname[1]) else sprintf("icpsr %s", e$icpsr)
        lines <- c(lines, "", sprintf("- **%s.** %s", name, e$note))
    }
    paste(lines, collapse = "\n")
}

## Return the right download URL for a given filename, with fallback.
dl_url <- function(filename) {
    if (!is.null(dv$files) && !is.null(dv$files[[filename]]) &&
        nzchar(dv$files[[filename]])) {
        return(dv$files[[filename]])
    }
    paste0("/uploads/ggum-congress/", filename)
}

if (has_dataverse) {
    message(sprintf("Using Harvard Dataverse URLs (dataset DOI: %s)",
                    dv$dataset_doi))
} else {
    message("Using /uploads/ fallback URLs (Dataverse not yet configured)")
}

## ---- Build per-chamber sub-pages ------------------------------------------
files <- sort(list.files(STAGE, pattern = "^[HS][0-9]+-ggum-scores.csv$",
                          full.names = TRUE))
meta <- do.call(rbind, lapply(files, function(f) {
    tag <- sub("-ggum-scores.csv", "", basename(f))
    chamber <- ifelse(substr(tag,1,1) == "H", "House", "Senate")
    congress <- as.integer(substr(tag, 2, 4))
    d <- read.csv(f); d_fit <- d[!is.na(d$ggum_theta), ]
    data.frame(tag = tag, chamber = chamber, congress = congress,
               scored = nrow(d_fit), total = nrow(d),
               max_psrf = max(d_fit$ggum_psrf, na.rm = TRUE))
}))

for (i in seq_len(nrow(meta))) {
    r <- meta[i, ]; tag <- r$tag; ord <- ordinal(r$congress)
    d <- read.csv(files[i])
    d_fit <- d[!is.na(d$ggum_theta) & !is.na(d$nominate_dim1), ]
    drop_ids <- chamber_dropouts(tag)
    if (length(drop_ids)) {
        d_fit <- d_fit[!(d_fit$icpsr %in% drop_ids), ]
    }
    fit <- lm(ggum_theta ~ nominate_dim1, data = d_fit)
    d_fit$resid <- resid(fit)
    thresh <- 2.5 * sd(d_fit$resid)
    outl <- d_fit[abs(d_fit$resid) > thresh, ]
    outl <- outl[order(-abs(outl$resid)), ]

    csv_file <- sprintf("%s-ggum-scores.csv", tag)
    body <- paste(c(
      sprintf("GGUM ideal point estimates for the %s %s (members scored: %d of %d; max PSRF: %.3f).",
              ord, r$chamber, r$scored, r$total, r$max_psrf),
      "",
      sprintf("![%s %s — GGUM θ vs W-NOMINATE dim-1](/uploads/ggum-congress/plots/%s-ggum-vs-nominate.png)",
              ord, r$chamber, tag),
      "",
      "### Download",
      "",
      sprintf("[Download `%s`](%s) &mdash; %d members, 25 columns (Voteview metadata + GGUM θ, θ SD, PSRF).",
              csv_file, dl_url(csv_file), r$total),
      "",
      "### Off-diagonal members",
      "",
      if (nrow(outl) == 0) {
          "No members fall more than 2.5σ off the OLS fit of GGUM θ on W-NOMINATE dim-1. GGUM and NOMINATE agree closely for this chamber."
      } else {
          c(sprintf("The following %d members fall more than 2.5σ off the OLS fit of GGUM θ on W-NOMINATE dim-1.  We flag these as diagnostic cases where the two scalings most disagree.",
                    nrow(outl)),
            "",
            "| Member | Party | State | nominate | GGUM θ | residual |",
            "|---|---|---|---|---|---|",
            paste(sprintf("| %s | %s | %s | %+0.2f | %+0.2f | %+0.2f |",
                           sub(",.*", "", outl$bioname),
                           ifelse(outl$party_code == 100, "D",
                                   ifelse(outl$party_code == 200, "R", "I")),
                           outl$state_abbrev,
                           outl$nominate_dim1, outl$ggum_theta, outl$resid),
                   collapse = "\n"))
      },
      "",
      chamber_procedural_block(tag, d),
      "",
      chamber_worry_block(tag, d),
      "",
      "[&larr; Back to the GGUM-for-Congress release](/data/ggum-congress/)",
      "",
      "---",
      "",
      "<small>The prose on this page was drafted with Anthropic's Claude Opus 4.7, with plausibility audits by Claude Sonnet 4.5 subagents.  The author edited and reviewed throughout.</small>"
    ), collapse = "\n")

    frontmatter <- paste0(
      "---\n",
      sprintf("title: \"%s %s — GGUM scores\"\n", ord, r$chamber),
      "date: \"2026-10-15\"\n",
      "show_date: false\nreading_time: false\n",
      "summary: \"",
      sprintf("GGUM θ for the %s %s. %d members scored of %d; max PSRF %.3f.",
              ord, r$chamber, r$scored, r$total, r$max_psrf),
      "\"\n",
      "tags:\n",
      sprintf("  - %s\n  - GGUM\n", r$chamber),
      "profile: false\n",
      "build:\n  list: never\n",
      "image:\n",
      sprintf("  caption: \"%s %s scatter\"\n", ord, r$chamber),
      "  focal_point: \"\"\n  preview_only: true\n---\n\n")

    out_dir <- file.path(PARENT, tolower(tag))
    dir.create(out_dir, showWarnings = FALSE, recursive = TRUE)
    writeLines(paste0(frontmatter, body), file.path(out_dir, "index.md"))
    file.copy(sprintf("%s/plots/%s-ggum-vs-nominate.png", STAGE, tag),
              file.path(out_dir, "featured.png"), overwrite = TRUE)
}

## ---- Build the master page -----------------------------------------------
## (body template is inlined below as `body_template`; previously read from SCRATCH)

## Bulk-download anchors use dl_url for the combined CSV and zip
combined_url <- dl_url("ggum-congress-all.csv")
zip_url      <- dl_url("ggum-congress-csvs.zip")

bulk_block <- paste0(
  "<div class=\"ggum-bulk-downloads\">\n",
  sprintf("<a class=\"ggum-bulk-btn\" href=\"%s\" download>Combined CSV &mdash; <span>%s rows, all %d chambers</span></a>\n",
          combined_url, format(sum(meta$total), big.mark = ","), nrow(meta)),
  sprintf("<a class=\"ggum-bulk-btn ggum-bulk-btn-secondary\" href=\"%s\" download>Zip bundle &mdash; <span>%d per-chamber CSVs</span></a>\n",
          zip_url, nrow(meta)),
  "</div>")

## Chamber grid: newest Congress first, House before Senate
meta_srt <- meta[order(-meta$congress, meta$chamber == "Senate"), ]
tiles <- character(nrow(meta_srt))
for (i in seq_len(nrow(meta_srt))) {
    r <- meta_srt[i, ]
    csv_file <- sprintf("%s-ggum-scores.csv", r$tag)
    has_notes <- length(chamber_dropouts(r$tag)) > 0 ||
                 (!is.null(worry[[r$tag]]) && length(worry[[r$tag]]) > 0)
    notes_badge <- if (has_notes) " <span class=\"ggum-tile-notes\">see notes</span>" else ""
    tiles[i] <- paste0(
      "<div class=\"ggum-tile\">",
      sprintf("<a class=\"ggum-tile-main\" href=\"/data/ggum-congress/%s/\">", tolower(r$tag)),
      sprintf("<span class=\"ggum-tile-title\">%s %s</span>", ordinal(r$congress), r$chamber),
      sprintf("<span class=\"ggum-tile-sub\">%d scored &middot; %d total%s</span>",
              r$scored, r$total, notes_badge),
      "</a>",
      sprintf("<a class=\"ggum-tile-dl\" href=\"%s\" title=\"Download %s CSV\" aria-label=\"Download %s CSV\" download>",
              dl_url(csv_file), r$tag, r$tag),
      "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"18\" height=\"18\" ",
      "viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" ",
      "stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\">",
      "<path d=\"M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4\"/>",
      "<polyline points=\"7 10 12 15 17 10\"/>",
      "<line x1=\"12\" y1=\"15\" x2=\"12\" y2=\"3\"/>",
      "</svg></a>",
      "</div>")
}
grid <- paste0("<div class=\"ggum-chamber-grid\">\n",
               paste(tiles, collapse = "\n"), "\n</div>")

## Archive badge inserted at the top of the body when Dataverse is live.
archive_badge <- if (has_dataverse) {
    sprintf(paste0(
      "<div class=\"ggum-archive-badge\">",
      "<strong>Archived on Harvard Dataverse</strong> &middot; ",
      "<a href=\"%s\">%s</a>",
      if (!is.null(dv$dataset_version) && nzchar(dv$dataset_version))
          sprintf(" &middot; version %s", dv$dataset_version) else "",
      "</div>\n\n"),
      if (!is.null(dv$dataset_url) && nzchar(dv$dataset_url)) dv$dataset_url
      else paste0("https://doi.org/", dv$dataset_doi),
      dv$dataset_doi)
} else ""

## ---- Slim release-page body (inline template) ----
body_template <- paste(c(
  "",
  "GGUM-based ideal point estimates for every member of the US House and Senate, 100th through 119th Congresses (1987 to the current session).  Forty chamber-level fits, each paired with Voteview member metadata so each file merges directly into existing W-NOMINATE workflows.",
  "",
  "### The data",
  "",
  "{{BULK_DOWNLOADS}}",
  "",
  "Each row below is one Congress, newest first, with the House on the left and the Senate on the right.  Clicking a tile opens that chamber's detail page --- scatter plot, off-diagonal members, and any chamber-specific notes --- while the download icon grabs just that chamber's CSV.  A small \"see notes\" tag indicates that the chamber's detail page lists one or more placements worth a second look; the estimates themselves are available for every chamber.",
  "",
  "{{CHAMBER_GRID}}",
  "",
  "### Why GGUM",
  "",
  "Standard roll-call scalings, including W-NOMINATE, assume that a legislator's probability of voting yes on a bill moves monotonically with their ideology --- a reasonable assumption much of the time.  It fails when ideologically opposite legislators vote the same way on a bill for antithetical reasons: libertarian-right members voting no alongside progressive-left members on a moderate bill, for example.  The GGUM is designed to accommodate exactly this \"ends against the middle\" pattern.  In some (but not all) cases it therefore produces more reasonable estimates for the members involved than a monotonic scaling does.",
  "",
  "### An example from the 119th House",
  "",
  "![119th House GGUM theta vs W-NOMINATE dim-1](/uploads/ggum-congress/plots/H119-ggum-vs-nominate.png)",
  "",
  "On the Democratic side, GGUM places Squad members (Tlaib, Omar, Ocasio-Cortez, Pressley) further left than W-NOMINATE; on the Republican side, Freedom Caucus members (Massie, Mace, McCormick) move further right.  Institutional conservatives (Harrigan, Chris Smith) and Blue Dog Democrats (Vicente Gonzalez) stay closer to the party line.  These distinctions emerge once vote-no-from-the-left and vote-no-from-the-right are allowed to look different from ordinary party-line voting.",
  "",
  "### Known limitations",
  "",
  "For some members in some Congresses, the GGUM estimates may not make more sense than traditional models such as W-NOMINATE.  The Senate Majority Leader is the one systematic case: the procedural voting that comes with the leadership role distorts the estimate, and we have excluded Harry Reid from the fit for the 110th, 111th, and 114th Senates (his rows carry `ggum_flag = procedural_role`).  For other members, we flag individual placements that differ from what the member's established political reputation might lead a reader to expect; these appear with `ggum_flag = review` in the CSV and are listed on each affected chamber's sub-page under \"Placements worth a second look.\"  This does not mean these estimates are necessarily wrong, but analysts might want to look.",
  "",
  "### Codebook",
  "",
  "| Column | Description |",
  "|---|---|",
  "| `icpsr` | ICPSR member ID (joins to Voteview) |",
  "| `bioname` | Member name (LAST, First) |",
  "| `party_code` | 100 = Democrat, 200 = Republican, other = third-party / independent |",
  "| `state_abbrev` | Two-letter state code |",
  "| `nominate_dim1` | W-NOMINATE first dimension (from Voteview, included for comparison) |",
  "| `nominate_dim2` | W-NOMINATE second dimension (from Voteview) |",
  "| `ggum_theta` | GGUM posterior mean theta |",
  "| `ggum_theta_sd` | Posterior standard deviation of GGUM theta |",
  "| `ggum_psrf` | Gelman-Rubin PSRF across chains (close to 1.0; flagged above 1.1) |",
  "| `ggum_flag` | Empty by default; `procedural_role` if excluded from the fit (NA theta); `review` if the placement has a chamber-specific caveat |",
  "",
  "All other Voteview member columns pass through unchanged.",
  "",
  "### Citation",
  "",
  "If you use these estimates, please cite the paper:",
  "",
  "Duck-Mayr, JB and Montgomery, JM (2023). Ends Against the Middle: Measuring Latent Traits When Opposites Respond the Same Way for Antithetical Reasons. *Political Analysis* 31(4): 606-625.  doi:10.1017/pan.2022.33",
  "",
  "### Acknowledgments",
  "",
  "We thank Voteview (voteview.com) for the roll-call and member metadata.  Estimation used the `bggum` R package (github.com/duckmayr/bggum).",
  "",
  "The prose on this page and the chamber sub-pages was drafted with Anthropic's Claude Opus 4.7, with chamber-by-chamber plausibility audits conducted by Claude Sonnet 4.5 subagents.  The author edited and reviewed throughout."
), collapse = "\n")

body <- body_template
body <- sub("{{BULK_DOWNLOADS}}", bulk_block, body, fixed = TRUE)
body <- sub("{{CHAMBER_GRID}}",   grid,       body, fixed = TRUE)

## Append an extra line to the Citation block when Dataverse is live.
if (has_dataverse) {
    cite_add <- sprintf(paste0(
      "\n\nIf you also want to cite the dataset itself, add:\n\n",
      "> Montgomery, Jacob M. and Duck-Mayr, JBrandon (2026). ",
      "\"GGUM Ideal Point Estimates for Congresses 100-119.\" ",
      "Harvard Dataverse. %s%s"),
      if (!is.null(dv$dataset_url) && nzchar(dv$dataset_url))
          dv$dataset_url else paste0("https://doi.org/", dv$dataset_doi),
      if (!is.null(dv$dataset_version) && nzchar(dv$dataset_version))
          sprintf(". V%s", dv$dataset_version) else ".")
    body <- sub("### Acknowledgments",
                paste0(cite_add, "\n\n### Acknowledgments"),
                body, fixed = TRUE)
}

frontmatter <- '---
title: "GGUM Ideal Point Estimates for Congresses 100-119"
authors:
  - me
  - jbrandon-duck-mayr
date: "2026-10-15"
show_date: false
reading_time: false
profile: false
summary: "GGUM-based ideal point estimates for every member of the US House and Senate, Congresses 100 to 119.  Paired with Voteview member metadata so the files merge directly into existing W-NOMINATE workflows."
abstract: "We release GGUM (Generalized Graded Unfolding Model) ideal point estimates for every member of the US House and Senate, Congresses 100 through 119, paired with Voteview member metadata.  GGUM is designed to separate legislators who vote with their party-line extremes from those who vote no from the ideological flank for antithetical reasons -- a distinction that standard one-dimensional scalings tend to blur together.  All 40 chamber-level fits meet a Gelman-Rubin convergence threshold of PSRF < 1.1 for every scored legislator."
tags:
  - Measurement/Surveys
  - Bayesian Statistics
image:
  caption: "H119 - GGUM theta vs W-NOMINATE dim-1"
  focal_point: ""
  preview_only: false
links:
'
links_block <- paste0(
  sprintf("  - name: Combined CSV (all chambers)\n    url: %s\n", combined_url),
  sprintf("  - name: Zip bundle (per-chamber CSVs)\n    url: %s\n", zip_url),
  "  - name: Method paper (Duck-Mayr & Montgomery 2023)\n    url: https://doi.org/10.1017/pan.2022.33\n",
  "  - name: bggum R package\n    url: https://github.com/duckmayr/bggum\n")
if (has_dataverse) {
    dataset_link_url <- if (!is.null(dv$dataset_url) && nzchar(dv$dataset_url))
        dv$dataset_url else paste0("https://doi.org/", dv$dataset_doi)
    links_block <- paste0(links_block,
      sprintf("  - name: Dataverse archive (%s)\n    url: %s\n",
              dv$dataset_doi, dataset_link_url))
}
frontmatter <- paste0(frontmatter, links_block, "---\n\n", archive_badge)

writeLines(paste0(frontmatter, body),
           file.path(PARENT, "_index.md"))

message(sprintf("Wrote master page + %d chamber sub-pages", nrow(meta)))
if (!has_dataverse) {
    message("Fallback mode: download URLs point to /uploads/ggum-congress/")
    message("Fill in data/ggum_dataverse.yaml and re-run to switch over.")
}
