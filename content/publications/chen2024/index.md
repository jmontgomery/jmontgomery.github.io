---
show_date: false
reading_time: false
sort_key: chen2024
title: 'Idiographic Personality Gaussian Process for Psychological Assessment'
authors:
  - Yehu Chen
  - Muchen Xi
  - Jacob M. Montgomery
  - Joshua Jackson
  - Roman Garnett
date: '2024-01-01'
publishDate: '2024-01-01'
publication_types:
  - paper-conference
publication:
  name: Advances in Neural Information Processing Systems (NeurIPS)
  short_name: NeurIPS
abstract: 'We develop a novel measurement framework based on a Gaussian process coregionalization model to address a long-lasting debate in psychometrics: whether psychological features like personality share a common structure across the population, vary uniquely for individuals, or some combination. We propose the idiographic personality Gaussian process (IPGP) framework, an intermediate model that accommodates both shared trait structure across a population and "idiographic" deviations for individuals. IPGP leverages the Gaussian process coregionalization model to handle the grouped nature of battery responses, but adjusted to non-Gaussian ordinal data. We further exploit stochastic variational inference for efficient latent factor estimation required for idiographic modeling at scale. Using synthetic and real data, we show that IPGP improves both prediction of actual responses and estimation of individualized factor structures relative to existing benchmarks. In a third study, we show that IPGP also identifies unique clusters of personality taxonomies in real-world data, displaying great potential in advancing individualized approaches to psychological diagnosis and treatment.'
summary: 'Personality psychology has long been caught between two competing visions: models that describe everyone the same way, and models tailored uniquely to each individual. This paper proposes an elegant middle path — a flexible statistical framework that captures shared personality structure across a population while also allowing each person''s factor structure to deviate in ways unique to them. Drawing on longitudinal survey data and Gaussian process methods, the approach outperforms standard models at predicting individual responses and reveals personality clusters that standard taxonomies miss.'
featured: true
image:
  preview_only: true
tags:
  - Featured
  - AI/Machine Learning
  - Bayesian Statistics
  - Measurement/Surveys
links:
  - name: PDF
    url: /uploads/papers/chen2024-idiographic-personality-gaussian.pdf
  - name: DOI
    url: https://doi.org/10.48550/arXiv.2407.04970
  - name: Code
    url: https://github.com/yahoochen97/GP-Idiographic-Measurement
---
