---
title: "111th Senate — GGUM scores"
date: "2026-10-15"
show_date: false
reading_time: false
summary: "GGUM θ for the 111th Senate. 102 members scored of 111; max PSRF 1.004."
tags:
  - Senate
  - GGUM
profile: false
build:
  list: never
image:
  caption: "111th Senate scatter"
  focal_point: ""
  preview_only: true
---

GGUM ideal point estimates for the 111th Senate (members scored: 102 of 111; max PSRF: 1.004).

![111th Senate — GGUM θ vs W-NOMINATE dim-1](/uploads/ggum-congress/plots/S111-ggum-vs-nominate.png)

### Download

[Download `S111-ggum-scores.csv`](/uploads/ggum-congress/S111-ggum-scores.csv) &mdash; 111 members, 25 columns (Voteview metadata + GGUM θ, θ SD, PSRF).

### Off-diagonal members

The following 1 members fall more than 2.5σ off the OLS fit of GGUM θ on W-NOMINATE dim-1.  We flag these as diagnostic cases where the two scalings most disagree.

| Member | Party | State | nominate | GGUM θ | residual |
|---|---|---|---|---|---|
| FEINGOLD | D | WI | -0.31 | -0.36 | +0.70 |


### Noted concerns

The following GGUM placements in this chamber conflict with external records and should be interpreted with caution:

- **FEINGOLD.** Feingold is commonly viewed as one of the most liberal members of the Senate.  GGUM places him near the Senate center in this chamber, breaking his pattern in surrounding Congresses.

[&larr; Back to the GGUM-for-Congress release](/data/ggum-congress/)
