---
title: "Research & Applied Methodology"
permalink: /research/
layout: single
author_profile: true
---

My research emphasizes methodological rigor and computational modeling. The following case studies outline my approach to optimizing algorithms and evaluating robust statistical metrics such as the $F_1$-score and Matthews Correlation Coefficient ($MCC$).

<div class="grid__wrapper">
  {% for item in site.portfolio %}
    <div class="grid__item">
      <article class="archive__item">
        <h2 class="archive__item-title">
          <a href="{{ item.url | relative_url }}">{{ item.title }}</a>
        </h2>
        
        <div class="archive__item-excerpt">
          {{ item.excerpt | markdownify }}
        </div>
        
        <a href="{{ item.url | relative_url }}" style="text-decoration: underline; font-weight: bold;">
          Review Full Methodology
        </a>
      </article>
    </div>
  {% endfor %}
</div>
