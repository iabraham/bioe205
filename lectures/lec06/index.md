+++
title = "Lecture 6"
tags = ["code"]
hascode = true
+++

# Lecture 06

> **Reading material:** Section 3.1 - 3.3 of CSSB.

#### Recap & Intro
Last time, we discussed correlations, the concept of orthogonality, inner
products, the issue with correlations and the use of averaging to filter out
noise. 

In this lecture and the next we will try to tie together a few concepts
introduced so far to understand the Fourier series and expansions.  


\toc 

\note{CSSB provides an alternative introduction to the Fourier analysis than
this lecture. This lecture note does **not** replace it. In particular,
students **should** read Sections 3.3.1 - 3.3.6 (included) of CSSB. The
textbook also provides code implementations of many of the algorithms and
procedures; so these notes, will instead try to supplement intuition.}

## Some background 

We tend to think of a vector as a tuple or collection of real numbers. 
Intuitively, this makes sense to us because in two and three dimensions these
correspond to the familiar coordinates from 2D and 3D geometry. Vector
addition, multiplication etc. are thus intuitively familiar to us and we have
no qualms with writing: _let_ $x \in \mathbb{R}^3$ to refer to a vector in 3D.
In fact, we are even comfortable with: _let_ $y \in \mathbb{R}^n$. Now let us
take a step back and think of $\mathbb{R}^n$. 

What is it?

### Vector spaces

