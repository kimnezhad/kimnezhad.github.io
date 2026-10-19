---
title: "Land-Cover Interpretation with Polarimetric SAR Decompositions"
order: 1
teaser: /images/projects/polsar-decomposition/h-a-alpha-rgb.jpg
excerpt: "Interpreted fully polarimetric EMISAR data over Foulum, Denmark, using the coherent Krogager decomposition and the incoherent H/A/α (Cloude–Pottier) decomposition to separate water, forest, urban, and agricultural surfaces by scattering mechanism. <br/><br/> <b>Skills:</b> <i>PolSAR, Krogager & H/A/α Decompositions, Speckle Filtering, PolSARpro, ENVI</i>"
---

**Context:** Course project, K. N. Toosi University of Technology<br>
**Data:** EMISAR airborne, fully polarimetric (HH, HV, VH, VV), Foulum, Denmark<br>
**Tools:** PolSARpro, ENVI

## Objective

The goal was to interpret polarimetric SAR data for different land covers by identifying the dominant *scattering mechanism* of each surface, then relating those mechanisms to land-cover types. Along the way I compared filtering strategies and extracted polarimetric features that I later used for [supervised classification](/projects/polsar-svm/).

<figure>
  <a href="/images/projects/polsar-decomposition/emisar-foulum.png" target="_blank" rel="noopener"><img src="/images/projects/polsar-decomposition/emisar-foulum.png" alt="EMISAR polarimetric image of Foulum, Denmark"></a>
  <figcaption>The EMISAR scene after full-resolution extraction.</figcaption>
</figure>

## Coherent analysis: Krogager decomposition

The Krogager decomposition splits the scattering matrix into three physical components:

- **Sphere:** odd-bounce scattering, equal in HH and VV and zero in the cross-pol channels. It behaves like a trihedral reflector and is strongest over flat, moderately rough surfaces.
- **Diplane:** double-bounce scattering, as from dihedral structures such as building–ground corners. It is also sensitive to the orientation angle.
- **Helix:** a circular-polarization component that captures more complex, volume-like and diffuse scattering.

<figure class="third">
  <a href="/images/projects/polsar-decomposition/krogager-sphere.jpg" target="_blank" rel="noopener"><img src="/images/projects/polsar-decomposition/krogager-sphere.jpg" alt="Sphere component"></a>
  <a href="/images/projects/polsar-decomposition/krogager-diplane.jpg" target="_blank" rel="noopener"><img src="/images/projects/polsar-decomposition/krogager-diplane.jpg" alt="Diplane component"></a>
  <a href="/images/projects/polsar-decomposition/krogager-helix.jpg" target="_blank" rel="noopener"><img src="/images/projects/polsar-decomposition/krogager-helix.jpg" alt="Helix component"></a>
  <figcaption>Sphere, diplane, and helix components (left to right).</figcaption>
</figure>

Assigning the three components to R, G, and B produces a composite in which each land cover has a distinct signature:

<figure>
  <a href="/images/projects/polsar-decomposition/krogager-rgb-annotated.png" target="_blank" rel="noopener"><img src="/images/projects/polsar-decomposition/krogager-rgb-annotated.png" alt="Krogager RGB composite with numbered regions"></a>
  <figcaption>Krogager composite (R = sphere, G = diplane, B = helix) with the six regions interpreted below.</figcaption>
</figure>

1. **Water:** dark in the sphere component. Calm water reflects specularly away from the sensor, so little energy returns; variations come from surface roughness such as wind waves.
2. **Forest:** bright in all three components, with volume scattering most prominent, which is consistent with tall vegetation.
3. **Urban:** all mechanisms present, with clear double bounce in the diplane image. Double bounce is weaker than in typical high-rise cities, likely because the buildings are low and the area lies in near range.
4. **Agriculture with medium-height crops:** bright in sphere and lowest in helix, indicating moderate roughness without strong double bounce.
5. **Bare or short-crop fields:** relatively dark overall, with the highest values in sphere, indicating mostly surface scattering.
6. **Ploughed or flat land:** similar to region 5, with even lower values in all components.

## Filtering before or after feature extraction?

The correct order depends on the method:

- **Coherent methods** (e.g., Krogager) work on the scattering matrix, which contains absolute phase. Filtering first would destroy that phase, so **features are extracted first and filtering is applied afterwards**.
- **Incoherent methods** (e.g., H/A/α) work on second-order covariance or coherency matrices, which contain no absolute phase, so **the order does not matter**.

## Incoherent analysis: H/A/α decomposition

The Cloude–Pottier decomposition uses the eigenvalues $$\lambda_1 \ge \lambda_2 \ge \lambda_3$$ of the coherency matrix, with $$P_i = \lambda_i / \sum_j \lambda_j$$.

**Entropy** measures how random the scattering is, from 0 (a single mechanism) to 1 (fully random):

$$H = -\sum_{i=1}^{3} P_i \log_3 P_i$$

<figure>
  <a href="/images/projects/polsar-decomposition/entropy.jpg" target="_blank" rel="noopener"><img src="/images/projects/polsar-decomposition/entropy.jpg" alt="Entropy image"></a>
  <figcaption>Entropy. Forest appears bright (random scattering); water appears dark (one dominant mechanism).</figcaption>
</figure>

**Anisotropy** describes the relative importance of the second and third mechanisms, and adds information mainly where entropy is medium to high:

$$A = \frac{\lambda_2 - \lambda_3}{\lambda_2 + \lambda_3}$$

<figure>
  <a href="/images/projects/polsar-decomposition/anisotropy.jpg" target="_blank" rel="noopener"><img src="/images/projects/polsar-decomposition/anisotropy.jpg" alt="Anisotropy image"></a>
  <figcaption>Anisotropy.</figcaption>
</figure>

**Mean alpha angle** identifies the scattering type: about 0° for surface scattering (water, bare soil), about 45° for volume scattering (vegetation), and towards 90° for double bounce (urban):

$$\bar{\alpha} = \sum_{i=1}^{3} P_i \, \alpha_i$$

<figure>
  <a href="/images/projects/polsar-decomposition/alpha.jpg" target="_blank" rel="noopener"><img src="/images/projects/polsar-decomposition/alpha.jpg" alt="Alpha angle image"></a>
  <figcaption>Mean alpha angle. Water is dark (near 0°), forest and urban areas are bright, and agricultural fields fall in between depending on crop type and condition.</figcaption>
</figure>

<figure>
  <a href="/images/projects/polsar-decomposition/h-a-alpha-rgb.jpg" target="_blank" rel="noopener"><img src="/images/projects/polsar-decomposition/h-a-alpha-rgb.jpg" alt="H/A/alpha RGB composite"></a>
  <figcaption>H/A/α composite (R = entropy, G = anisotropy, B = alpha).</figcaption>
</figure>

## Takeaways

Coherent and incoherent decompositions give complementary views of the same scene. The Krogager components make individual scattering mechanisms easy to see, while H/A/α describes how mixed the scattering is. Together they separated water, forest, urban, and several agricultural states without any training data, and the extracted features became the input for the [SVM classification project](/projects/polsar-svm/).
