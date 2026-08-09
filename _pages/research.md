---
title: "Research"
permalink: /research/
layout: single
author_profile: true
---

<div class="entries-list">
  {% for item in site.portfolio %}
    <article class="archive__item" style="margin-bottom: 2.5em; border-bottom: 1px solid #e1e8ed; padding-bottom: 1.5em;">
      <h2 class="archive__item-title">
        <a href="{{ item.url | relative_url }}">{{ item.title }}</a>
      </h2>
      
      <div class="archive__item-excerpt">
        {{ item.excerpt | markdownify }}
      </div>
    </article>
  {% endfor %}
</div>
