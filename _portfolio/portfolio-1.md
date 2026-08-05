---
title: "Ongoing Research: High-Resolution SAR Sea Ice Classification Pipelines"
excerpt: "Developing a massive-scale machine learning pipeline to map sea ice probability across the Western Arctic using Sentinel-1 SAR and Canadian Ice Service (CIS) charts. Currently exploring advanced feature engineering, gradient boosting baselines, and Deep Learning architectures. <br/><br/> <b>Skills:</b> <i>Machine Learning, SAR Feature Engineering, Deep Learning (WIP), Geospatial Big Data</i>"
collection: portfolio
---

<p><b>Core Competencies & Skills:</b><br/>
• <b>Remote Sensing:</b> SAR Preprocessing (Sentinel-1), Multi-Sensor Data Fusion, Spatial Texture Engineering, ESA Land-Cover Masking<br/>
• <b>Cryosphere Science:</b> Sea Ice Concentration & Dynamics, CIS Operational Ice Charts, Western Arctic Basin<br/>
• <b>Machine Learning & Big Data:</b> Big Dataset Handling (100M+ km² cumulative scale), Deep Learning Exploration, LightGBM Baselines, Handling Extreme Class Imbalance</p>

<hr>

<h2>The Research Objective</h2>

<p>Automating the classification of sea ice using Synthetic Aperture Radar (SAR) is highly complex due to sensor artifacts, environmental noise, and imperfect ground truth. The goal of this ongoing research is to combine high-resolution Sentinel-1 SAR imagery with massive regional Canadian Ice Service (CIS) ice charts to accurately predict pixel-wise sea ice probability and, eventually, Stage of Development (SA).</p>

<p>This project processes data at a massive scale, utilizing tens of thousands of regional polygons cumulatively covering hundreds of millions of square kilometers across the Western Arctic.</p>

<br>

<h2>Methodology & Iterative Modeling</h2>

<p>Because observational ice charts contain generalized polygons that don't always capture the fine-scale realities of the ice surface, my research focuses on finding the most robust algorithms to bridge this gap. My current pipeline involves a multi-stage approach:</p>

<ul>
  <li><b>Establishing Robust Baselines:</b> Before deploying computationally heavy models, I have utilized advanced Gradient Boosting frameworks (like LightGBM) to evaluate the predictive power of different radar signatures.</li>
  <li><b>Spatial Feature Engineering:</b> I am extensively testing various polarimetric texture metrics, local spatial statistics, and incidence angle normalizations to understand which features best capture complex ice structures like leads, ridges, and varying ice types.</li>
  <li><b>Deep Learning Exploration:</b> The insights gained from feature importance analysis are actively being used to design and evaluate Deep Learning architectures (including CNNs and U-Nets) to handle multi-class semantic segmentation.</li>
</ul>

<br>

<h2>Addressing Real-World Geospatial Challenges</h2>

<p>A significant portion of this research involves solving the operational challenges of using SAR data in production:</p> 

<ul>
  <li><b>Sensor Artifacts:</b> Investigating methods to suppress artifacts caused by Sentinel-1 swath boundaries and differing noise floors (NESZ) without losing actual ice-edge details.</li>
  <li><b>Geospatial Masking:</b> Implementing semantic land-cover masking (e.g., ESA WorldCover) to eliminate false-positive ice classifications over land ice and coastal glaciers.</li>
  <li><b>Class Imbalance:</b> Developing rigorous, prevalence-aware validation metrics to handle the extreme class imbalances inherent in natural sea ice distributions.</li>
</ul>

<p><i>Note: As this research is currently being prepared for publication, specific algorithmic configurations and feature combinations are kept generalized. I will be sharing broader insights into my data engineering and preprocessing workflows on my blog!</i></p>

<ul>
  <li><i>[Link to future blog post: Navigating Extreme Class Imbalance in Geospatial Datasets]</i></li>
  <li><i>[Link to future blog post: The Importance of Land Masking in Oceanic Remote Sensing]</i></li>
</ul>
