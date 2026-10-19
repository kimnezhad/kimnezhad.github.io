---
title: "Supervised Classification of Polarimetric SAR with SVM"
order: 2
teaser: /images/projects/polsar-svm/classified-13features.png
excerpt: "Classified EMISAR polarimetric data into water, forest, agriculture, and urban classes with a Support Vector Machine, comparing a compact 4-feature set against all 13 polarimetric features (κ = 0.60 → 0.67). <br/><br/> <b>Skills:</b> <i>SVM, PolSAR Feature Extraction, Accuracy Assessment, Confusion Matrices</i>"
---

**Context:** Course project, K. N. Toosi University of Technology<br>
**Data:** EMISAR airborne, fully polarimetric, Foulum, Denmark (same scene as the [decomposition project](/projects/polsar-decomposition/))<br>
**Method:** Support Vector Machine, 200 training and 400 test samples per class

## Objective

Building on the polarimetric features extracted in the [decomposition project](/projects/polsar-decomposition/), I tested how much the size of the feature set matters for supervised classification. Because of the processing cost, I used four general classes: **water, forest, agricultural land, and urban**.

## Experiment 1: four features

The first model used four eigenvalue-based features: **entropy, anisotropy, alpha, and beta**.

<figure>
  <img src="/images/projects/polsar-svm/features-4.png" alt="The four input features">
  <figcaption>The four input features.</figcaption>
</figure>

<figure class="half">
  <img src="/images/projects/polsar-svm/classified-4features.png" alt="SVM classification with 4 features">
  <img src="/images/projects/polsar-svm/confusion-4features.png" alt="Confusion matrix, 4 features">
  <figcaption>Classification result and confusion matrix with 4 features (overall accuracy ≈ 70.4%, κ = 0.6045).</figcaption>
</figure>

- **Water** was separated almost perfectly (≈99% producer's accuracy), since its uniform, specular scattering is very different from the other classes.
- **Agriculture** was classified reasonably well despite its large internal variety.
- **Urban** had the lowest accuracy. The buildings in this scene are low, so they do not produce a strongly distinctive double-bounce return, and visually the urban class resembles the others in all four features.

<figure>
  <img src="/images/projects/polsar-svm/classes-4features.png" alt="Per-class maps">
  <figcaption>Individual class maps from the 4-feature model.</figcaption>
</figure>

## Experiment 2: all 13 features

The second model used all 13 extracted features: entropy, anisotropy, alpha, beta, gamma, delta, the three Krogager components, the three Freeman–Durden components, and span.

<figure class="half">
  <img src="/images/projects/polsar-svm/classified-13features.png" alt="SVM classification with 13 features">
  <img src="/images/projects/polsar-svm/confusion-13features.png" alt="Confusion matrix, 13 features">
  <figcaption>Classification result and confusion matrix with 13 features (overall accuracy ≈ 75.5%, κ = 0.6734).</figcaption>
</figure>

## Takeaways

Tripling the number of features raised κ only from **0.60 to 0.67**, and the urban class did not improve. Likely reasons are strong correlation between many of the polarimetric features (adding redundant information rather than new information) and training samples that do not fully represent the variability of the urban class. The lesson I took from this: **feature quality and sample design matter more than feature count**, which is something I still apply in my current SAR feature-engineering work.
