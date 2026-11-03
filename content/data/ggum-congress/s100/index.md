---
title: "100th Senate — GGUM scores"
date: "2026-10-15"
show_date: false
reading_time: false
summary: "GGUM θ for the 100th Senate. 100 members scored of 101; max PSRF 1.011."
tags:
  - Senate
  - GGUM
profile: false
build:
  list: never
image:
  caption: "100th Senate scatter"
  focal_point: ""
  preview_only: true
---

GGUM ideal point estimates for the 100th Senate (members scored: 100 of 101; max PSRF: 1.011).

![100th Senate — GGUM θ vs W-NOMINATE dim-1](/uploads/ggum-congress/plots/S100-ggum-vs-nominate.png)

### Download

[Download `S100-ggum-scores.csv`](/uploads/ggum-congress/S100-ggum-scores.csv) &mdash; 101 members, 25 columns (Voteview metadata + GGUM θ, θ SD, PSRF).

### Off-diagonal members

The following 2 members fall more than 2.5σ off the OLS fit of GGUM θ on W-NOMINATE dim-1.  We flag these as diagnostic cases where the two scalings most disagree.

| Member | Party | State | nominate | GGUM θ | residual |
|---|---|---|---|---|---|
| PROXMIRE | D | WI | -0.60 | +0.19 | +1.20 |
| HOLLINGS | D | SC | -0.29 | +0.28 | +0.60 |



[&larr; Back to the GGUM-for-Congress release](/data/ggum-congress/)
