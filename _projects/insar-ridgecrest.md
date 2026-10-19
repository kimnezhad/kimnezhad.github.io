---
title: "Earthquake Surface Displacement with Sentinel-1 InSAR"
order: 3
teaser: /images/projects/insar-ridgecrest/displacement-geocoded.png
excerpt: "Built a full differential InSAR workflow in SNAP using Sentinel-1 SLC images from before and after the July 2019 Ridgecrest (California) earthquakes, from co-registration and interferogram formation through phase unwrapping to a geocoded line-of-sight displacement map. <br/><br/> <b>Skills:</b> <i>Sentinel-1 TOPS InSAR, Phase Unwrapping, Goldstein Filtering, ESA SNAP, Geocoding</i>"
---

**Context:** Course project, K. N. Toosi University of Technology<br>
**Data:** Sentinel-1 IW SLC, ascending pass, VV polarization, 28 June 2019 (pre-event) and 10 July 2019 (post-event)<br>
**Tools:** ESA SNAP

## Objective

The goal was to map the ground deformation caused by the **2019 Ridgecrest earthquake sequence** in Southern California (4–5 July 2019) using differential SAR interferometry.

InSAR measures the phase difference between two SAR acquisitions of the same area. After removing the contributions of the flat Earth, topography, and noise, the remaining phase reflects changes in the sensor-to-ground distance, so a pre- and post-event pair reveals how much the surface moved along the satellite's line of sight.

<figure class="half">
  <a href="/images/projects/insar-ridgecrest/study-area.png" target="_blank" rel="noopener"><img src="/images/projects/insar-ridgecrest/study-area.png" alt="Study area in Southern California"></a>
  <a href="/images/projects/insar-ridgecrest/quicklooks.png" target="_blank" rel="noopener"><img src="/images/projects/insar-ridgecrest/quicklooks.png" alt="Sentinel-1 quick-look images"></a>
  <figcaption>Study area (left) and Sentinel-1 quick-looks for 28 June and 10 July 2019 (right).</figcaption>
</figure>

## Workflow

<figure>
  <a href="/images/projects/insar-ridgecrest/workflow.png" target="_blank" rel="noopener"><img src="/images/projects/insar-ridgecrest/workflow.png" alt="InSAR processing workflow"></a>
  <figcaption>Processing chain implemented in SNAP.</figcaption>
</figure>

**1. Co-registration.** The target area falls in sub-swath IW2, so the pair was co-registered on that swath. Corresponding pixels in the two images must align precisely for the phase difference to be meaningful. The modelled coherence of the secondary image was close to 1, confirming that the pair was suitable for interferometry. This is the only step that uses amplitude data.

**2. Interferogram formation.** Multiplying the first image by the complex conjugate of the second gives the interferogram, whose phase is the phase difference between the acquisitions. Each colour cycle (fringe) represents a 2π change in phase.

**3. Debursting.** Sentinel-1 TOPS data are acquired in bursts, which leave horizontal seams in the interferogram. Debursting merges them into a continuous image.

<figure>
  <a href="/images/projects/insar-ridgecrest/interferogram.png" target="_blank" rel="noopener"><img src="/images/projects/insar-ridgecrest/interferogram.png" alt="Initial interferogram"></a>
  <figcaption>Initial interferogram. Each colour cycle (fringe) is a 2π phase change.</figcaption>
</figure>

<figure>
  <a href="/images/projects/insar-ridgecrest/deburst.png" target="_blank" rel="noopener"><img src="/images/projects/insar-ridgecrest/deburst.png" alt="Before and after debursting"></a>
  <figcaption>Before (left) and after (right) debursting: the horizontal burst seams are removed.</figcaption>
</figure>

**4. Topographic phase removal.** Using a DEM, I removed the phase contribution of topography. Afterwards, fringes in high-relief areas smoothed out considerably, while tight fringes remained around the rupture zone, which is where real deformation is concentrated.

**5. Goldstein phase filtering** reduced phase noise so that the fringe pattern became clearer.

<figure>
  <a href="/images/projects/insar-ridgecrest/topo-removed.png" target="_blank" rel="noopener"><img src="/images/projects/insar-ridgecrest/topo-removed.png" alt="After topographic phase removal"></a>
  <figcaption>After topographic phase removal.</figcaption>
</figure>

<figure>
  <a href="/images/projects/insar-ridgecrest/goldstein.png" target="_blank" rel="noopener"><img src="/images/projects/insar-ridgecrest/goldstein.png" alt="After Goldstein filtering"></a>
  <figcaption>After Goldstein phase filtering.</figcaption>
</figure>

**6. Phase unwrapping.** The interferometric phase is only known modulo 2π (wrapped to [−π, π]). Unwrapping detects the 2π jumps and adds the correct integer multiples of 2π to recover a continuous phase field. Profiles drawn across the fringes show the effect clearly: the sawtooth pattern of the wrapped phase becomes a smooth curve.

<figure>
  <a href="/images/projects/insar-ridgecrest/profile-wrapped.png" target="_blank" rel="noopener"><img src="/images/projects/insar-ridgecrest/profile-wrapped.png" alt="Phase profile before unwrapping"></a>
  <figcaption>Phase profile across the fringes before unwrapping (sawtooth pattern).</figcaption>
</figure>

<figure>
  <a href="/images/projects/insar-ridgecrest/profile-unwrapped.png" target="_blank" rel="noopener"><img src="/images/projects/insar-ridgecrest/profile-unwrapped.png" alt="Phase profile after unwrapping"></a>
  <figcaption>The same profile after unwrapping (continuous phase).</figcaption>
</figure>

**7. Phase to displacement and geocoding.** Finally, I converted the unwrapped phase into line-of-sight displacement and terrain-corrected the result to geographic coordinates.

<figure>
  <a href="/images/projects/insar-ridgecrest/displacement.png" target="_blank" rel="noopener"><img src="/images/projects/insar-ridgecrest/displacement.png" alt="Line-of-sight displacement in radar geometry"></a>
  <figcaption>Line-of-sight displacement in radar geometry.</figcaption>
</figure>

<figure>
  <a href="/images/projects/insar-ridgecrest/displacement-geocoded.png" target="_blank" rel="noopener"><img src="/images/projects/insar-ridgecrest/displacement-geocoded.png" alt="Geocoded displacement map"></a>
  <figcaption>Geocoded line-of-sight displacement map.</figcaption>
</figure>

## Takeaways

This project took me through every stage of a Sentinel-1 interferometric workflow, including TOPS-specific steps such as sub-swath selection and debursting. It also gave me hands-on experience with the same SNAP toolchain and Sentinel-1 data handling that I now use for sea-ice classification preprocessing.

A single ascending pair only measures displacement along one line of sight. Combining ascending and descending geometries would be the natural next step to separate vertical and east–west motion.
