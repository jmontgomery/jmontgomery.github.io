---
title: "116th Senate — GGUM scores"
date: "2026-10-15"
show_date: false
reading_time: false
summary: "GGUM θ for the 116th Senate. 101 members scored of 102; max PSRF 1.099."
tags:
  - Senate
  - GGUM
profile: false
build:
  list: never
image:
  caption: "116th Senate scatter"
  focal_point: ""
  preview_only: true
---

GGUM ideal point estimates for the 116th Senate (members scored: 101 of 102; max PSRF: 1.099).

![116th Senate — GGUM θ vs W-NOMINATE dim-1](/uploads/ggum-congress/plots/S116-ggum-vs-nominate.png)

### Download

[Download `S116-ggum-scores.csv`](/uploads/ggum-congress/S116-ggum-scores.csv) &mdash; 102 members, 25 columns (Voteview metadata + GGUM θ, θ SD, PSRF).

### Off-diagonal members

The following 3 members fall more than 2.5σ off the OLS fit of GGUM θ on W-NOMINATE dim-1.  Common pattern: members who vote against their own party's bills from the ideological flank.

| Member | Party | State | nominate | GGUM θ | residual |
|---|---|---|---|---|---|
| KLOBUCHAR | D | MN | -0.28 | -3.33 | -1.14 |
| ROMNEY | R | UT | +0.29 | +1.27 | +1.06 |
| HAWLEY | R | MO | +0.82 | +1.46 | -1.03 |


### Noted concerns

The following GGUM placements in this chamber conflict with external records and should be interpreted with caution:

- **KLOBUCHAR.** Klobuchar is placed at -3.33, more extreme-left than Sanders or Warren have scored in any chamber, which contradicts her 'centrist workhorse' reputation.

- **ROMNEY.** Romney is overstated at the right pole given his well-known moderate, anti-Trump positioning.

[&larr; Back to the GGUM-for-Congress release](/data/ggum-congress/)
