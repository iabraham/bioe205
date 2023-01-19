+++
title = "Lecture 5"
tags = ["code"]
hascode = true
+++

# Lecture 05

> **Reading material:** Section 2.2 & 2.4 of the textbook.

#### Recap
Last time we discussed some common types of signals, the decibel scale, as well
as definitions of some common statistics related to signals (mean,
variance, SNR, correlation etc.). Today we continue the same topics albeit with
a bit more emphasis on implementation details and try to close out Chapter 2. 


\toc

## Correlations & orthogonality
Recall from last time the definition we had for Pearson correlation:
\nonumber{$$
r_p(x, y) = \dfrac{1}{N-1} \sum \limits _{k=1} ^N \left( \dfrac{x_k -
\mu _x}{\sigma _x} \right) \cdot \left(\dfrac{y_k - \mu _y}{\sigma _y} \right)
$$}
In particular, we showed that if $x$ and $y$ are zero-mean signals then we can write:
\nonumber{$$
r(x, y) = \sum \limits _{k=1} ^N \frac{x_k y_k}{\sqrt{\sum x_i^2 } \sqrt {\sum y_i^2}}
$$}
which in vector notation can be written as:
$$
r(x, y) = \sum \limits _{k=1} ^N \frac{x_k y_k}{\sqrt{\sum x_i^2 } \sqrt {\sum y_i^2}} = \dfrac{x^Ty}{\|x\|\|y\|}
$$
The quantity in the numerator after the second equality is often written as 
$$
\langle x, y \rangle := x^T y = \sum \limits _{k=1} ^N x_k y_k 
$$
and called the _inner product_ between two vectors. We say two vectors are
_orthogonal_ if their inner product is zero. 

\collaps{**Question:** What is the inner product of a vector with
itself?}{**Answer:** Exercise!}

_Orthogonality_ of vectors and signals are important concepts that will show up
later. However, for now it suffices to understand why the term orthogonality
shows up. Let $u = (a, b)$ be a vector on the plane. The animation below shows
this vector $u$ along with the construction: $v=(-b, a)$. Note that $\langle u,
v \rangle \equiv 0$!. 

~~~
<iframe scrolling="no" title="Two orthogonal vectors" src="https://www.geogebra.org/material/iframe/id/hmf6fxby/width/700/height/500/border/888888/sfsb/true/smb/false/stb/false/stbh/false/ai/false/asb/false/sri/true/rc/false/ld/false/sdz/true/ctl/false" width="700px" height="500px" style="border:0px;"> </iframe>
~~~

