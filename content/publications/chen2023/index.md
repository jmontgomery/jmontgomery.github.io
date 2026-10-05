---
show_date: false
reading_time: false
sort_key: chen2023
title: 'Inferring Time-varying Treatment Effects in Panel Data via Multi-Task Gaussian Processes'
authors:
  - Yehu Chen
  - Annamaria Prati
  - Jacob M. Montgomery
  - Roman Garnett
date: '2023-01-01'
publishDate: '2023-01-01'
publication_types:
  - paper-conference
publication:
  name: Proceedings of the 26th International Conference on Artificial Intelligence and Statistics (AIStats)
  short_name: AIStats
abstract: 'We introduce a Bayesian multi-task Gaussian process model for estimating treatment effects from panel data, where an intervention outside the observer''s control influences a subset of the observed units. Our model encodes structured temporal dynamics both within and across the treatment and control groups and incorporates a flexible prior for the evolution of treatment effects over time. These innovations aid in inferring posteriors for dynamic treatment effects that encode our uncertainty about the likely trajectories of units in the absence of treatment. We also discuss the asymptotic properties of the joint posterior over counterfactual outcomes and treatment effects, which exhibits intuitive behavior in the large-sample limit. In experiments on both synthetic and real data, our approach performs no worse than existing methods and significantly better when standard assumptions are violated.'
summary: 'Introduces a Gaussian process framework for estimating treatment effects that vary over time in panel data. The multi-task approach borrows strength across units and time periods, improving estimation of heterogeneous and dynamic causal effects in social science applications.'
featured: false
image:
  preview_only: true
tags:
  - AI/Machine Learning
  - Bayesian Statistics
  - Causal Inference
links:
  - name: PDF
    url: /uploads/papers/chen2023-inferring-time-varying.pdf
  - name: DOI
    url: https://proceedings.mlr.press/v206/chen23d/chen23d.pdf
  - name: Code
    url: https://github.com/yahoochen97/aistats2023_606
---
