---
title: "119th Senate — GGUM scores"
date: "2026-10-15"
show_date: false
reading_time: false
summary: "GGUM θ for the 119th Senate. 101 members scored of 104; max PSRF 1.022."
tags:
  - Senate
  - GGUM
profile: false
build:
  list: never
image:
  caption: "119th Senate scatter"
  focal_point: ""
  preview_only: true
---

GGUM ideal point estimates for the 119th Senate (members scored: 101 of 104; max PSRF: 1.022).

![119th Senate — GGUM θ vs W-NOMINATE dim-1](/uploads/ggum-congress/plots/S119-ggum-vs-nominate.png)

### Download

[Download `S119-ggum-scores.csv`](/uploads/ggum-congress/S119-ggum-scores.csv) &mdash; 104 members, 25 columns (Voteview metadata + GGUM θ, θ SD, PSRF).

### Off-diagonal members

The following 4 members fall more than 2.5σ off the OLS fit of GGUM θ on W-NOMINATE dim-1.  We flag these as diagnostic cases where the two scalings most disagree.

| Member | Party | State | nominate | GGUM θ | residual |
|---|---|---|---|---|---|
| HAWLEY | R | MO | +0.82 | +1.19 | -1.54 |
| MURPHY | D | CT | -0.29 | -3.54 | -1.25 |
| TUBERVILLE | R | AL | +0.94 | +2.04 | -1.22 |
| SCHMITT | R | MO | +0.88 | +1.81 | -1.19 |


### Placements worth a second look

GGUM's placement of the following members differs from what their established political reputations might lead a reader to expect.  This does not mean these estimates are necessarily wrong, but analysts might want to look.

- **HAWLEY.** Hawley is commonly viewed as a strongly conservative Republican.  GGUM places him toward the moderate end of the Republican range in this chamber, 6th-least-conservative of 54 Republicans.

- **MURPHY.** Murphy is commonly viewed as a mainstream progressive.  GGUM places him at the extreme-left pole in this chamber, 4th-most-left of 101 senators and essentially tied with Sanders and Warren.

[&larr; Back to the GGUM-for-Congress release](/data/ggum-congress/)

---

<small>The prose on this page was drafted with Anthropic's Claude Opus 4.7, with plausibility audits by Claude Sonnet 4.5 subagents.  The author edited and reviewed throughout.</small>
