---
draft: true 
date: 2025-10-19 
categories:
  - Hello
  - World
tags:
  - Foo
  - Bar
authors:
  - tuandl
slug: how-to-create-a-blog-in-markdown
---

# How to create a blog in markdown?
This is an instruction to create a blog post in markdown format

<!-- more -->

1. Use the blog plugin from [material-mkdocs](https://squidfunk.github.io/mkdocs-material/setup/setting-up-a-blog/)
2. Create a folder structure:
```
root
|-- docs
  |-- index.md
  |-- blog
     |-- index.md
     |-- posts
       |-- post1.md
       |-- post2.md
```
3/. Add the metadata in the front of the blog:
```
---
draft: true 
date: 2024-01-31 
categories:
  - Hello
  - World
---
```
