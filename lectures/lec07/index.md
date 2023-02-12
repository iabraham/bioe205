+++
title = "Lecture 7"
tags = ["code"]
hascode = true
hastex = true
+++

# Lecture 07

> **Reading material:** Section 3.3 - 3.4 (inclusive) of CSSB.

#### Recap 
All of last lecture we spent building up intuition on what Fourier expansions
and series do for us. The takeaway was that Fourier series represents a
continuous periodic function in terms of a new basis of sines and cosines, and
that the Fourier transform was the extension of this to aperiodic signals which
allowed us to move between the time domain and frequency domain
representations. 

In this lecture we will work out a few examples and then present a version of
the Fourier transforms that don't involve complex numbers[^1].

\toc

## Examples

### Sine wave
Let us start simple: What is the Fourier series of a simple sine wave: $f(t) =
\sin(\omega t)$?

Recall from last lecture that we seek to represent $f(t)$ in terms
of complex exponentials. 
$$ \label{iffs}
f(t) = \sum \limits _{k=-\infty} ^{\infty} F[k] e^{i k \omega_0 t} \quad
\textrm{and} \quad t \in [0, T]
$$
Here we can write via Euler's identity that:
\nonumber{$$
\sin(\omega t) = \dfrac{1}{2i} e^{i\omega t} - \dfrac{1}{2i} e^{-i\omega t}
$$}
so that $F[-1] = \dfrac{1}{2i}$ and $F[1] = \dfrac{-1}{2i}$ and all other
Fourier coefficients are zero.

### Square wave
Let the square wave of period $T$ and amplitude $1$ be given by:
$$ \label{sqwave}
f(t) = \begin{cases}
\enskip 1 \qquad & 0 < t \le T/2 \\ 
-1 \qquad & T/2 < t \le T 
\end{cases}
$$
Then computing its Fourier coefficients we have that:
\nonumber{$$
F[k]= \dfrac{1}{T} \int_{0}^{\frac{T}{2}} \exp \left( - ik\omega_0 t\right) dt - \dfrac{1}{T} \int_{\frac{T}{2}}^{T} \exp \left(- ik \omega_0 t\right) dt
$$}
The indefinite integral evaluates to:
\nonumber{$$
\int  \exp \left( - ik\omega_0 t\right) dt = \frac{i e^{-i k t \omega _0}}{k \omega _0}
$$}
which on plugging in the limits evaluates to:
\nonumber{$$
F[k] = \dfrac{e^{-i k T \omega _0} \left(e^{\frac{1}{2} i k T \omega _0} - 1\right)^2}{i T k \omega _0}
$$}
Next put $\omega_0 = \dfrac{2 \pi}{T}$ to get:
\nonumber{$$
F[k] = -\dfrac{i e^{-2 i \pi  k} \left(-1+e^{i \pi  k}\right)^2}{2 \pi  k}
$$}
Recall that $k \in \mathbb{Z}$ and note that for every _even_ $k$ the quantity in the parenthesis is zero and so $F[k]=0$ (for $k=0$
need to take a limit). For $k$ that is _odd_, a small calculation shows that the quantity
reduces to $\dfrac{2}{i\pi k}$. Thus, 
\nonumber{$$
F[k] = \dfrac{2}{i\pi k},\qquad \textrm{where} \quad  k= \pm 1, 3, 5, \dots 
$$}

### Triangle wave
Let us compute the Fourier coefficients of the waveform shown below:

[\input{plot}{triangle1}](/assets/lectures/lec07/code/triangle1.jl)

