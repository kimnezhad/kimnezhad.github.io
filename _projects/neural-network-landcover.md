---
title: "Land-Cover Classification with Neural Networks"
order: 4
teaser: /images/projects/neural-network-landcover/classified-5n.png
excerpt: "Classified a high-resolution IKONOS image into bare soil, trees, buildings, and roads with a feed-forward neural network, and compared accuracy and convergence across hidden layers of 5 to 25 neurons. <br/><br/> <b>Skills:</b> <i>Neural Networks, Training/Validation Design, Hyperparameter Comparison, MATLAB, ENVI</i>"
---

**Context:** Course project, K. N. Toosi University of Technology<br>
**Data:** IKONOS, 3 bands, urban scene<br>
**Tools:** ENVI (sample selection), MATLAB Neural Pattern Recognition app

## Objective

The goal was to classify a high-resolution image into four classes (**bare soil, trees, buildings, and roads**) and to study how the size of the hidden layer affects a neural network's accuracy and training behaviour.

<figure class="half">
  <img src="/images/projects/neural-network-landcover/ikonos.png" alt="IKONOS input image">
  <img src="/images/projects/neural-network-landcover/roi.png" alt="Training and test sample locations">
  <figcaption>Input IKONOS image (left) and the sample regions selected in ENVI (right).</figcaption>
</figure>

## Data preparation

| Class | Training | Validation | Test |
|---|---|---|---|
| Bare soil | 200 | 200 | 500 |
| Trees | 200 | 200 | 500 |
| Buildings | 200 | 200 | 500 |
| Roads | 200 | 200 | 500 |
| **Total** | **800** | **800** | **2000** |

Samples were exported from ENVI and arranged for MATLAB as a 3 × 3600 input matrix (3 bands, 900 samples per class) and a 4 × 3600 one-hot target matrix, where each row marks membership of one class.

## Training

I trained networks with **5, 10, 15, 20, and 25 neurons** in the hidden layer. For each, I selected the epoch with the best validation performance, which also guards against overfitting.

<figure>
  <img src="/images/projects/neural-network-landcover/training-5n.png" alt="Training performance, 5 neurons">
  <figcaption>Training progress for the 5-neuron network: gradient, validation checks, and cross-entropy for training, validation, and test sets.</figcaption>
</figure>

<figure class="half">
  <img src="/images/projects/neural-network-landcover/classified-5n.png" alt="Classified map, 5 neurons">
  <img src="/images/projects/neural-network-landcover/classes-5n.png" alt="Per-class maps, 5 neurons">
  <figcaption>Classification with 5 hidden neurons (left) and the individual class maps (right).</figcaption>
</figure>

## Results

| Hidden neurons | Overall accuracy (%) | Epochs trained | Best epoch |
|---|---|---|---|
| 5 | 88.2 | 67 | 61 |
| 10 | 86.6 | 45 | 41 |
| 15 | 87.4 | 35 | 29 |
| 20 | 88.7 | 39 | 33 |
| 25 | **91.2** | 60 | 54 |

<figure>
  <img src="/images/projects/neural-network-landcover/result-25n.png" alt="Results with 25 neurons">
  <figcaption>The best-performing network (25 hidden neurons): performance curve, confusion matrices, classified map, and class maps.</figcaption>
</figure>

## Takeaways

The largest network gave the best accuracy (91.2%), but the trend was not strictly monotonic: 10 and 15 neurons performed slightly worse than 5. Larger networks can capture more complex class boundaries, but they also take longer to converge and are more prone to overfitting, so hidden-layer size has to be tuned against validation performance rather than simply maximized.
