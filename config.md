<!--
Add here global page variables to use throughout your website.
-->
+++
author = "Ivan Abraham"
mintoclevel = 2
maxtoclevel = 3

# Add here files or directories that should be ignored by Franklin, otherwise
# these files might be copied and, if markdown, processed by Franklin which
# you might not want. Indicate directories by ending the name with a `/`.
# Base files such as LICENSE.md and README.md are ignored by default.
ignore = ["node_modules/", "sp2023/", "sp2023"]

# RSS (the website_{title, descr, url} must be defined to get RSS)
generate_rss = true
website_title = "BIOE 205"
website_descr = "Course website for BIOE: 205 Signals and Systems in Bioengineering"
website_url   = "https://courses.grainger.illinois.edu/bioe205/sp2023/"
prepath = "/bioe205/sp2023/"
output = "sp2023"
+++

<!--
Add here global latex commands to use throughout your pages.
-->
\newcommand{\R}{\mathbb{R}}
\newcommand{\scal}[1]{\langle #1 \rangle}
\newcommand{\C}{\mathbb{C}}
\newcommand{\collaps}[2]{
~~~<button type="button" class="collapsible">~~~ #1 ~~~</button><div class="collapsiblecontent">~~~ #2 ~~~</div>~~~
}
\newcommand{\highlight}[1]{
~~~<span style="color:blue;">#1</span>~~~
}
\newcommand{\figstyled}[2]{
~~~
<figure>
<img src="!#1" style="#2" alt=""/>
</figure>
~~~
}

\newcommand{\figcap}[3]{
~~~
<figure style="text-align:center;">
<img src="!#1" style="#3" alt="#2"/>
<figcaption>#2</figcaption>
</figure>
~~~
}
\newcommand{\definition}[2]{
  @@definition
  **Definition**: (_!#1_)
  #2
  @@
}


\newcommand{\theorem}[2]{
  @@definition
  **Theorem**: (_!#1_)
  #2
  @@
}

\newcommand{\note}[1]{@@note @@title ⚠️ Note@@ @@content #1 @@ @@} 
\newcommand{\caution}[1]{@@caution @@title ❗ Caution@@ @@content #1 @@ @@} 
\newcommand{\warn}[1]{@@warning @@title ⛔ Warning!@@ @@content #1 @@ @@}


\newcommand{\emphasis}[1]{
  @@important #1 @@
}
