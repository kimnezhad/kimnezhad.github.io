---
title: "Master's Thesis - Geospatial Machine Learning for Environmental Health"
excerpt: "Integrated multi-temporal satellite imagery (Hyperion, Landsat), meteorological data, and epidemiological records to model complex spatial patterns of stomach cancer in Golestan Province. <br/><br/> <b>Skills:</b> <i>Hyperion , Landsat 8, Meteorology data, Climate modeling, Multi-spectral/Hyperspectral RS, GIS, Spatial Pattern Analysis, Epidemiology, Machine Learning/Deep Learning, Interdisciplinary Research</i>"
collection: portfolio
---

**Core Skills:** *Hyperspectral & Multispectral Remote Sensing (Hyperion, Landsat), Gradient Boosting, Generalized Regression Neural Networks (GRNN), Spatial Interpolation (IDW), SMOTE*
***

## Project Overview
This research, conducted during my M.Sc. at K. N. Toosi University of Technology, aimed to identify and map the complex environmental and epidemiological risk factors associated with stomach (gastric) cancer in Golestan Province, Iran. By integrating machine learning with multi-source spatial data—including clinical epidemiology, synoptic meteorological records, and satellite imagery—this project created a comprehensive spatial health assessment model.

## Methodology
The study was divided into three core components, addressing different potential risk factors:

### 1. Epidemiological Modeling
Clinical data was modeled using a **Gradient Boosting** algorithm to identify primary personal risk factors. 
* **Challenge:** The dataset was highly imbalanced (fewer cancer patients than healthy control subjects). 
* **Solution:** Applied the Synthetic Minority Oversampling Technique (SMOTE) to oversample the minority class and randomly undersample the majority class, enabling the model to learn class boundaries effectively without bias.

### 2. Meteorological & Spatial Analysis
To investigate the relationship between cancer incidence and climate, 14 synoptic variables (including temperature, pressure, moisture, and elevation) were collected from 6 stations between 2003 and 2011. After preprocessing, spatial distribution maps were generated using **Inverse Distance Weighting (IDW)** interpolation.

### 3. Remote Sensing & Soil Contamination
Multispectral and hyperspectral satellite imagery were utilized to assess land use and heavy metal pollution:
* **Land Use Classification:** **Landsat 7** imagery was classified into 5 main categories using a Support Vector Machine (SVM) algorithm.
* **Spectral Analysis of Soil:** Soil samples were collected based on land use and patient distribution, then analyzed in the lab for heavy metals (As, Cr, Pb, Ni, Fe) and spectral reflectance. Spearman correlation identified optimal wavelengths for detecting each specific metal.
* **Pollution Mapping:** A **Generalized Regression Neural Network (GRNN)** was trained to predict metal content based on spectral signatures. The trained GRNN was then applied to **Hyperion hyperspectral imagery** to generate continuous soil pollution maps.

## Key Findings
By intersecting the epidemiological models, synoptic maps, and soil pollution distributions, the study revealed several significant risk factors for stomach cancer in the region:
* **Epidemiological:** Age, gender, tea consumption temperature, and socio-economic status ranked as the top four clinical risk factors.
* **Meteorological:** Habitats characterized by low temperature and high moisture showed a positive correlation with cancer incidence.
* **Environmental & Spatial:** Populations living near agricultural soils faced a higher diagnosis rate. Additionally, concentrations of Arsenic (As) and Iron (Fe) were estimated to be near standard limits, and incidence rates were notably higher in populations residing near areas with relatively high concentrations of these specific heavy metals.

## Associated Publications
The findings from this thesis were published in the following peer-reviewed journals:
* **Mohammadnezhad, K., et al.** "Modeling Epidemiology Data with Machine Learning Technique to Detect Risk Factors for Gastric Cancer." *Journal of Gastrointestinal Cancer*. [DOI: 10.1007/s12029-023-00952-1](https://doi.org/10.1007/s12029-023-00952-1)
* **Mohammadnezhad, K., et al.** "Investigating heavy metals soil contamination state on the rate of stomach cancer using remote sensing spectral features." *Environmental Monitoring and Assessment*. [DOI: 10.1007/s10661-023-11234-5](https://doi.org/10.1007/s10661-023-11234-5)
