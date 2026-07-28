---
title: Software
type: landing

sections:
  - block: markdown
    content:
      title: R Packages
      text: |
        I develop open-source statistical software for political scientists and social scientists. All packages are available on CRAN.

        ---

        ### catSurv — Computerized Adaptive Testing for Survey Research

        **Authors:** Jacob M. Montgomery and Erin L. Rossiter &ensp;|&ensp; [CRAN](https://cran.r-project.org/web/packages/catSurv/) &ensp;|&ensp; [GitHub](https://github.com/erossiter/catSurv)

        Surveys are expensive — why ask everyone the same questions? `catSurv` implements computerized adaptive testing (CAT) methods for survey research, dynamically selecting the most informative questions for each respondent based on their previous answers. The package supports a range of item response theory models (latent trait, three-parameter, graded response, generalized partial credit) along with multiple ability estimation and item selection routines. C++ back-end ensures computational efficiency for large-scale surveys. The methodology is described in Montgomery and Rossiter (2020), *Journal of Survey Statistics and Methodology*.

        ---

        ### EBMAforecast — Ensemble Bayesian Model Averaging Forecasts

        **Authors:** Jacob M. Montgomery, Florian M. Hollenbach, and Michael D. Ward &ensp;|&ensp; [CRAN](https://cran.r-project.org/web/packages/EBMAforecast/) &ensp;|&ensp; [GitHub](https://github.com/fhollenbach/EBMA/)

        No single model dominates across all forecasting tasks. `EBMAforecast` combines predictions from multiple component models using ensemble Bayesian model averaging (EBMA), weighting each model by its historical accuracy to produce superior out-of-sample forecasts. The package supports both expectation-maximization and fully Bayesian estimation via Gibbs sampling. Originally developed for political forecasting applications, it is broadly applicable wherever researchers wish to combine model-based predictions. Methodology described in Montgomery, Hollenbach, and Ward (2012, 2015), *Political Analysis* and *International Journal of Forecasting*.

        ---

        ### bggum — Bayesian Generalized Graded Unfolding Model

        **Authors:** JBrandon Duck-Mayr and Jacob M. Montgomery &ensp;|&ensp; [CRAN](https://cran.r-project.org/web/packages/bggum/) &ensp;|&ensp; [GitHub](https://github.com/duckmayr/bggum)

        Standard IRT models assume that higher trait levels always produce higher endorsement probabilities — an assumption that fails for "ends against the middle" items, where respondents with opposing extreme preferences respond identically. `bggum` implements the generalized graded unfolding model (GGUM) via Metropolis-coupled MCMC, recovering ideal points even when opposites respond alike. Includes post-processing, parameter estimation, and plotting utilities. Companion to Duck-Mayr and Montgomery (2023), *Political Analysis* (Warren Miller Prize, best paper).

        ---

        ### validateIt — Crowdsourced Validation of Topic Models

        **Authors:** Luwei Ying, Jacob M. Montgomery, and Brandon M. Stewart &ensp;|&ensp; [CRAN](https://cran.r-project.org/web/packages/validateIt/) &ensp;|&ensp; [GitHub](https://github.com/Triads-Developer/Topic_Model_Validation)

        Topic models generate topics — but are those topics coherent, and do the labels researchers assign actually capture what the topics represent? `validateIt` streamlines crowdsourced validation of topic models via Amazon Mechanical Turk, creating and managing validation tasks that assess both topic coherence and label accuracy. Designed to integrate directly into standard topic modeling workflows in R. Companion to Ying, Montgomery, and Stewart (2022), *Political Analysis*.
    design:
      columns: '1'
---
