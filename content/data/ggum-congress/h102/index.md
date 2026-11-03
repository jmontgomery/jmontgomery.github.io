---
title: "102nd House — GGUM scores"
date: "2026-10-15"
show_date: false
reading_time: false
summary: "GGUM θ for the 102nd House. 436 members scored of 441; max PSRF 1.011."
tags:
  - House
  - GGUM
profile: false
build:
  list: never
image:
  caption: "102nd House scatter"
  focal_point: ""
  preview_only: true
---

GGUM ideal point estimates for the 102nd House (members scored: 436 of 441; max PSRF: 1.011).

![102nd House — GGUM θ vs W-NOMINATE dim-1](/uploads/ggum-congress/plots/H102-ggum-vs-nominate.png)

### Download

[Download `H102-ggum-scores.csv`](/uploads/ggum-congress/H102-ggum-scores.csv) &mdash; 441 members, 25 columns (Voteview metadata + GGUM θ, θ SD, PSRF).

### Off-diagonal members

The following 10 members fall more than 2.5σ off the OLS fit of GGUM θ on W-NOMINATE dim-1.  Common pattern: members who vote against their own party's bills from the ideological flank.

| Member | Party | State | nominate | GGUM θ | residual |
|---|---|---|---|---|---|
| SIKORSKI | D | MN | -0.22 | -2.49 | -2.09 |
| CLAY | D | MO | -0.49 | -2.55 | -1.34 |
| PALLONE | D | NJ | -0.40 | -0.04 | +0.91 |
| SANDERS | I | VT | -0.55 | -2.17 | -0.79 |
| PERKINS | D | KY | -0.56 | -0.67 | +0.76 |
| YATES | D | IL | -0.49 | -1.94 | -0.71 |
| SAVAGE | D | IL | -0.67 | -2.45 | -0.70 |
| AUCOIN | D | OR | -0.23 | -1.11 | -0.66 |
| SERRANO | D | NY | -0.49 | -1.88 | -0.66 |
| MFUME | D | MD | -0.44 | -1.72 | -0.65 |


### Noted concerns

The following GGUM placements in this chamber conflict with external records and should be interpreted with caution:

- **SIKORSKI.** GGUM places Sikorski to the left of Bernie Sanders in this chamber, which conflicts with his historical record as a mainstream suburban Minnesota liberal rather than an ultra-left figure.  A five-chain seeded-init refit reproduces the placement, so the result is a stable feature of the roll-call matrix rather than a sampling artifact.

[&larr; Back to the GGUM-for-Congress release](/data/ggum-congress/)