By observation the period of the triangular waveform above is $T=8$ and it
traverses its peak-to-peak amplitude of 4 units in 4 seconds. Thus over one
period $[0,8]$ we can represent it as:
$$
f(t) = \begin{cases} t - 2, \quad & 0< t \le 4 \\ 6 - t, \quad &  4 < t \le 8 
\end{cases}
$$
Then $\omega_0 = \pi / 4$ and we seek to find the coefficients in the
representation 
\nonumber{$$
f(t) = \sum \limits _{k=-\infty} ^{\infty} F[k] e^{i\frac{\pi}{4}kt}
$$}
The $F[k]$ are found by:
\nonumber{
\begin{align}
F[k] &= \dfrac{1}{8} \int \limits _0 ^4 \left(t - 2\right) e^{-ik(\pi/4)t}dt +
\dfrac{1}{8}
\int \limits _4 ^8 \left(6 - t\right) e^{-ik(\pi/4)t} dt \\
& = \dfrac{1}{8} \int \limits _0 ^4 t  e^{-ik(\pi/4)t}dt   - \dfrac{1}{8} \int \limits _0 ^4 2 e^{-ik(\pi/4)t}dt + 
\dfrac{1}{8} \int \limits _4 ^8 6 e^{-ik(\pi/4)t}dt - \dfrac{1}{8} \int
\limits _4 ^8 t e^{-ik(\pi/4)t}dt 
\end{align}}
The second and third integrals not requiring integration by parts evaluate to
\nonumber{$$
I_2 := \dfrac{i \left(1 - e^{-i \pi  k}\right)}{\pi  k} \qquad \textrm{and} \qquad  I_3 := \dfrac{3 i e^{-2 i \pi  k} \left(e^{i \pi  k} -1 \right)}{\pi  k}
$$}
respectively. Note that these are zero for $k$ even. Some coefficients being
zero for odd/even $k$ is due to certain _symmetries_ of the function as we will
discuss next. The ones that require integration by parts are a bit more
involved and quite hairy to do by hand. One can calculate them, using some CAS
or MATLAB if necessary (below shown in Mathematica):

~~~
<iframe scrolling="no" src="/assets/lectures/lec07/wolfram_triangle.htm" width="100%"
height="800px" style="border:0px;">Solution in Wolfram Mathematica</iframe>
~~~

In the above, we see that the calculations are only off by a normalizing
factor, which will be often the case since different software/systems use
differing conventions. 

## Trigonometric form of Fourier expansions
It is common to write down the Fourier series in terms of the sine and cosine
functions separately rather than via the complex exponential[^2]. This is easy
to do via Euler's identity. Suppose we can write the _Fourier Series_ expansion 
for a periodic $f(t)$ as:
$$ \label{trigfseries}
f(t) = c_0 + \sum \limits_{k=1}^{\infty} a_k \cos(k\omega_0t) + b_k
\sin (k\omega_0t)  
$$
then it is not unreasonable to expect that the above formulation must be related to
\eqref{iffs} via Euler's formula. Indeed we can write:
\nonumber{\begin{align}
f(t) &= \sum \limits _{k= -\infty}^\infty F[k] e^{ik\omega_0t} \\
 &= \sum \limits _{k=-\infty} ^{-1} F[k] e^{ik\omega_0t} + F[0] + \sum \limits _{k=1}^\infty F[k] e^{ik\omega_0t}\\
&= F[0] + \sum \limits _{k=1}^{\infty} F[-k]e^{-ik\omega_0t} + F[k]e^{ik\omega_0t}
\end{align}}

To keep things notation friendly lets represent the $F[-k]$ coefficients as
$F_{-k}$. Then we have, 
\nonumber{\begin{align}
f(t) &= F_0 + \sum \limits _{k=1} ^{\infty} F_{-k}\cdot e^{-ik\omega_0 t} + F_k \cdot e^{ik\omega_0t} \\
&= F_0 + \sum \limits _{k=1} ^{\infty}  F_{-k}\cdot \left( \cos (k \omega_0 t) -i \sin (k \omega_0 t ) \right) + F_k \cdot \left( \cos(k \omega_0 t) + i \sin (k \omega_0 t) \right) \end{align}}
Collect terms one more time to get:
$$ \label{ifft_exp}
 F_0 + \sum \limits _{k=1} ^{\infty} \left(F_{-k}+F_{k}\right)\cdot \cos(k \omega_0 t) + i \left(F_{k} - F_{-k}\right) \cdot \sin (k \omega_0 t)
$$
Now comparing \eqref{ifft_exp} with \eqref{trigfseries} we get that:
\nonumber{$$
c_0 = F_0,  \qquad a_k = F_{k} + F_{-k}, \qquad \textrm{and} \qquad b_k =
i\cdot \left( F_k - F_{-k} \right)
$$}

