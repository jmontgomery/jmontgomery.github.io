---
title: Research
type: landing

sections:
  - block: portfolio
    id: papers
    content:
      title: Papers
      count: 0
      archive:
        enable: false
      filters:
        folders:
          - publications
      buttons:
        - name: Featured
          tag: Featured
        - name: Published
          tag: __published__
        - name: Working Papers
          tag: Working Papers
        - name: —
          tag: __sep__
        - name: AI/Machine Learning
          tag: AI/Machine Learning
        - name: Bayesian Statistics
          tag: Bayesian Statistics
        - name: Causal Inference
          tag: Causal Inference
        - name: Measurement/Surveys
          tag: Measurement/Surveys
        - name: Research Design
          tag: Research Design
        - name: Text/Image
          tag: Text/Image
        - name: —
          tag: __sep__
        - name: AI & Politics
          tag: AI & Politics
        - name: American Politics
          tag: American Politics
        - name: Comparative Politics
          tag: Comparative Politics
        - name: Congress
          tag: Congress
        - name: Misinformation
          tag: Misinformation
        - name: Political Behavior
          tag: Political Behavior
        - name: Political Communication
          tag: Political Communication
        - name: Social Media
          tag: Social Media
    design:
      view: card

  - block: content-collection
    id: citation-list
    content:
      title: Citations for Published Work
      count: 0
      sort_by: Params.sort_key
      sort_ascending: true
      filters:
        folders:
          - publications
        publication_types:
          - article-journal
          - paper-conference
          - book
          - chapter
    design:
      view: citation
---
