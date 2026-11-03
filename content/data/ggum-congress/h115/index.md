---
title: "115th House — GGUM scores"
date: "2026-10-15"
show_date: false
reading_time: false
summary: "GGUM θ for the 115th House. 438 members scored of 450; max PSRF 1.011."
tags:
  - House
  - GGUM
profile: false
build:
  list: never
image:
  caption: "115th House scatter"
  focal_point: ""
  preview_only: true
---

GGUM ideal point estimates for the 115th House (members scored: 438 of 450; max PSRF: 1.011).

![115th House — GGUM θ vs W-NOMINATE dim-1](/uploads/ggum-congress/plots/H115-ggum-vs-nominate.png)

### Download

[Download `H115-ggum-scores.csv`](/uploads/ggum-congress/H115-ggum-scores.csv) &mdash; 450 members, 25 columns (Voteview metadata + GGUM θ, θ SD, PSRF).

### Off-diagonal members

The following 11 members fall more than 2.5σ off the OLS fit of GGUM θ on W-NOMINATE dim-1.  Common pattern: members who vote against their own party's bills from the ideological flank.

| Member | Party | State | nominate | GGUM θ | residual |
|---|---|---|---|---|---|
| AMASH | R | MI | +0.65 | +3.09 | +1.20 |
| MASSIE | R | KY | +0.65 | +2.96 | +1.07 |
| NORMAN | R | SC | +0.86 | +1.87 | -0.76 |
| ROYCE | R | CA | +0.66 | +1.20 | -0.71 |
| CHAFFETZ | R | UT | +0.65 | +1.18 | -0.69 |
| GRIFFITH | R | VA | +0.51 | +2.05 | +0.66 |
| SMITH | D | WA | -0.29 | -2.14 | -0.65 |
| JONES | R | NC | +0.24 | -0.22 | -0.64 |
| GARRETT | R | VA | +0.93 | +2.27 | -0.62 |
| GONZALEZ | D | TX | -0.39 | -1.22 | +0.61 |
| BACON | R | NE | +0.28 | +1.14 | +0.59 |


### Noted concerns

The following GGUM placements in this chamber conflict with external records and should be interpreted with caution:

- **SMITH.** GGUM places Smith at Squad-adjacent extremity (-2.14), which conflicts with his record as a centrist Armed Services ranking member.  The placement is reproducible under five-chain seeded-init refits.

- **BACON.** Overstated at the right pole given Bacon's documented centrist, bipartisan reputation.

- **GRIFFITH.** Overstated at the right pole given a mainstream conservative reputation.

[&larr; Back to the GGUM-for-Congress release](/data/ggum-congress/)