This concept extends to higher dimensions as well as to continuous time
signals[^1]. Note that the choice of _inner product_ can change depending on
the type of "vector" as long as it satisfies some [mathematical
properties](https://mathworld.wolfram.com/InnerProduct.html). For
example, in the below exercise, we make use of an inner product defined via
integration for continuous time signals. 

\collaps{**Question:** Let $f_n(t) = e^{int}$ be functions for $n \in \mathbb{Z}$
defined via the Euler identity from Lecture 03. Show they are orthogonal under
the inner product defined by 
$$
\langle f, g \rangle := \dfrac{1}{2\pi} \int \limits _0 ^{2\pi} f(t)
\overline{g(t)} dt
$$
where $\overline{g(t)}$ is the complex conjugate of $g(t)$.}{**Answer**: We leave
it as an exercise to show:
$$
\langle f_j, f_k \rangle = \dfrac{1}{2\pi} \int \limits _0 ^{2\pi} e^{(j-k)it}
dx
$$ which evaluates to 
$$
\langle f_j, f_k \rangle = \begin{cases} 1, \quad & j=k \\ 0, \quad & j \neq k 
\end{cases}
$$}

As we will see later, the above result is the cornerstone of the Fourier series
and expansion that we will see in later chapters. For now we will leave the
reader to work out the following. 

\collaps{**Question:** Use the above result and Euler's identity to show that
$ f= \sin(nt)$ and $g = \cos(mt)$ where $m, n \in \mathbb{Z}$ are
orthogonal.}{**Answer:** Homework hint - note that $\cos(mt)$ can be written
as:
$$
\dfrac{\exp(imt) + \exp{(-imt)}}{2}
$$
and something similar applies to $\sin(nt)$ as well. 
}

### The problem with correlation
We will revisit the topic of orthogonality of sines & cosine later; but for now
we are faced with a problem. Given an unknown signal $x$, if we compute its
correlation with a reference $y$, the value of the correlation can be zero even
if the waveforms are identical (consider $x=\sin(x)$ and its time shift: $\sin(x
- \pi/2) = \cos(x)$ which is orthogonal to it). Thus, we might get that the
correlation between a signal and its own timeshift might be zero as illustrated
in the below figure!

[\input{plot}{shiftex}](/assets/lectures/lec05/code/shiftex.jl)

As we can see in the above figure we have a sine wave and a cosine wave of 2 Hz
frequency with the panels showing the sine wave shifted by $\pi/4$ and $\pi/2$
units and yielding different levels of correlation with the reference cosine
wave.  

To get around this limitation, it is common to perform correlations between a
signal $x(t)$ and _all possible shifts_ of the reference $y(t)$ and then use
the maximal correlation found. The shifts involved are often called lags and
the procedure of computing correlation between $x$ and lagged versions of $y$
commonly called _cross correlating_. Mathematically, for each lag $k$ (or lag
variable $\tau$ in continuous time) we have: 
$$
r_{xy}[k] = \dfrac{1}{N} \sum \limits _{n=1}^N x[n] y[n-k]  \qquad \textrm{and} \quad r_{xy}(\tau) = \dfrac{1}{T}  \int \limits _0 ^T x(t) y(t+\tau) dt 
$$

The very last plot above and the equations deserve a little bit of explanation.
The bottom right figure has shows correlation value (un-normalized) on the y-axis and lags on
the x-axis. The last plot is thus generated by computing many correlation
values at each possible lag. 

\collaps{**Question:** Can you work out why the maximum correlation is attained
at 0.125 seconds?}{**Hint:** For a 1 Hz wave a shift of $\pi/2$ corresponds to
a time shift of 1/4th the period. The above is a 2 Hz wave. The astute reader
might observe that the a similar level of negative correlation is not attained
at a shift of 0.375 seconds. **Why?**}

Given two signals, as in the figure below, it is not immediately clear how to implement the
above formula since shifting the signal leaves it undefined what multiplication
should be performed for certain indices. It is commonly accepted to _zero pad_
the signals after shifting so that the correlation is still computed between
signals of the same length. Thus, in common implementations, the lag vector
ranges from $-N+1$ to $N-1$. The figure below indicates zero padding being
performed for a lag of 3 units. 

[\input{plot}{zeropad}](/assets/lectures/lec05/code/zeropad.jl)

It is because of this implementation detail, i.e. zero-padding that the
absolute value of the negative correlation at 0.375 seconds in the previous
figure is less than the positive correlation at 0.125 seconds.  

Note that while we visualized how to perform cross correlation with zero
padding for two equal sized vectors; in reality there is nothing preventing us
from adopting the same procedure for finding lagged cross correlations between
vectors of differing lengths. The next exercise illustrates this case. 

**Question:** Find the lagged cross-correlation between 
\nonumber{$$ x = [a, b, c, d, e] $$} 
and
\nonumber{$$ y = [-1, 0, 1] $$}
assuming $x$ is a zero-mean vector. \\
**Answer:** For simplicity we calculate the _un-normalized_ correlation. Given
vectors of length $m$ and $n$, we expect to perform $m+n-1$ lagged
correlations. These 7 correlation calculations are shown below along with their
corresponding lags:
\begin{align*}
r_{xy}[1] &= (-1 \times 0) + (0 \times 0) + (1 \times a),\qquad l =& -3 \\
r_{xy}[2] &= (-1 \times 0) + (0 \times a) + (1 \times b),\qquad l =& -2 \\
r_{xy}[3] &= (-1 \times a) + (0 \times b) + (1 \times c),\qquad l =& -1 \\
r_{xy}[4] &= (-1 \times b) + (0 \times c) + (1 \times d),\qquad l =& 0 \\
r_{xy}[5] &= (-1 \times c) + (0 \times d) + (1 \times e),\qquad l =& 1 \\
r_{xy}[6] &= (-1 \times d) + (0 \times e) + (1 \times 0),\qquad l =& 2 \\
r_{xy}[7] &= (-1 \times e) + (0 \times 0) + (1 \times 0),\qquad l =& 3 \\
\end{align*}



### MATLAB implementation

The following code is taken from CSSB and is an implementation of the lagged
cross-correlation function for vectors of the same length with zero-padding. 

\input{matlab}{crosscorr.m}

\collaps{**Exercise:** Does the above code assume the inputs are row vectors or
column vectors? Modify the above MATLAB function to work for inputs of
differing length.}{**Solution:** Left as an exercise. See Example 2.18 in
CSSB.In particular pay attention to what happens when one vector's length is an
odd number and the others even.}

## Introduction to filtering

In this section we change gears a bit and discussing filtering; a rich topic in
its own right. Recall that we said the definition of _signal_ and _noise_ are
relative terms; i.e. what is pertinent to our analysis is our signal and
everything else can be termed noise. It is no surprise then that we seek to
have techniques to eliminate or reduce noise levels compared to signals in our
observation or analysis of systems. 

### Averaging to reduce noise

One easy way to reduce variability in our observation is to take multiple
measurements and then take an average. This ties well with our intuition that
as we consider more and more samples/observations/measurements the likelihood
of us approaching the true distribution of the data increases. 

Consider the following plot which consist of multiple measurements of body
temperature taken with a thermometer that is only accurate to $\pm 2^\circ$ F
(not a very good thermometer). The true body temperature is marked with a blue
line.

\input{plot}{averaging}

The right side panels show how consider increasing number of samples and averaging
them let's us approach the true value over repeated measurements. Further, it
can be [shown](https://en.wikipedia.org/wiki/Standard_error#Derivation) that
the "error" scales as $\sqrt{N}$ when considering the mean of $N$ measurements.
This observation can be verified in the above plot. 


\collaps{**Question:** CSSB states that
> When multiple measurements are made, multiple values or signals are obtained.
> If these measurements are combined or added together, the means add so that the
> combined value or signal has a mean that is the average of the individual
> means. 
Suppose we have $m$ sets of measurements, $S_1, S_2, \dots S_m$ where each set
$S_k$ has size $N_k$ and mean $\mu _k$. Call the entire collection of
measurements as $S = \{S_1, S_2, \dots, S_m\}$. Is it true that the average of
the means $\mu_k$ is the same as the mean $\mu _S$ of $S$?}{ **Answer:** Left
as an exercise.}

### Ensemble averaging

CSSB (and therefore our course) refers to constructing a single
timeseries/signal out of multiple ones by averaging them _in_ time (technically
[pointwise](https://en.wikipedia.org/wiki/Pointwise)) as _ensemble averaging_.

The idea here is the same: averaging reduces variability and thus might enable
one to see systemic patterns not obvious by examining individual signals.
Consider for example the very noisy sinusoid from [Lecture
03](/lectures/lec04/#signal_to_noise_ratio_snr) reproduced here in the left plot. Taking
50 such noisy sinusoids and averaging them pointwise reduces the noise
artifact. 

[\input{plot}{ensemble}](/assets/lectures/lec05/code/ensemble.jl)

Section 2.4.4 of CSSB for further details. 


~~~
<p align="center"><a href="/lectures/">[back]</a></p>
~~~

[^1]: Actually it applies to all [vector spaces](https://en.wikipedia.org/wiki/Vector_space#Normed_vector_spaces_and_inner_product_spaces) that can be equipped with an [inner product](https://en.wikipedia.org/wiki/Inner_product_space#Hilbert_space) but we will not get to that level of abstraction in this course. 
