---
title: "GGUM Ideal Point Estimates for Congresses 100-119"
authors:
  - me
  - jbrandon-duck-mayr
date: "2026-10-15"
show_date: false
reading_time: false
summary: "GGUM-based ideal point estimates for every member of the US House and Senate, Congresses 100 to 119. Paired with Voteview member metadata so the files merge directly into existing DW-NOMINATE workflows. 37 of 40 chamber-fits included in this initial release; three chambers awaiting a verified refit."
abstract: "We release GGUM (Generalized Graded Unfolding Model) ideal point estimates for every member of the US House and Senate, Congresses 100 through 119, paired with Voteview member metadata. Unlike monotonic scaling methods like DW-NOMINATE, GGUM separates legislators who vote with their party-line extremes from those who vote-no-from-the-flank for antithetical reasons. 37 of 40 chamber-fits are included in this initial release; three House chambers from the late 1980s and early 1990s are being refit with NOMINATE-seeded initial values and will be added once verified."
tags:
  - Measurement/Surveys
  - Bayesian Statistics
image:
  caption: "H119 - GGUM theta vs DW-NOMINATE dim-1"
  focal_point: ""
  preview_only: false
links:
  - name: Combined CSV (all chambers)
    url: /uploads/ggum-congress/ggum-congress-all.csv
  - name: Zip bundle (per-chamber CSVs)
    url: /uploads/ggum-congress/ggum-congress-csvs.zip
  - name: Method paper (Duck-Mayr & Montgomery 2023)
    url: https://doi.org/10.1017/pan.2022.33
  - name: bggum R package
    url: https://github.com/duckmayr/bggum
---

We are releasing GGUM-based ideal point estimates for every member of the US House and Senate, Congresses 100 through 119 (1987 to the current session). Each member-congress-chamber observation is paired with the corresponding Voteview member metadata, so the file can be merged directly into existing DW-NOMINATE workflows. This is a data release, not a new method: the underlying model is the Generalized Graded Unfolding Model (GGUM), and the estimation code is the `bggum` package. Our goal here is simply to make these estimates available in a form that is easy to use alongside the ideal point data most political scientists already know.

### Why GGUM

Most of the roll-call scaling tools political scientists use, including NOMINATE, assume that legislators' voting behavior is monotonic in the underlying ideological dimension. Concretely: once you fix a cutpoint for a given vote, moving further away from that cutpoint in one direction should only ever make a "yea" more likely, and moving further away in the other direction should only ever make a "nay" more likely. That assumption is reasonable for a lot of roll calls, and it is a big part of why NOMINATE recovers such a clean left-right dimension from aggregate voting patterns.

But the assumption breaks down in a specific and increasingly common way. Sometimes a legislator votes no on a bill because they think it goes too far in one direction, while a very different legislator votes no on the same bill because they think it does not go far enough in that same direction. Both end up in the "no" column for opposite substantive reasons. A monotonic model cannot distinguish these two kinds of "no" votes; it can only place both legislators somewhere between the people who voted yes, which tends to pull genuinely extreme, non-compromising members toward the center of the estimated scale.

The GGUM relaxes the monotonicity assumption and allows unfolding, or non-monotonic, response functions: a legislator's probability of voting yes can rise and then fall again as you move across the ideological scale, rather than moving in one direction only. This lets the model separate two kinds of "extreme" behavior that NOMINATE tends to conflate: being extreme because you reliably vote with your party's most extreme wing, and being extreme because you reject compromise outright, including compromises your own party leadership supports. The 118th and 119th Congresses give this distinction real empirical bite. Freedom Caucus Republicans voting no on spending bills they consider insufficiently conservative, and progressive Democrats voting no on legislation they consider insufficiently progressive, are both cases where ideologically antithetical motivations produce the same recorded vote. NOMINATE has no way to tell these members apart from party-line extremists; the GGUM does.

### What's in the release

The release contains 40 chamber-level fits: House and Senate, separately, for each of the 20 Congresses from the 100th through the 119th. Every fit was run with at least two MCMC chains, and for each legislator we report the posterior mean of theta, the posterior standard deviation, and a Gelman-Rubin potential-scale-reduction-factor (PSRF) diagnostic computed across chains. Convergence was clean on the first pass for 36 of the 40 chamber-congresses. Four chambers from the late 1980s and early 1990s, specifically the 100th House, the 102nd House, the 104th House, and the 100th Senate, needed a second pass using NOMINATE-based values to seed the initial chain positions. The 100th Senate refit has been verified and is included below; the other three retried fits are being verified and will be swapped into the release as soon as that check is complete. The three remaining chambers (H100, H102, H104) are not included in the download table below; estimates for them will appear once the refits land.

### An example from the 119th House

