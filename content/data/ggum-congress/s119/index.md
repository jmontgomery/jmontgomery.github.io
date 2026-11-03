---
title: "119th Senate — GGUM scores"
date: "2026-10-15"
show_date: false
reading_time: false
summary: "GGUM θ for the 119th Senate. 101 members scored of 104; max PSRF 1.022."
tags:
  - Senate
  - GGUM
profile: false
build:
  list: never
image:
  caption: "119th Senate scatter"
  focal_point: ""
  preview_only: true
---

GGUM ideal point estimates for the 119th Senate (members scored: 101 of 104; max PSRF: 1.022).

![119th Senate — GGUM θ vs W-NOMINATE dim-1](/uploads/ggum-congress/plots/S119-ggum-vs-nominate.png)

### Download

[Download `S119-ggum-scores.csv`](/uploads/ggum-congress/S119-ggum-scores.csv) &mdash; 104 members, 25 columns (Voteview metadata + GGUM θ, θ SD, PSRF).

### Off-diagonal members

The following 4 members fall more than 2.5σ off the OLS fit of GGUM θ on W-NOMINATE dim-1.  Common pattern: members who vote against their own party's bills from the ideological flank.

| Member | Party | State | nominate | GGUM θ | residual |
|---|---|---|---|---|---|
| HAWLEY | R | MO | +0.82 | +1.19 | -1.54 |
| MURPHY | D | CT | -0.29 | -3.54 | -1.25 |
| TUBERVILLE | R | AL | +0.94 | +2.04 | -1.22 |
| SCHMITT | R | MO | +0.88 | +1.81 | -1.19 |


### Noted concerns

The following GGUM placements in this chamber conflict with external records and should be interpreted with caution:

- **HAWLEY.** Hawley is understated relative to his hard-right reputation, likely because GGUM's unfolding reads his populist NO votes shared with left-flank Democrats (Ukraine aid, some anti-corporate measures) as evidence of less-partisan behavior.

- **TUBERVILLE.** Similar pattern to Hawley: populist NO votes shared with left-flank Democrats produce an unfolding-geometry shrinkage toward the center.  Reproducible under seeded-init refits.

- **MURPHY.** Murphy is placed at -3.54, essentially tied with Sanders and Warren as the most extreme-left member of the chamber.  Murphy is a progressive on guns and foreign policy but has not historically been ranked among the most liberal senators.

[&larr; Back to the GGUM-for-Congress release](/data/ggum-congress/)
