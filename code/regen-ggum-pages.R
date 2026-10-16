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
      sprintf("![%s %s — GGUM θ vs DW-NOMINATE dim-1](/uploads/ggum-congress/plots/%s-ggum-vs-nominate.png)",
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
          "No members fall more than 2.5σ off the OLS fit of GGUM θ on DW-NOMINATE dim-1. GGUM and NOMINATE agree closely for this chamber."
      } else {
          c(sprintf("The following %d members fall more than 2.5σ off the OLS fit of GGUM θ on DW-NOMINATE dim-1.  Common pattern: members who vote against their own party's bills from the ideological flank.",
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
      "[&larr; Back to the GGUM-for-Congress release](/data/ggum-congress/)"
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
      "image:\n",
      sprintf("  caption: \"%s %s scatter\"\n", ord, r$chamber),
      "  focal_point: \"\"\n  preview_only: false\n---\n\n")

    out_dir <- file.path(PARENT, tolower(tag))
    dir.create(out_dir, showWarnings = FALSE, recursive = TRUE)
    writeLines(paste0(frontmatter, body), file.path(out_dir, "index.md"))
    file.copy(sprintf("%s/plots/%s-ggum-vs-nominate.png", STAGE, tag),
              file.path(out_dir, "featured.png"), overwrite = TRUE)
}

## ---- Build the master page -----------------------------------------------
tpl <- readLines(file.path(SCRATCH, "ggum-blog-post.md"))

## Bulk-download anchors use dl_url for the combined CSV and zip
combined_url <- dl_url("ggum-congress-all.csv")
zip_url      <- dl_url("ggum-congress-csvs.zip")

bulk_block <- paste0(
  "<div class=\"ggum-bulk-downloads\">\n",
  sprintf("<a class=\"ggum-bulk-btn\" href=\"%s\" download>Combined CSV &mdash; <span>9,649 rows, all chambers</span></a>\n",
          combined_url),
  sprintf("<a class=\"ggum-bulk-btn ggum-bulk-btn-secondary\" href=\"%s\" download>Zip bundle &mdash; <span>37 per-chamber CSVs</span></a>\n",
          zip_url),
  "</div>")

## Chamber grid: newest Congress first, House before Senate
meta_srt <- meta[order(-meta$congress, meta$chamber == "Senate"), ]
tiles <- character(nrow(meta_srt))
for (i in seq_len(nrow(meta_srt))) {
    r <- meta_srt[i, ]
    csv_file <- sprintf("%s-ggum-scores.csv", r$tag)
    tiles[i] <- paste0(
      "<div class=\"ggum-tile\">",
      sprintf("<a class=\"ggum-tile-main\" href=\"/data/ggum-congress/%s/\">", tolower(r$tag)),
      sprintf("<span class=\"ggum-tile-title\">%s %s</span>", ordinal(r$congress), r$chamber),
      sprintf("<span class=\"ggum-tile-sub\">%d scored &middot; %d total</span>", r$scored, r$total),
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

body <- paste(tpl, collapse = "\n")
body <- sub("^## [^\\n]+\\n+", "", body, perl = TRUE)
body <- sub("{{DOWNLOAD_TABLE}}", bulk_block, body, fixed = TRUE)
body <- sub("{{CHAMBER_GRID}}",   grid,       body, fixed = TRUE)
## Replace the two bulk-download paragraph lines (combined + zip) when they
## appear as the explicit CSV links — compose template has them as markdown
## inside a paragraph, superseded by bulk_block above.  We inserted
## bulk_block in place of {{DOWNLOAD_TABLE}}.

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
summary: "GGUM-based ideal point estimates for every member of the US House and Senate, Congresses 100 to 119.  Paired with Voteview member metadata so the files merge directly into existing DW-NOMINATE workflows."
abstract: "We release GGUM (Generalized Graded Unfolding Model) ideal point estimates for every member of the US House and Senate, Congresses 100 through 119, paired with Voteview member metadata.  Unlike monotonic scaling methods like DW-NOMINATE, GGUM separates legislators who vote with their party-line extremes from those who vote-no-from-the-flank for antithetical reasons.  37 of 40 chamber-fits are included in this initial release; three House chambers from the late 1980s and early 1990s are being refit with NOMINATE-seeded initial values and will be added once verified."
tags:
  - Measurement/Surveys
  - Bayesian Statistics
image:
  caption: "H119 - GGUM theta vs DW-NOMINATE dim-1"
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
           file.path(PARENT, "index.md"))

message(sprintf("Wrote master page + %d chamber sub-pages", nrow(meta)))
if (!has_dataverse) {
    message("Fallback mode: download URLs point to /uploads/ggum-congress/")
    message("Fill in data/ggum_dataverse.yaml and re-run to switch over.")
}