A scatterplot of GGUM theta against DW-NOMINATE first-dimension scores for the 119th House illustrates the kind of separation the model is designed to recover. On the Democratic side, GGUM places Squad members such as Rashida Tlaib, Ilhan Omar, Alexandria Ocasio-Cortez, and Ayanna Pressley further left than NOMINATE does; their pattern of voting no from the left on measures other Democrats support reads as more ideologically extreme once unfolding is allowed. On the Republican side, the same thing happens in reverse: Freedom Caucus members including Thomas Massie, Nancy Mace, and Rich McCormick move further right under GGUM than under NOMINATE, while institutional conservatives such as Pat Harrigan and Chris Smith stay close to where NOMINATE already placed them. Meanwhile, Blue Dog Democrats like Vicente Gonzalez of Texas's 34th district move toward the center relative to their NOMINATE position. None of these distinctions are visible to a one-dimensional monotonic model; they only emerge once vote-no-from-the-left and vote-no-from-the-right are allowed to look different from ordinary party-line voting.

### Downloads

For most workflows the single combined file is easiest: [**`ggum-congress-all.csv`**](/uploads/ggum-congress/ggum-congress-all.csv) stacks every member-congress-chamber row from the full release into one table, with `congress` and `chamber` columns so you can filter in whatever way fits your analysis. If you prefer per-chamber files, [**`ggum-congress-csvs.zip`**](/uploads/ggum-congress/ggum-congress-csvs.zip) packages each chamber as its own CSV. The table below has direct links to each individual chamber CSV. The "scored / total" column reports how many of the Voteview-listed members received a GGUM theta estimate; the remainder are present in the file with `NA` theta, having been excluded from the fit for insufficient yea/nay roll calls or other data-quality reasons.

| Congress | Chamber | Members (scored / total) | File |
|---|---|---|---|
| 119 | House | 444 / 452 | [H119-ggum-scores.csv](/uploads/ggum-congress/H119-ggum-scores.csv) |
| 119 | Senate | 101 / 104 | [S119-ggum-scores.csv](/uploads/ggum-congress/S119-ggum-scores.csv) |
| 118 | House | 448 / 451 | [H118-ggum-scores.csv](/uploads/ggum-congress/H118-ggum-scores.csv) |
| 118 | Senate | 103 / 105 | [S118-ggum-scores.csv](/uploads/ggum-congress/S118-ggum-scores.csv) |
| 117 | House | 443 / 455 | [H117-ggum-scores.csv](/uploads/ggum-congress/H117-ggum-scores.csv) |
| 117 | Senate | 100 / 102 | [S117-ggum-scores.csv](/uploads/ggum-congress/S117-ggum-scores.csv) |
| 116 | House | 445 / 451 | [H116-ggum-scores.csv](/uploads/ggum-congress/H116-ggum-scores.csv) |
| 116 | Senate | 101 / 102 | [S116-ggum-scores.csv](/uploads/ggum-congress/S116-ggum-scores.csv) |
| 115 | House | 438 / 450 | [H115-ggum-scores.csv](/uploads/ggum-congress/H115-ggum-scores.csv) |
| 115 | Senate | 104 / 105 | [S115-ggum-scores.csv](/uploads/ggum-congress/S115-ggum-scores.csv) |
| 114 | House | 435 / 441 | [H114-ggum-scores.csv](/uploads/ggum-congress/H114-ggum-scores.csv) |
| 114 | Senate | 100 / 100 | [S114-ggum-scores.csv](/uploads/ggum-congress/S114-ggum-scores.csv) |
| 113 | House | 439 / 444 | [H113-ggum-scores.csv](/uploads/ggum-congress/H113-ggum-scores.csv) |
| 113 | Senate | 103 / 105 | [S113-ggum-scores.csv](/uploads/ggum-congress/S113-ggum-scores.csv) |
| 112 | House | 437 / 445 | [H112-ggum-scores.csv](/uploads/ggum-congress/H112-ggum-scores.csv) |
| 112 | Senate | 101 / 102 | [S112-ggum-scores.csv](/uploads/ggum-congress/S112-ggum-scores.csv) |
| 111 | House | 447 / 454 | [H111-ggum-scores.csv](/uploads/ggum-congress/H111-ggum-scores.csv) |
| 111 | Senate | 103 / 111 | [S111-ggum-scores.csv](/uploads/ggum-congress/S111-ggum-scores.csv) |
| 110 | House | 448 / 453 | [H110-ggum-scores.csv](/uploads/ggum-congress/H110-ggum-scores.csv) |
| 110 | Senate | 102 / 102 | [S110-ggum-scores.csv](/uploads/ggum-congress/S110-ggum-scores.csv) |
| 109 | House | 438 / 440 | [H109-ggum-scores.csv](/uploads/ggum-congress/H109-ggum-scores.csv) |
| 109 | Senate | 101 / 101 | [S109-ggum-scores.csv](/uploads/ggum-congress/S109-ggum-scores.csv) |
| 108 | House | 439 / 440 | [H108-ggum-scores.csv](/uploads/ggum-congress/H108-ggum-scores.csv) |
| 108 | Senate | 100 / 100 | [S108-ggum-scores.csv](/uploads/ggum-congress/S108-ggum-scores.csv) |
| 107 | House | 440 / 444 | [H107-ggum-scores.csv](/uploads/ggum-congress/H107-ggum-scores.csv) |
| 107 | Senate | 101 / 102 | [S107-ggum-scores.csv](/uploads/ggum-congress/S107-ggum-scores.csv) |
| 106 | House | 437 / 440 | [H106-ggum-scores.csv](/uploads/ggum-congress/H106-ggum-scores.csv) |
| 106 | Senate | 102 / 102 | [S106-ggum-scores.csv](/uploads/ggum-congress/S106-ggum-scores.csv) |
| 105 | House | 441 / 444 | [H105-ggum-scores.csv](/uploads/ggum-congress/H105-ggum-scores.csv) |
| 105 | Senate | 100 / 100 | [S105-ggum-scores.csv](/uploads/ggum-congress/S105-ggum-scores.csv) |
| 104 | Senate | 103 / 103 | [S104-ggum-scores.csv](/uploads/ggum-congress/S104-ggum-scores.csv) |
| 103 | House | 441 / 447 | [H103-ggum-scores.csv](/uploads/ggum-congress/H103-ggum-scores.csv) |
| 103 | Senate | 101 / 102 | [S103-ggum-scores.csv](/uploads/ggum-congress/S103-ggum-scores.csv) |
| 102 | Senate | 101 / 102 | [S102-ggum-scores.csv](/uploads/ggum-congress/S102-ggum-scores.csv) |
| 101 | House | 437 / 445 | [H101-ggum-scores.csv](/uploads/ggum-congress/H101-ggum-scores.csv) |
| 101 | Senate | 101 / 102 | [S101-ggum-scores.csv](/uploads/ggum-congress/S101-ggum-scores.csv) |
| 100 | Senate | 100 / 101 | [S100-ggum-scores.csv](/uploads/ggum-congress/S100-ggum-scores.csv) |