The above relationship while illuminating, still requires us to compute the
complex coefficients first to get to the trigonometric ones. However, we can
get the $c_0, a_k$ and $b_k$ directly as:


$$ \label{fs_trig_analysis}
c_0 = \dfrac{2}{T} \int \limits_0 ^T f(t) dt, \quad a_k = \dfrac{2}{T} \int \limits
_0 ^T f(t) \cos(k\omega_0 t) dt, \quad b_k = \dfrac{2}{T} \int \limits_0 ^T
f(t) \sin(k\omega_0t) dt
$$

\note{We skipped the derivation of \eqref{fs_trig_analysis} here. Make sure you read Appendix
A2 of CSSB to understand how we get the above!}

## Common categories of functions

As noted above often some coefficients in the Fourier expansion will turn out
to be zero. This can be predicted by looking for specific types of symmetries in a
function. Thus we have the following definitions:

#### Even and odd functions
 - A function $f(t)$ is an odd function if $f(-t) = -f(t)$.
 - A function $f(t)$ is an even function if $f(-t) = f(t)$.

Based on the above we have that:

1. The sum of two even functions is even, and of two odd ones odd.
1. The product of two even or two odd functions is even.
1. The product of an even and an odd function is odd.

The top plots in the figure below show two classic polynomial examples of odd and even
functions. 

\input{plot}{symmetries}

It is easy to see that symmetries simplify some integrals. For example based on
the figures above and considering "area cancellations" or "area additions":
\nonumber{$$
\int \limits _{-4} ^4 x^2 dx = 2 \int \limits _0 ^4 x^2 dx \qquad \textrm{and}
\qquad \int \limits _{-4} ^{4} x^3 dx = \int \limits _{-4} ^0 x^3 dx + \int
\limits _{0} ^{4} x^3 dx = 0 
$$}
#### Half and quarter wave symmetries

The definitions for half and quarter wave symmetries apply only to periodic
signals. 

 - A function $f(t)$ periodic with period $T$ is said to exhibit half-wave
   symmetry if $f(t) = - f(t - T/2)$
 - A periodic function $f(t)$ is said to exhibit quarter wave symmetry if in
   addition to having half-wave symmetry it also has odd/even symmetry. 

Thus in the above figure, the bottom plot is an example of a function that
exhibits half-wave symmetry. 

\collaps{**Question:** Does the _Mario_ function in the above figure exhibit
quarter-wave symmetry?}{**Answer:** Skipped}

## Effect of symmetries on Fourier coefficients

Since the sine function is odd and the cosine function is even the integrands
in \eqref{fs_trig_analysis} themselves can be odd or even depending on the type of
function $f(t)$. These can be understood in terms of area cancellations or
additions as alluded to above. Table 3.1 from CSSB summarizes the effect of
symmetries on the Fourier sine and cosine coefficients. 

{{textableinput lectures/lec07/symm_coeffs.csv}}

~~~
<!--
|Function Type| Symmetry         | Coefficient Value|
|-------------|------------------|------------------|
| Even        | $f(-t) = f(t)$   | $b_m=0$          |
| Odd         | $f(-t) = -f(t)$  | $a_m=0=c_0$      |
| Half-wave   | $f(t-T/2)=-f(t)$ | $a_m=b_m=0$ for $m$ even |
-->
~~~

## More examples

### Square wave (odd)

Consider again the square wave from \eqref{sqwave}. We can verify by plotting
the function that it is indeed an odd one. 

\input{plot}{square}

Thus the coefficients $a_n = c_0 = 0$ and we are left with a _Fourier Sine
series_ for this function consisting of only the $b_n$ coefficients. These can
be computed as:
\nonumber{
\begin{align}
b_k &= \dfrac{2}{T} \int \limits _{-\frac{T}{2}} ^{\frac{T}{2}} \sin(k\omega_0t)dt = \dfrac{4}{T} \int \limits _0 ^{T/2} \sin (k\omega_0t) dt \\
&= \dfrac{4}{T} \left[ -\dfrac{\cos \left(k t \omega _0\right)}{k \omega _0} \right]_{0}^{T/2} = \dfrac{4}{T} \cdot \dfrac{2 \sin ^2\left(k T \omega _0 /4\right)}{k \omega _0}\\
& = \dfrac{8 \sin ^2\left(\frac{1}{4} k T \omega _0\right)}{k T \omega _0} = \dfrac{4 \sin ^2\left(\frac{\pi  k}{2}\right)}{\pi  k}
\end{align}
}
It is easy to verify that the final coefficients are zero for $k$ even which
dovetails with the fact that the above function also has half-wave symmetry. 

