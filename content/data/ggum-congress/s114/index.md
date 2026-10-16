---
title: "114th Senate — GGUM scores"
date: "2026-10-15"
show_date: false
reading_time: false
summary: "GGUM θ for the 114th Senate. 100 members scored of 100; max PSRF 1.008."
tags:
  - Senate
  - GGUM
image:
  caption: "114th Senate scatter"
  focal_point: ""
  preview_only: false
---

GGUM ideal point estimates for the 114th Senate (members scored: 100 of 100; max PSRF: 1.008).

![114th Senate — GGUM θ vs DW-NOMINATE dim-1](/uploads/ggum-congress/plots/S114-ggum-vs-nominate.png)

### Download

[Download `S114-ggum-scores.csv`](/uploads/ggum-congress/S114-ggum-scores.csv) &mdash; 100 members, 25 columns (Voteview metadata + GGUM θ, θ SD, PSRF).

### Off-diagonal members

The following 3 members fall more than 2.5σ off the OLS fit of GGUM θ on DW-NOMINATE dim-1.  Common pattern: members who vote against their own party's bills from the ideological flank.

| Member | Party | State | nominate | GGUM θ | residual |
|---|---|---|---|---|---|
| FLAKE | R | AZ | +0.85 | +1.26 | -1.18 |
| REID | D | NV | -0.28 | -1.91 | -0.73 |
| JOHNSON | R | WI | +0.65 | +1.06 | -0.72 |

[&larr; Back to the GGUM-for-Congress release](/data/ggum-congress/)