### Codebook

| Column | Description |
|---|---|
| `icpsr` | ICPSR member ID (joins to Voteview) |
| `bioname` | Member name, in LAST, First format |
| `party_code` | 100 = Democrat, 200 = Republican, other values = third-party or independent |
| `state_abbrev` | Two-letter state postal code |
| `nominate_dim1` | DW-NOMINATE first dimension (from Voteview, included for comparison) |
| `nominate_dim2` | DW-NOMINATE second dimension (from Voteview) |
| `ggum_theta` | GGUM posterior mean theta; our ideology estimate |
| `ggum_theta_sd` | Posterior standard deviation of GGUM theta (uncertainty) |
| `ggum_psrf` | Gelman-Rubin potential-scale-reduction-factor across chains; should be close to 1.0, flagged above 1.1 |

All other Voteview member columns (chamber, district_code, occupancy, and so on) are passed through unchanged.

### Chamber-by-chamber scatter plots

#### 119th Congress

![119th House — GGUM θ vs DW-NOMINATE](/uploads/ggum-congress/plots/H119-ggum-vs-nominate.png)

![119th Senate — GGUM θ vs DW-NOMINATE](/uploads/ggum-congress/plots/S119-ggum-vs-nominate.png)

#### 118th Congress

![118th House — GGUM θ vs DW-NOMINATE](/uploads/ggum-congress/plots/H118-ggum-vs-nominate.png)

![118th Senate — GGUM θ vs DW-NOMINATE](/uploads/ggum-congress/plots/S118-ggum-vs-nominate.png)

#### 117th Congress

![117th House — GGUM θ vs DW-NOMINATE](/uploads/ggum-congress/plots/H117-ggum-vs-nominate.png)

![117th Senate — GGUM θ vs DW-NOMINATE](/uploads/ggum-congress/plots/S117-ggum-vs-nominate.png)

#### 116th Congress

![116th House — GGUM θ vs DW-NOMINATE](/uploads/ggum-congress/plots/H116-ggum-vs-nominate.png)

![116th Senate — GGUM θ vs DW-NOMINATE](/uploads/ggum-congress/plots/S116-ggum-vs-nominate.png)

#### 115th Congress

![115th House — GGUM θ vs DW-NOMINATE](/uploads/ggum-congress/plots/H115-ggum-vs-nominate.png)

![115th Senate — GGUM θ vs DW-NOMINATE](/uploads/ggum-congress/plots/S115-ggum-vs-nominate.png)

#### 114th Congress

