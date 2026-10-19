---
title: "Brain Tumor Detection in MRI with Image Processing"
order: 5
teaser: /images/projects/brain-tumor-detection/pipeline.png
excerpt: "Designed a classical computer-vision pipeline that locates brain tumors in MRI scans by exploiting hemispheric asymmetry, block-wise similarity, and statistical texture features. <br/><br/> <b>Skills:</b> <i>Image Processing, Computer Vision, Segmentation, Feature Extraction</i>"
---

**Context:** Course project, K. N. Toosi University of Technology<br>
**Data:** T1-weighted and FLAIR brain MRI

## Objective

This project applied the image-processing and computer-vision techniques I had learned in remote sensing to a different domain: detecting tumors in brain MRI. The core idea is that a healthy brain is roughly symmetric, so **a tumor shows up as an asymmetry between the two hemispheres**.

<figure>
  <a href="/images/projects/brain-tumor-detection/pipeline.png" target="_blank" rel="noopener"><img src="/images/projects/brain-tumor-detection/pipeline.png" alt="Tumor detection pipeline with example outputs"></a>
  <figcaption>Processing pipeline (left) with example outputs at each stage (right).</figcaption>
</figure>

## Pipeline

1. **Edge enhancement:** fractional-order Sobel filtering to sharpen structural detail.
2. **Intensity normalization:** histogram stretching to make grey levels comparable across images.
3. **Skull stripping:** binarization and the watershed method to separate the brain from the background.
4. **Hemisphere separation:** splitting the brain along its centre and longest axis.
5. **Tumor-hemisphere detection:** comparing the two hemispheres with the Bhattacharyya coefficient to find the asymmetric one.
6. **Block-wise localization:** dividing the affected hemisphere into blocks and flagging those least similar to their neighbours.
7. **Feature extraction and classification:** computing first- and second-order statistical features and classifying each region, producing a binary tumor mask (1 = tumor, 0 = healthy tissue).

## Takeaways

Although outside Earth observation, this project used the same toolkit as image analysis in remote sensing: filtering, segmentation, texture statistics, and similarity measures. It showed me how transferable those methods are across domains. With enough labelled data, the same framework could be extended to distinguish malignant from benign tumors.
