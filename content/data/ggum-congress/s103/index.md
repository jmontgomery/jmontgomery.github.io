---
title: "103rd Senate — GGUM scores"
date: "2026-10-15"
show_date: false
reading_time: false
summary: "GGUM θ for the 103rd Senate. 101 members scored of 102; max PSRF 1.001."
tags:
  - Senate
  - GGUM
profile: false
build:
  list: never
image:
  caption: "103rd Senate scatter"
  focal_point: ""
  preview_only: true
---

GGUM ideal point estimates for the 103rd Senate (members scored: 101 of 102; max PSRF: 1.001).

![103rd Senate — GGUM θ vs W-NOMINATE dim-1](/uploads/ggum-congress/plots/S103-ggum-vs-nominate.png)

### Download

[Download `S103-ggum-scores.csv`](/uploads/ggum-congress/S103-ggum-scores.csv) &mdash; 102 members, 25 columns (Voteview metadata + GGUM θ, θ SD, PSRF).

### Off-diagonal members

The following 2 members fall more than 2.5σ off the OLS fit of GGUM θ on W-NOMINATE dim-1.  We flag these as diagnostic cases where the two scalings most disagree.

| Member | Party | State | nominate | GGUM θ | residual |
|---|---|---|---|---|---|
| FEINGOLD | D | WI | -0.31 | -1.72 | -1.08 |
| PRESSLER | R | SD | +0.21 | +1.40 | +0.54 |


### Placements worth a second look

GGUM's placement of the following members differs from what their established political reputations might lead a reader to expect.  We draw attention to these cases so that researchers can consider them before using the estimates for a particular analysis; we are not alleging error.

- **DOLE.** Dole is commonly viewed as a Senate Republican leader and institutional dealmaker.  GGUM places him among the twenty most conservative senators in this Congress.

[&larr; Back to the GGUM-for-Congress release](/data/ggum-congress/)

---

<small>The prose on this page was drafted with Anthropic's Claude Opus 4.7, with plausibility audits by Claude Sonnet 4.5 subagents.  The author edited and reviewed throughout.</small>
