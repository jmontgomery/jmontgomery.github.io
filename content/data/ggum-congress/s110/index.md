---
title: "110th Senate — GGUM scores"
date: "2026-10-15"
show_date: false
reading_time: false
summary: "GGUM θ for the 110th Senate. 101 members scored of 102; max PSRF 1.015."
tags:
  - Senate
  - GGUM
profile: false
build:
  list: never
image:
  caption: "110th Senate scatter"
  focal_point: ""
  preview_only: true
---

GGUM ideal point estimates for the 110th Senate (members scored: 101 of 102; max PSRF: 1.015).

![110th Senate — GGUM θ vs W-NOMINATE dim-1](/uploads/ggum-congress/plots/S110-ggum-vs-nominate.png)

### Download

[Download `S110-ggum-scores.csv`](/uploads/ggum-congress/S110-ggum-scores.csv) &mdash; 102 members, 25 columns (Voteview metadata + GGUM θ, θ SD, PSRF).

### Off-diagonal members

The following 1 members fall more than 2.5σ off the OLS fit of GGUM θ on W-NOMINATE dim-1.  We flag these as diagnostic cases where the two scalings most disagree.

| Member | Party | State | nominate | GGUM θ | residual |
|---|---|---|---|---|---|
| FEINGOLD | D | WI | -0.31 | -2.05 | -0.96 |


### Procedural exclusions

The following member was excluded from the GGUM fit for this Congress because the procedural voting that comes with their institutional role distorts the estimate: **REID (D-NV)**.  The row still appears in the released CSV with `ggum_flag = procedural_role` and `NA` for theta/SD/PSRF.



[&larr; Back to the GGUM-for-Congress release](/data/ggum-congress/)

---

<small>The prose on this page was drafted with Anthropic's Claude Opus 4.7, with plausibility audits by Claude Sonnet 4.5 subagents.  The author edited and reviewed throughout.</small>