![114th House — GGUM θ vs DW-NOMINATE](/uploads/ggum-congress/plots/H114-ggum-vs-nominate.png)

![114th Senate — GGUM θ vs DW-NOMINATE](/uploads/ggum-congress/plots/S114-ggum-vs-nominate.png)

#### 113th Congress

![113th House — GGUM θ vs DW-NOMINATE](/uploads/ggum-congress/plots/H113-ggum-vs-nominate.png)

![113th Senate — GGUM θ vs DW-NOMINATE](/uploads/ggum-congress/plots/S113-ggum-vs-nominate.png)

#### 112th Congress

![112th House — GGUM θ vs DW-NOMINATE](/uploads/ggum-congress/plots/H112-ggum-vs-nominate.png)

![112th Senate — GGUM θ vs DW-NOMINATE](/uploads/ggum-congress/plots/S112-ggum-vs-nominate.png)

#### 111th Congress

![111th House — GGUM θ vs DW-NOMINATE](/uploads/ggum-congress/plots/H111-ggum-vs-nominate.png)

![111th Senate — GGUM θ vs DW-NOMINATE](/uploads/ggum-congress/plots/S111-ggum-vs-nominate.png)

#### 110th Congress

![110th House — GGUM θ vs DW-NOMINATE](/uploads/ggum-congress/plots/H110-ggum-vs-nominate.png)

![110th Senate — GGUM θ vs DW-NOMINATE](/uploads/ggum-congress/plots/S110-ggum-vs-nominate.png)

#### 109th Congress

![109th House — GGUM θ vs DW-NOMINATE](/uploads/ggum-congress/plots/H109-ggum-vs-nominate.png)

![109th Senate — GGUM θ vs DW-NOMINATE](/uploads/ggum-congress/plots/S109-ggum-vs-nominate.png)

#### 108th Congress

![108th House — GGUM θ vs DW-NOMINATE](/uploads/ggum-congress/plots/H108-ggum-vs-nominate.png)

![108th Senate — GGUM θ vs DW-NOMINATE](/uploads/ggum-congress/plots/S108-ggum-vs-nominate.png)

#### 107th Congress

![107th House — GGUM θ vs DW-NOMINATE](/uploads/ggum-congress/plots/H107-ggum-vs-nominate.png)

![107th Senate — GGUM θ vs DW-NOMINATE](/uploads/ggum-congress/plots/S107-ggum-vs-nominate.png)

#### 106th Congress

![106th House — GGUM θ vs DW-NOMINATE](/uploads/ggum-congress/plots/H106-ggum-vs-nominate.png)

![106th Senate — GGUM θ vs DW-NOMINATE](/uploads/ggum-congress/plots/S106-ggum-vs-nominate.png)

#### 105th Congress

![105th House — GGUM θ vs DW-NOMINATE](/uploads/ggum-congress/plots/H105-ggum-vs-nominate.png)

![105th Senate — GGUM θ vs DW-NOMINATE](/uploads/ggum-congress/plots/S105-ggum-vs-nominate.png)

#### 104th Congress

*104th House: refit in progress — plot and CSV will appear here when verification completes.*

![104th Senate — GGUM θ vs DW-NOMINATE](/uploads/ggum-congress/plots/S104-ggum-vs-nominate.png)

#### 103rd Congress

![103rd House — GGUM θ vs DW-NOMINATE](/uploads/ggum-congress/plots/H103-ggum-vs-nominate.png)

![103rd Senate — GGUM θ vs DW-NOMINATE](/uploads/ggum-congress/plots/S103-ggum-vs-nominate.png)

#### 102nd Congress

*102nd House: refit in progress — plot and CSV will appear here when verification completes.*

![102nd Senate — GGUM θ vs DW-NOMINATE](/uploads/ggum-congress/plots/S102-ggum-vs-nominate.png)

#### 101st Congress

![101st House — GGUM θ vs DW-NOMINATE](/uploads/ggum-congress/plots/H101-ggum-vs-nominate.png)

![101st Senate — GGUM θ vs DW-NOMINATE](/uploads/ggum-congress/plots/S101-ggum-vs-nominate.png)

#### 100th Congress

*100th House: refit in progress — plot and CSV will appear here when verification completes.*

![100th Senate — GGUM θ vs DW-NOMINATE](/uploads/ggum-congress/plots/S100-ggum-vs-nominate.png)


### Citation

If you use these estimates, please cite the method paper:

> Duck-Mayr, JB and Montgomery, JM (2023). "Ends Against the Middle: Measuring Latent Traits When Opposites Respond the Same Way for Antithetical Reasons." *Political Analysis* 31(4): 606-625. doi:10.1017/pan.2022.33

### Acknowledgments

We thank Voteview (voteview.com) for the roll-call and member metadata that make this release possible. Estimation was carried out with the `bggum` R package (github.com/duckmayr/bggum).
