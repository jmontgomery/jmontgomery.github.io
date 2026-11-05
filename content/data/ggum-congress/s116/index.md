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

The following 3 members fall more than 2.5σ off the OLS fit of GGUM θ on W-NOMINATE dim-1.  We flag these as diagnostic cases where the two scalings most disagree.

| Member | Party | State | nominate | GGUM θ | residual |
|---|---|---|---|---|---|
| KLOBUCHAR | D | MN | -0.28 | -3.33 | -1.14 |
| ROMNEY | R | UT | +0.29 | +1.27 | +1.06 |
| HAWLEY | R | MO | +0.82 | +1.46 | -1.03 |


### Placements worth a second look

GGUM's placement of the following members differs from what their established political reputations might lead a reader to expect.  This does not mean these estimates are necessarily wrong, but analysts might want to look.

- **KLOBUCHAR.** Klobuchar is commonly viewed as a centrist Democrat.  GGUM places her near the extreme-left pole in this chamber, 7th-most-left of 101 senators, though less extreme than several further-left colleagues.

- **ROMNEY.** Romney is commonly viewed as a moderate Republican.  GGUM places him in the middle of the Republican range in this chamber, close to the median of 54 Republicans rather than toward either pole.

[&larr; Back to the GGUM-for-Congress release](/data/ggum-congress/)

---

<small>The prose on this page was drafted with Anthropic's Claude Opus 4.7, with plausibility audits by Claude Sonnet 4.5 subagents.  The author edited and reviewed throughout.</small>
