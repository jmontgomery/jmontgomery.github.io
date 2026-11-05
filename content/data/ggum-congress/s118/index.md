---
title: "118th Senate — GGUM scores"
date: "2026-10-15"
show_date: false
reading_time: false
summary: "GGUM θ for the 118th Senate. 103 members scored of 105; max PSRF 1.004."
tags:
  - Senate
  - GGUM
profile: false
build:
  list: never
image:
  caption: "118th Senate scatter"
  focal_point: ""
  preview_only: true
---

GGUM ideal point estimates for the 118th Senate (members scored: 103 of 105; max PSRF: 1.004).

![118th Senate — GGUM θ vs W-NOMINATE dim-1](/uploads/ggum-congress/plots/S118-ggum-vs-nominate.png)

### Download

[Download `S118-ggum-scores.csv`](/uploads/ggum-congress/S118-ggum-scores.csv) &mdash; 105 members, 25 columns (Voteview metadata + GGUM θ, θ SD, PSRF).

### Off-diagonal members

The following 1 members fall more than 2.5σ off the OLS fit of GGUM θ on W-NOMINATE dim-1.  We flag these as diagnostic cases where the two scalings most disagree.

| Member | Party | State | nominate | GGUM θ | residual |
|---|---|---|---|---|---|
| WARREN | D | MA | -0.74 | -1.93 | +0.86 |


### Placements worth a second look

GGUM's placement of the following members differs from what their established political reputations might lead a reader to expect.  This does not mean these estimates are necessarily wrong, but analysts might want to look.

- **HOEVEN.** Hoeven's public profile as a pragmatic, deal-making former governor and appropriator is largely about style rather than ideology.  GGUM places him at an extreme-conservative tier, which may reflect his underlying roll-call record more directly than his institutional profile suggests.

[&larr; Back to the GGUM-for-Congress release](/data/ggum-congress/)

---

<small>The prose on this page was drafted with Anthropic's Claude Opus 4.7, with plausibility audits by Claude Sonnet 4.5 subagents.  The author edited and reviewed throughout.</small>
