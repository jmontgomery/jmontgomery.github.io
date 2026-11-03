---
title: "106th Senate — GGUM scores"
date: "2026-10-15"
show_date: false
reading_time: false
summary: "GGUM θ for the 106th Senate. 102 members scored of 102; max PSRF 1.002."
tags:
  - Senate
  - GGUM
profile: false
build:
  list: never
image:
  caption: "106th Senate scatter"
  focal_point: ""
  preview_only: true
---

GGUM ideal point estimates for the 106th Senate (members scored: 102 of 102; max PSRF: 1.002).

![106th Senate — GGUM θ vs W-NOMINATE dim-1](/uploads/ggum-congress/plots/S106-ggum-vs-nominate.png)

### Download

[Download `S106-ggum-scores.csv`](/uploads/ggum-congress/S106-ggum-scores.csv) &mdash; 102 members, 25 columns (Voteview metadata + GGUM θ, θ SD, PSRF).

### Off-diagonal members

The following 4 members fall more than 2.5σ off the OLS fit of GGUM θ on W-NOMINATE dim-1.  We flag these as diagnostic cases where the two scalings most disagree.

| Member | Party | State | nominate | GGUM θ | residual |
|---|---|---|---|---|---|
| FEINGOLD | D | WI | -0.31 | -1.99 | -0.74 |
| BYRD | D | WV | -0.31 | -0.73 | +0.52 |
| MILLER | D | GA | +0.15 | -0.30 | -0.49 |
| ASHCROFT | R | MO | +0.54 | +0.95 | -0.47 |


### Placements worth a second look

GGUM's placement of the following members differs from what their established political reputations might lead a reader to expect.  We draw attention to these cases so that researchers can consider them before using the estimates for a particular analysis; we are not alleging error.

- **MILLER.** Miller is commonly viewed as one of the most conservative Democrats in the modern Senate (he endorsed George W. Bush and keynoted the 2004 Republican National Convention).  GGUM places him to the left of the Senate median.

[&larr; Back to the GGUM-for-Congress release](/data/ggum-congress/)

---

<small>The prose on this page was drafted with Anthropic's Claude Opus 4.7, with plausibility audits by Claude Sonnet 4.5 subagents.  The author edited and reviewed throughout.</small>
