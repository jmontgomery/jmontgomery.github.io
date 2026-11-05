---
title: "115th Senate — GGUM scores"
date: "2026-10-15"
show_date: false
reading_time: false
summary: "GGUM θ for the 115th Senate. 104 members scored of 105; max PSRF 1.018."
tags:
  - Senate
  - GGUM
profile: false
build:
  list: never
image:
  caption: "115th Senate scatter"
  focal_point: ""
  preview_only: true
---

GGUM ideal point estimates for the 115th Senate (members scored: 104 of 105; max PSRF: 1.018).

![115th Senate — GGUM θ vs W-NOMINATE dim-1](/uploads/ggum-congress/plots/S115-ggum-vs-nominate.png)

### Download

[Download `S115-ggum-scores.csv`](/uploads/ggum-congress/S115-ggum-scores.csv) &mdash; 105 members, 25 columns (Voteview metadata + GGUM θ, θ SD, PSRF).

### Off-diagonal members

The following 3 members fall more than 2.5σ off the OLS fit of GGUM θ on W-NOMINATE dim-1.  We flag these as diagnostic cases where the two scalings most disagree.

| Member | Party | State | nominate | GGUM θ | residual |
|---|---|---|---|---|---|
| GILLIBRAND | D | NY | -0.45 | -3.56 | -0.95 |
| CRUZ | R | TX | +0.78 | +1.55 | -0.89 |
| FLAKE | R | AZ | +0.85 | +1.86 | -0.88 |


### Placements worth a second look

GGUM's placement of the following members differs from what their established political reputations might lead a reader to expect.  This does not mean these estimates are necessarily wrong, but analysts might want to look.

- **GILLIBRAND.** Gillibrand is commonly viewed as a mainstream progressive Democrat.  GGUM places her near the extreme-left end of this chamber's range, 2nd-most-left of 104 senators and among the most left-leaning placements in the full 40-chamber release.

- **CRUZ.** Cruz is commonly viewed as among the most conservative Republicans in the Senate.  GGUM places him in the upper portion of the Republican range in this chamber, 9th-most-conservative of 54 Republicans, just below the handful of most extreme members.

[&larr; Back to the GGUM-for-Congress release](/data/ggum-congress/)

---

<small>The prose on this page was drafted with Anthropic's Claude Opus 4.7, with plausibility audits by Claude Sonnet 4.5 subagents.  The author edited and reviewed throughout.</small>