We naturally think of $\mathbb{R}^n$ as the _space_ in which $x$ or $y$ or our
vectors _live_ in or _belong_ to - a **vector space**.
How is this formalized? Well, recall from
BIOE210[^1] that we have [field
axioms](https://mathworld.wolfram.com/FieldAxioms.html) that specify the rules
followed by elements that we can do algebra with. Similarly, there are axioms
or rules that a space $V$ must satisfy to be a *vector space*. Note that here
is no specification in the field axioms on what the elements $a, b$ and $c$
are: only that they follow some rules. 

In the same vein, there are no restrictions
on _what_ we can consider as **vectors** in a **vector space** as long as they
follow [these rules](https://mathworld.wolfram.com/VectorSpace.html). Don't be
intimidated by the math on that page: you already know a few vector spaces! For
example $\mathbb{R}, \mathbb{R}^2$ and $\mathbb{R}^n$ are all vector spaces
which follow those rules; only that the rules are written up in an abstract
way.


\emphasis{**Key point** here is that $\mathbb{R}^n$ is *not* the only thing that follow the
rules of vector space. There are more abstract
[things/objects](https://en.wikipedia.org/wiki/Examples_of_vector_spaces) that
we can show are vector spaces! This includes $\dots$ you guessed it: certain classes of
signals and functions.}


### Basis 
Now follows a slightly wordy definition:
\definition{Basis}{
Given a vector space $V$, a set of vectors $B$ serves as basis for $V$ if every
element of $V$ may be written in a unique way as a finite [linear
combination](https://en.wikipedia.org/wiki/Linear_combination) of elements of
$B$.} 
There is of course a more formal and precise definition one can give but that
will get into more math than we need here. Instead we will try to understand
what a basis is with some examples. 

\collaps{**Question:** What is a basis for $\mathbb{R}^2$? Is it
unique?}{**Answer:** We can take 
\nonumber{$$
e_1 := \begin{bmatrix} 1 \\ 0 \end{bmatrix} \quad \textrm{and} \quad e_2 :=
\begin{bmatrix} 0 \\ 1 \end{bmatrix} 
$$}
as a basis for $\mathbb{R}^2$. Then any vector $v = [v_1, v_2]^T \in \mathbb{R}^2$ is by 
default a linear combination 
\nonumber{$$
v = v_1 \begin{bmatrix} 1 \\ 0 \end{bmatrix} +
v_2 \begin{bmatrix} 0 \\ 1 \end{bmatrix} = \sum \limits _{k=1}^{2} v_i e_i
$$}
This basis is not unique as we will see later. 
}

Take note of how we have written a summation to express $v$ in terms of the
basis. This way of writing vectors will show up a lot. 

Whenever we talked of vectors, we have been implicitly using a basis -- in fact
the standard basis $\{e_k\}$ which are defined as vectors that are zero in all
entries except the $k$-th one. Thus even a vector like $v = [3,
4, 5]^T$ is actually $v = 3e_1 + 4e_2 + 5e_3$ where
\nonumber{$$
e_1 = \begin{bmatrix} 1 \\ 0 \\ 0 \end{bmatrix}, \quad 
e_2 = \begin{bmatrix} 0 \\ 1 \\ 0 \end{bmatrix}, \quad 
e_3 = \begin{bmatrix} 0 \\ 0 \\ 1 \end{bmatrix}  
$$}
Therefore, $[3, 4, 5]^T$ is shorthand specifying what _weights_ we must use to sum
the $e_k$ such that they add to $v$!

\emphasis{We are always using _some_ basis (even if implicitly) when we express
vectors in their _coordinates_.}

As mentioned above, the choice of the basis vector set $B$ is not unique. It
just so happens that the set $\{e_k\}_{k=1}^n$ as the basis for $\mathbb{R}^n$
is extremely convenient. The construction below shows how the same point in
$\mathbb{R}^2$ can be represented in two different bases. 

The black axes obviously represent the standard basis $e_1$ and $e_2$.
The blue pair of rays represent the directions given by a new set of basis
vectors $B$ (in black) that you can choose by entering the vectors $a$ and $b$
into the input boxes. Since we are in 2D or equivalently $\mathbb{R}^2$, 
we need a pair of basis vectors $B=\{a, b\}$ and each vector has two entries,
$a=[a_x, a_y]^T$ and $b=[b_x, b_y]^T$. 

~~~
<iframe scrolling="no" title="BasisChange2D"
src="https://www.geogebra.org/material/iframe/id/vnkjjya6/width/760/height/500/border/888888/sfsb/true/smb/false/stb/false/stbh/false/ai/false/asb/false/sri/false/rc/false/ld/false/sdz/true/ctl/false"
width="760px" height="500px" style="border:0px;">
</iframe>
~~~

Then moving the blue point around shows how it is represented
in coordinates that utilize the usual basis (in black) and the newly chosen
basis (in blue). Thus the blue coordinates & the black coordinates represent
the same vector in $\mathbb{R}^2$ but with different sets as the basis.

\collaps{**Question:** Represent $v = [v_1, v_2]^T$ in the basis $B = \{b_1,
b_2\}$ where 
\nonumber{$$
b_1 = \begin{bmatrix}1 \\ 1 \end{bmatrix} \quad \textrm{and} \quad b_2 =  \begin{bmatrix} 0  \\ 1 \end{bmatrix}
$$}}{
**Answer:** We can write:
\nonumber{$$
v = v_1 b_1 + \left(v_2 - v_1 \right)b_2
$$}
}

This non-uniqueness of the basis set is not a peculiar feature of just
$\mathbb{R}^2$ or $\mathbb{R}^n$. 

\collaps{**Question:** One can show that the space $P_n(x)$ of polynomials in
$x$ of degree at most $n$ is a vector space. A basis $M_n$ for $P_n(x)$ are the
monomials $x^k$ for $k=0, 1, 2, \dots, n$. Express
$f(x) = (x + 1)^3$ as a vector $v$ in $P_3(x)$ using the $M_3$ basis.}{
**Answer:** The coordinates of $f(x)$ are found by expanding $f(x) = x^3 + 3x
+ 3x^2 + 1$. The set $M_3$ by definition is:
\nonumber{$$
M_3 = \left\{1, x, x^2, x^3 \right\}
$$}
Since $f(x) = \textcolor{blue}{1} \cdot 1 + \textcolor{blue}{3} \cdot x +
\textcolor{blue}{3} \cdot x^2 + \textcolor{blue}{1} \cdot x^3$ we can say the
coordinates are $v = [1, 3, 3, 1]$ in the basis given by $M_3$. If we use $m_k$
to represent the elements $x^k$ of $M_3$ then we can say:
\nonumber{$$
f(x) = (1 + x)^3 \quad \Leftrightarrow \quad f(x) = \sum \limits _{k=0}^3 v_k m_k
$$}
where again we have written $f$ as a summation of the basis elements.
}

As shown above $P_n(x)$ has the familiar basis $\{1, x, x^2, x^3, \dots, x^n\}$
that we are used to seeing. But we can also find another basis set. For example
consider the polynomials in $x$ given by 
$$
L_n(x):= \dfrac{1}{2^n n!} \dfrac{d^n}{dx^n} \left( x^2 - 1 \right)^n \qquad n
= 0, 1, 2, \dots, 
$$
One can show that the set $\{L_k(x)\}_{k=1}^n$ is also a basis for $P_n(x)$. 

\collaps{**Question:** Express $f(x) = (x + 1)^3$ in the basis given by the
[Legendre polynomials](https://mathworld.wolfram.com/LegendrePolynomial.html) defined above.}{
**Answer:** Since $f(x) \in P_3(x)$ we write out the relevant basis vectors:
\begin{align*}
L_0 &= 1, \qquad  
L_1 = x,  \qquad  
L_2 = \dfrac{1}{2} \left(3x^2 -1 \right), \\
L_3 &= \dfrac{1}{2} \left(5 x^3 - 3x \right)
\end{align*}
One can verify that $f(x)$ expressed as a vector in this new basis is $v = [2, 18/5,
2, 2/5]$. That is
\nonumber{$$
f(x) = \textcolor{blue}{2} \cdot L_0(x) + \textcolor{blue}{18/5} \cdot L_1(x) +
\textcolor{blue}{2} \cdot L_2(x) + \textcolor{blue}{2/5} \cdot L_3(x) \quad
\Leftrightarrow  \quad
v = \sum \limits _{k=0}^3 v_k L_k
$$}

**Be sure to work this out:** Verify (a) the application of the defining
equation to write out the basis vectors as well as (b) the fact that $(1+x)^3$ is
indeed $[2, 18/5, 2, 2/5]$ in this basis. 
}

### Why do we care?
Apart from providing a preview of what will be a major & crucial topic in any
course on linear algebra[^2]; they main take away here is that representing a
problem or situation in a different basis can often make things simpler or
provide more insight into a problem. For example polar & spherical coordinates
often simplify problems in physics as you may recall. 

Indeed, many important techniques you will learn, including Principal
Components Analysis, Singular Value Decomposition, eigendecompositions etc. are
all essentially a **change of basis** to some particularly useful basis vectors.
Moreover, change of basis calculations form an extremely important part of
various analytical & problem solving techniques including solving differential
equations, implementing matrix multiplications, etc. 

More pertinently for us, recall that we can think of signals and functions as
being elements of certain vector space.  It turns out that the in the
continuous domain, what is akin to the _change-of-basis_ we discussed above are
called **integral transforms** $\dots$ but more on that later. 


## Fourier Transform(s)

CSSB talks about four different "transforms" in the forward and reverse
directions[^3]. They are listed as: 

\tableinput{}{./transformtypes_forward.csv}

Please take care to use the right name because each of the techniques have
slightly different areas of applicability as listed in the table. 
We will start with the DFT above, and discuss each in turn, though we
may not follow the unwieldy notation used in CSSB. We start with the DFT
because it is directly related to the discussions we have had above. 

### Discrete Fourier Transform (DFT)
Given one period of discrete periodic signal $f$ as vector of length $N$
we define the DFT of it as the sequence of $N$ complex numbers given by:
$$ \label{fdft}
F[k] := \dfrac{1}{\sqrt{N}} \sum \limits _{n=0} ^{N-1} f[n] e^{-i n \omega_k}
\quad \textrm{where} \quad \omega_k := \dfrac{2 \pi k}{N} \quad \textrm{and}
\quad k=0, 1, \dots, N-1
$$
Note the similarity of the above summation with those we have been using to
express vectors in terms of different basis. This is no coincidence because the
*inverse* DFT is:
$$ \label{idft}
f[n] := \dfrac{1}{\sqrt{N}} \sum \limits _{k=0}^{N-1} F[k] e^{i n \omega_k}
\quad \textrm{for} \quad n=0, 1, 2, \dots, N-1
$$

We finally hit pay dirt for mining through all the math so far. 

\emphasis{**Key point:** Thus, one can view the DFT (forward) as computing the
coefficients ($F[n]$) we need to express the original discrete signal $f[k]$ in
terms of a new basis of complex exponentials.}

One naturally wonders why we would bother to write a signal in terms of
complex exponentials. Here is where we tie up another thread we introduced a
couple of lectures back: _complex exponentials are sinusoids_ and sinusoids are 
the "nicest" periodic functions in a sense[^4]. \highlight{Therefore, we
are expressing the original signals as a summation of sinusoids of different
frequencies!}

Fourier's great insight was that theoretically, *any* periodic function can be
expressed in terms of a summation of sines & cosines $+$ a constant. In
practice though, there are a few caveats. For example, the function to be
expressed needs to be "nice" in certain mathematical terms. Sometimes the
summation needed might be an infinite one which we cannot do on a computer. The
demonstration below illustrates this with a square wave. The first collection
of plots (of different colors) show the sinusoids of five different frequencies
being added together to create the plot immediately below it (green). The green
plot can be changed by using the checkboxes to add/remove sine wave of a
particular frequency. The last plot (brown) shows what happens when you
increase the number of frequencies being summed together (using the slider). At
its maximum value, we see that we get very good approximation of a square wave.

~~~
<iframe scrolling="no" title="FourierSquareWaves"
src="https://www.geogebra.org/material/iframe/id/bhr8mreu/width/760/height/500/border/888888/sfsb/true/smb/false/stb/false/stbh/false/ai/false/asb/false/sri/false/rc/false/ld/false/sdz/false/ctl/false"
width="760px" height="500px" style="border:0px;"> </iframe>
~~~

In the above definition we took a complete period of a signal $f[k]$ when we
computed its transform. This is an implicit assumption whenever we perform the
DFT. In practice, it is rarely the case that we will have one complete period
of the signal we are performing DFT on which leads to some artefacts. These
will be the subject of subsequent lectures. 

Note that while we discuss other flavors of the transform next; the only real
one we can implement and perform on real world signals is the DFT via a
computer. Nevertheless, the other transforms are important to know for purposes of
analysis and problem solving and we look at these next. 

\note{
1. We have used square brackets $[ \cdot ]$ in the above in the usual sense to
   mean discrete signals but also pay close attention to the indices and the
   use of $F$ vs $f$ (one refers to the signal and the other its transform).
2. The normalization we have used above for both the DFT and iDFT is
   $\sqrt{N}$. CSSB and some other texts/implementations present an
   unnormalized DFT and normalized iDFT (by $N$), which means one must
   remember where to put the $N$. 
}

At this point, it might be instructive to take a minute and recall that we
remarked in [Lecture 01](/lectures/lec01/) that signals admit equivalent time
and frequency domain representations and referred to this figure below. It is
precisely via the Fourier transform that we get the frequency domain
representation. Each coordinate on the right panel gives us three things: a
frequency, a phase and a magnitude corresponding to a single sinusoid in the
(possibly infinite) summation required to represent it.  

\input{plot}{eeg}

\collaps{**Question:** Verify that that the two transforms defined by
\eqref{fdft} and \eqref{idft} are inverses of each
other. You may skip this exercise on the first reading.}{**Answer:** This
is an exercise that every engineer must do at least once. Hence it is a
homework problem but here are some hints:

To show they are inverses one should go back and forth between
equations -- put \eqref{fdft} in \eqref{idft} and get the identity & vice versa.
However, the ideas are essentially the same so it suffices to just do one. To
start, note that in \eqref{fdft} the $n$ is a dummy variable used only for
summation and is distinct from the $n$ in \eqref{idft} where is referring to
the $n$-th coordinate of $f$. So start by rewriting the forward transform
as:
\nonumber{$$
 F[k] = \dfrac{1}{\sqrt{N}} \sum \limits _{m=0} ^{N-1} f[m] e ^{-im \omega_k}
  $$}
Plug this into \eqref{idft} to get $\dfrac{1}{N}$ times a double sum. The term
that will need to be addressed is the $e^{i\omega_k(n-m)}$ term. Show that the
sum $\sum_k e^{i \omega_k (n-m)}$ reduces to $N$ if $m=n$ and zero otherwise.
For this step, using the definition of $\omega_k$ and recalling the formula for
a sum of a [geometric
series](https://en.wikipedia.org/wiki/Geometric_series#Finite_series):
\nonumber{$$
\sum \limits _{j=1} ^p ar^{j-1} = \dfrac{a(1-r^p)}{1-r}
$$}
maybe helpful. **Hint:** $e^{2\pi i k /N} = (e^{2 \pi i /N})^k$.

Finally show that the leftover sum $\sum_m f[m] \left( \dots \right)$ therefore
is simply $f[n]$ since the only nonzero term arises when $m=n$. 
}

\caution{Mathematically speaking, the interpretation that we just made, 
i.e. viewing Fourier transforms and expansions as a change-of-basis might seem
fraught with difficulties beyond the DFT; but for our purposes in this
course and for almost all engineering purposes -- this interpretation serves
just fine.}

### Fourier Series 

In the above discussion, we had a discrete periodic signal to begin with. What
happens if instead we have a continuous periodic signal? We no longer have any
indices to sum over; so we should adjust our equations a bit. While in terms of
implementation, everything in a computer relies on the DFT, conceptually we
tend to think in terms of continuous signals and so we get the Fourier series.

To go from discrete to continuous recall that we summed over a complete period
of a signal. For continuous signals the summation becomes an integration and 
just like before we integrate over a full period $T$. Moreover the summation
variable $n$ turns into the integration variable $t$. Thus as we replace $f[t]
\mapsto f(t)$ we also do:
\nonumber{$$
\sum \limits _{n=0} ^{N-1} \dots  \quad \mapsto \quad \int \limits _0 ^T \dots
\qquad \textrm{and} \qquad e^{-i n \omega_k } \quad \mapsto \quad e^{-i
\omega_k t}
$$}
Thus we get that Fourier Series corresponding to a periodic signal $f(t)$ over
one period $[0, T]$ is given as:
$$ \label{ffs}
F[k] = \dfrac{1}{T} \int \limits _{0} ^T f(t) e^{-i k \omega_0 t} dt \quad
\textrm{where} \quad \omega_0 := \dfrac{2\pi}{T} \quad \textrm{and} \quad
k=0, \pm 1, \pm 2, \dots 
$$
The quantity $\omega_0$ should be familiar to us from our discussion of
periodic signals and is in the context of Fourier analysis called the
_fundamental frequency_. Moreover, in literature it is common to call
\eqref{ffs} and \eqref{fdft} as **forward** or **analysis** equations and the
inverse transform as in \eqref{idft} as the **synthesis** equation because
these synthesize our signal out of sinusoids. Thus, for a continuous periodic
signal, the synthesis equation is given by:

$$
f(t) = \sum \limits _{k=-\infty} ^{\infty} F[k] e^{i k \omega_0 t} \quad
\textrm{and} \quad t \in [0, T]
$$

Note that the synthesis equation is still a summation and the analysis
equations generates an infinite sequence of Fourier coefficients $F[k]$. This
explains the reason why we call it the Fourier Series.
~~~
<p align="center"><a href="/lectures/">[back]</a></p>
~~~

[^1]: No assumption is made that you have taken that class; if you are concurrently registered you will see the field axioms this semester. If not, ignore the statement. 
[^2]: Which BIOE205 isn't, so we must wrap up the discussion. 
[^3]: As you will see on this page, some of the "transforms", especially the first discrete ones, doesn't actually involve integrals, but it is common refer to them all as transforms anyway.
[^4]: For example, they are infinitely differentiable, admit Taylor series expansions, are orthogonal, etc. 
