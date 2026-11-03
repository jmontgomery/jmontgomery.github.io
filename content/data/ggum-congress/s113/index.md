---
title: "113th Senate — GGUM scores"
date: "2026-10-15"
show_date: false
reading_time: false
summary: "GGUM θ for the 113th Senate. 103 members scored of 105; max PSRF 1.021."
tags:
  - Senate
  - GGUM
profile: false
build:
  list: never
image:
  caption: "113th Senate scatter"
  focal_point: ""
  preview_only: true
---

GGUM ideal point estimates for the 113th Senate (members scored: 103 of 105; max PSRF: 1.021).

![113th Senate — GGUM θ vs W-NOMINATE dim-1](/uploads/ggum-congress/plots/S113-ggum-vs-nominate.png)

### Download

[Download `S113-ggum-scores.csv`](/uploads/ggum-congress/S113-ggum-scores.csv) &mdash; 105 members, 25 columns (Voteview metadata + GGUM θ, θ SD, PSRF).

### Off-diagonal members

The following 2 members fall more than 2.5σ off the OLS fit of GGUM θ on W-NOMINATE dim-1.  We flag these as diagnostic cases where the two scalings most disagree.

| Member | Party | State | nominate | GGUM θ | residual |
|---|---|---|---|---|---|
| FLAKE | R | AZ | +0.85 | +1.77 | -1.71 |
| WARREN | D | MA | -0.74 | -1.47 | +0.96 |


### Placements worth a second look

GGUM's placement of the following members differs from what their established political reputations might lead a reader to expect.  We draw attention to these cases so that researchers can consider them before using the estimates for a particular analysis; we are not alleging error.

- **ROBERTS.** Pat Roberts is commonly viewed as a low-key, institutionalist Agriculture Committee chair, not a movement ideologue.  GGUM places him among the chamber's most extreme conservatives, rivaling Cruz and Lee in GGUM score.

[&larr; Back to the GGUM-for-Congress release](/data/ggum-congress/)

---

<small>The prose on this page was drafted with Anthropic's Claude Opus 4.7, with plausibility audits by Claude Sonnet 4.5 subagents.  The author edited and reviewed throughout.</small>
