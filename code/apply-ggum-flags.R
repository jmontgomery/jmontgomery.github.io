#!/usr/bin/env Rscript
## Add a `ggum_flag` column to every staged chamber CSV + the combined CSV.
##
## Flag values (controlled vocabulary):
##   ""                  — default, no concern noted
##   "procedural_role"   — member excluded from the fit due to institutional
##                         role (chamber leader whose procedural voting
##                         distorts the fit); theta is NA for these rows
##   "review"            — member has a hand-annotated "Noted concerns"
##                         entry on the chamber's sub-page
##
## Inputs:
##   /tmp/claude-504/ggum-stage/<TAG>-ggum-scores.csv  (one per chamber)
##   /Users/jmontgomery/GitHub/jmontgomery.github.io/data/ggum_worry_notes.yaml
##   /Users/jmontgomery/GitHub/jmontgomery.github.io/data/ggum_plot_dropouts.yaml
##
## Outputs:
##   <same staged CSVs, rewritten with the ggum_flag column appended>
##   /tmp/claude-504/ggum-stage/ggum-congress-all.csv (combined)
##   /tmp/claude-504/ggum-stage/ggum-congress-csvs.zip
##   mirrored into /Users/jmontgomery/GitHub/jmontgomery.github.io/static/uploads/ggum-congress/

suppressPackageStartupMessages({library(yaml)})

SITE  <- "/Users/jmontgomery/GitHub/jmontgomery.github.io"
STAGE <- "/tmp/claude-504/ggum-stage"
UP    <- file.path(SITE, "static/uploads/ggum-congress")

worry    <- yaml::read_yaml(file.path(SITE, "data/ggum_worry_notes.yaml"))
dropouts <- yaml::read_yaml(file.path(SITE, "data/ggum_plot_dropouts.yaml"))

review_ids <- function(tag) {
    e <- worry[[tag]]
    if (is.null(e)) return(integer(0))
    as.integer(sapply(e, function(x) x$icpsr))
}
procedural_ids <- function(tag) {
    v <- dropouts[[tag]]
    if (is.null(v)) return(integer(0))
    as.integer(v)
}

files <- sort(list.files(STAGE, pattern = "^[HS][0-9]+-ggum-scores\\.csv$",
                          full.names = TRUE))
for (f in files) {
    tag <- sub("-ggum-scores\\.csv$", "", basename(f))
    d   <- read.csv(f, stringsAsFactors = FALSE)
    d$ggum_flag <- ""
    d$ggum_flag[d$icpsr %in% procedural_ids(tag)] <- "procedural_role"
    d$ggum_flag[d$icpsr %in% review_ids(tag)]     <- "review"
    # procedural_role rows: NA out the estimates (member was excluded from the fit)
    pr <- d$ggum_flag == "procedural_role"
    d$ggum_theta[pr]    <- NA
    d$ggum_theta_sd[pr] <- NA
    d$ggum_psrf[pr]     <- NA
    write.csv(d, f, row.names = FALSE, na = "")
    file.copy(f, file.path(UP, basename(f)), overwrite = TRUE)
}
message(sprintf("Flagged %d chambers.", length(files)))

## Rebuild combined CSV + zip (keep blank flag as "" not NA)
rows <- do.call(rbind, lapply(files, read.csv, stringsAsFactors = FALSE))
rows$ggum_flag[is.na(rows$ggum_flag)] <- ""
write.csv(rows, file.path(STAGE, "ggum-congress-all.csv"), row.names = FALSE, na = "")
file.copy(file.path(STAGE, "ggum-congress-all.csv"),
          file.path(UP, "ggum-congress-all.csv"), overwrite = TRUE)
old_wd <- getwd(); setwd(STAGE)
unlink("ggum-congress-csvs.zip")
csv_files <- list.files(".", pattern = "^[HS][0-9]+-ggum-scores\\.csv$")
utils::zip("ggum-congress-csvs.zip", csv_files, flags = "-q9X")
setwd(old_wd)
file.copy(file.path(STAGE, "ggum-congress-csvs.zip"),
          file.path(UP, "ggum-congress-csvs.zip"), overwrite = TRUE)
message(sprintf("Combined: %d rows, %d cols.  Zip refreshed.", nrow(rows), ncol(rows)))

## Flag count summary
tab <- table(rows$ggum_flag, useNA = "ifany")
cat("\n--- ggum_flag distribution across all 40 chambers ---\n")
print(tab)
