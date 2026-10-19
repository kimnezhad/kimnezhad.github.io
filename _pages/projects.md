---
layout: archive
title: "Projects"
permalink: /projects/
author_profile: true
---

Course projects from my B.Sc. and M.Sc. studies at K. N. Toosi University of Technology. They are smaller in scope than my [research](/research/), but together they show the range of methods I have worked with: SAR polarimetry and interferometry, classical machine learning, neural networks, and image processing.

<div class="entries-list">
{% assign projects = site.projects | sort: "order" %}
{% for item in projects %}
  <article class="archive__item" style="display:flex; flex-wrap:wrap; gap:1.25em; align-items:flex-start; margin-bottom:2em; border-bottom:1px solid #e1e8ed; padding-bottom:1.5em;">
    {% if item.teaser %}
    <a href="{{ item.url | relative_url }}" style="flex:0 0 180px;">
      <img src="{{ item.teaser | relative_url }}" alt="{{ item.title }}" style="width:180px; height:130px; object-fit:cover; border-radius:4px;">
    </a>
    {% endif %}
    <div style="flex:1 1 280px;">
      <h2 class="archive__item-title" style="margin-top:0;">
        <a href="{{ item.url | relative_url }}">{{ item.title }}</a>
      </h2>
      <div class="archive__item-excerpt">{{ item.excerpt | markdownify }}</div>
    </div>
  </article>
{% endfor %}
</div>
