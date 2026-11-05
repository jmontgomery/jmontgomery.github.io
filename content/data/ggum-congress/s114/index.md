---
title: "114th Senate — GGUM scores"
date: "2026-10-15"
show_date: false
reading_time: false
summary: "GGUM θ for the 114th Senate. 99 members scored of 100; max PSRF 1.005."
tags:
  - Senate
  - GGUM
profile: false
build:
  list: never
image:
  caption: "114th Senate scatter"
  focal_point: ""
  preview_only: true
---

GGUM ideal point estimates for the 114th Senate (members scored: 99 of 100; max PSRF: 1.005).

![114th Senate — GGUM θ vs W-NOMINATE dim-1](/uploads/ggum-congress/plots/S114-ggum-vs-nominate.png)

### Download

[Download `S114-ggum-scores.csv`](/uploads/ggum-congress/S114-ggum-scores.csv) &mdash; 100 members, 25 columns (Voteview metadata + GGUM θ, θ SD, PSRF).

### Off-diagonal members

The following 2 members fall more than 2.5σ off the OLS fit of GGUM θ on W-NOMINATE dim-1.  We flag these as diagnostic cases where the two scalings most disagree.

| Member | Party | State | nominate | GGUM θ | residual |
|---|---|---|---|---|---|
| FLAKE | R | AZ | +0.85 | +1.24 | -1.18 |
| JOHNSON | R | WI | +0.65 | +1.04 | -0.72 |


### Procedural exclusions

The following member was excluded from the GGUM fit for this Congress because the procedural voting that comes with their institutional role distorts the estimate: **REID (D-NV)**.  The row still appears in the released CSV with `ggum_flag = procedural_role` and `NA` for theta/SD/PSRF.



[&larr; Back to the GGUM-for-Congress release](/data/ggum-congress/)

---

<small>The prose on this page was drafted with Anthropic's Claude Opus 4.7, with plausibility audits by Claude Sonnet 4.5 subagents.  The author edited and reviewed throughout.</small>
