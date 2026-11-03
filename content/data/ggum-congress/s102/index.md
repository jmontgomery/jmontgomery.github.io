---
title: "102nd Senate — GGUM scores"
date: "2026-10-15"
show_date: false
reading_time: false
summary: "GGUM θ for the 102nd Senate. 101 members scored of 102; max PSRF 1.010."
tags:
  - Senate
  - GGUM
profile: false
build:
  list: never
image:
  caption: "102nd Senate scatter"
  focal_point: ""
  preview_only: true
---

GGUM ideal point estimates for the 102nd Senate (members scored: 101 of 102; max PSRF: 1.010).

![102nd Senate — GGUM θ vs W-NOMINATE dim-1](/uploads/ggum-congress/plots/S102-ggum-vs-nominate.png)

### Download

[Download `S102-ggum-scores.csv`](/uploads/ggum-congress/S102-ggum-scores.csv) &mdash; 102 members, 25 columns (Voteview metadata + GGUM θ, θ SD, PSRF).

### Off-diagonal members

The following 1 members fall more than 2.5σ off the OLS fit of GGUM θ on W-NOMINATE dim-1.  We flag these as diagnostic cases where the two scalings most disagree.

| Member | Party | State | nominate | GGUM θ | residual |
|---|---|---|---|---|---|
| HOLLINGS | D | SC | -0.29 | +0.08 | +0.63 |


### Placements worth a second look

GGUM's placement of the following members differs from what their established political reputations might lead a reader to expect.  We draw attention to these cases so that researchers can consider them before using the estimates for a particular analysis; we are not alleging error.

- **DOLE.** Dole is commonly viewed as a Senate Republican leader and institutional dealmaker who ran for president as a pragmatic centrist.  GGUM places him among the twenty most conservative senators in this Congress.

- **COCHRAN.** Cochran is commonly viewed as a mainstream appropriator, later primaried from the right in 2014 for being insufficiently conservative.  GGUM places him as the single most conservative senator in this Congress.

[&larr; Back to the GGUM-for-Congress release](/data/ggum-congress/)

---

<small>The prose on this page was drafted with Anthropic's Claude Opus 4.7, with plausibility audits by Claude Sonnet 4.5 subagents.  The author edited and reviewed throughout.</small>
