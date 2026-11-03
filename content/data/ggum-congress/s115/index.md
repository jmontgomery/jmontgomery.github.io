---
title: "115th Senate — GGUM scores"
date: "2026-10-15"
show_date: false
reading_time: false
summary: "GGUM θ for the 115th Senate. 104 members scored of 105; max PSRF 1.018."
tags:
  - Senate
  - GGUM
profile: false
build:
  list: never
image:
  caption: "115th Senate scatter"
  focal_point: ""
  preview_only: true
---

GGUM ideal point estimates for the 115th Senate (members scored: 104 of 105; max PSRF: 1.018).

![115th Senate — GGUM θ vs W-NOMINATE dim-1](/uploads/ggum-congress/plots/S115-ggum-vs-nominate.png)

### Download

[Download `S115-ggum-scores.csv`](/uploads/ggum-congress/S115-ggum-scores.csv) &mdash; 105 members, 25 columns (Voteview metadata + GGUM θ, θ SD, PSRF).

### Off-diagonal members

The following 3 members fall more than 2.5σ off the OLS fit of GGUM θ on W-NOMINATE dim-1.  Common pattern: members who vote against their own party's bills from the ideological flank.

| Member | Party | State | nominate | GGUM θ | residual |
|---|---|---|---|---|---|
| GILLIBRAND | D | NY | -0.45 | -3.56 | -0.95 |
| CRUZ | R | TX | +0.78 | +1.55 | -0.89 |
| FLAKE | R | AZ | +0.85 | +1.86 | -0.88 |


### Noted concerns

The following GGUM placements in this chamber conflict with external records and should be interpreted with caution:

- **GILLIBRAND.** GGUM places Gillibrand at the most extreme-left score in the entire 40-chamber release (-3.56), more extreme than any Squad member in any later Congress.  A five-chain seeded-init refit reproduces the placement.

- **CRUZ.** Cruz is understated at +1.55 given his widely recognized hard-right reputation and leading role in Senate opposition tactics.

[&larr; Back to the GGUM-for-Congress release](/data/ggum-congress/)