\collaps{**Question:** Can you derive the $b_k$ coefficients solely based on
the complex Fourier series coefficients we calculated in the first set of
examples?}{**Answer:** Left as an exercise. One just needs to do $i\left(F_{k}
- F_{-k}\right)$ for $k$ that is odd.}

### Triangle wave (even)

[\input{plot}{triangle2}](/assets/lectures/lec07/code/triangle2.jl)


The triangle wave depicted above is even. Thus all the $b_k = 0$. For $c_0$,
the average value is also zero by inspection. Thus we are left to compute
$a_k$. We have
\nonumber{$$
{a_k} = {1 \over T} \int \limits_T f \left( t \right)\cos \left( {k{\omega _0}t} \right)dt  = 
{1 \over T} \int\limits _{ - {T \over 2}}^{ + {T \over 2}} f \left( t \right) \cos \left( k \omega _0 t \right)dt = 
{2 \over T} \int\limits_0^{ + {T \over 2}} f \left( t \right) \cos \left( \omega _0 t \right)dt
$$}
Now note that in the interval $[0, T/2]$ we can write the function as: $f(t) =
\left(A - \dfrac{4At}{T} \right)$.
Then,
\nonumber{$$
a_k = {2 \over T} \int\limits _0 ^{ + {T \over 2}} \left( A - {4A \over T}t \right) \cos \left( k{\omega _0}t \right)dt  = 
{2A \over T}\left( \int\limits _0 ^{ + {T \over 2}} \cos \left( k{\omega _0}t \right)dt  - {4 \over T} \int \limits_0 ^{ + {T \over 2}} t \cos \left( k{\omega _0}t \right)dt  \right)
$$}
The first integrand on the right is straightforward but the second requires
integration by parts. Doing so gives, 

\nonumber{\begin{align}
a_k &= \dfrac{4A}{T} \left( \dfrac{T \sin (k \pi)}{2k\pi} + \dfrac{4}{T} \dfrac{T^2\left( 2 \sin^2\left(\dfrac{\pi k}{2}\right) - k \pi \sin (k \pi) \right)}{4k^2\pi^2} \right)\\
&= \dfrac{4A\sin^2 \left(\dfrac{k\pi}{2}\right)}{k^2 \pi^2} 
\end{align}}

It is easy to verify that the above coefficients vanish for even $k$. The first
few terms are shown below (compare with earlier derivation using CAS):

\nonumber{$$
\left\{\dfrac{4 A}{\pi ^2},0,\dfrac{4 A}{9 \pi ^2},0,\dfrac{4 A}{25 \pi ^2},0,\dfrac{4 A}{49 \pi ^2},0,\dfrac{4 A}{81 \pi ^2},0\right\}
$$}
\collaps{**Question:** (a) Why are the signs different? (b) Why are the even
coefficients gone?}{**Answer:** Because the functions are negatives of each
other for $A=2$ and because of the half-wave symmetry.}

While this lecture was mostly analytical, in the next one we will get started
with learning more about different software implementations of and related to
Fourier Analysis. 

~~~
<p align="center"><a href="/lectures/">[back]</a></p>
~~~

[^1]: I hesitate to call it the _real_ transform because neither is more real than the other, except maybe that the complex formulation has several advantages (compactness of notation being the least) over the real one - which we will discuss later. 
[^2]: Fourier himself passed away in 1830 and it seems it wasn't until 1831 that the great mathematician Gauss delineated the formalism we use today for complex numbers. Therefore it seems likely that for a very long time (and maybe even today) people preferred this second "real" approach that doesn't involve $i$ or $e^i$. 
