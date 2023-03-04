+++
title = "Lecture 8"
tags = ["code"]
hascode = true
hastex = true
+++

# Lecture 08

> **Reading material:** Examples in Chapter 3 of CSSB.

Now that in previous lectures we have [discussed](/lectures/lec06) the Fourier
transforms, and seen [some examples](/lectures/lec07) of it analytically, in
this lecture let us look at implementations of the same on software. 

\toc

## Reconstructing a wave from its Fourier expansion

### Square wave 
Let us consider the square wave from the beginning of [Lecture
07](/lectures/lec07). We derived that its Fourier coefficients $F[k]$ were:

\nonumber{$$
F[k] = \dfrac{2}{i\pi k},\qquad \textrm{where} \quad  k= \pm 1, 3, 5, \dots 
$$}

which were associated with the complex exponentials $e^{ik\omega_0t}$. Let us
use this information to try and reconstruct the signal. As we have discussed
previously, the square wave requires an infinite summation for its analytical
expansion in terms of the Fourier coefficients. Since on a computer we do not
have infinite memory, our approach will be to _symmetrically_ truncate the
summation in the reconstruction. 

Let us start by writing three functions.
 - The first, `spool`,  is to collate together positive odd numbers up to $N$ and negative
   odd numbers up to $-N$. 
 - The second function will be to return the Fourier coefficient in the above
   equation. 
 - The last function will be to evaluate the $k$-th term in the expansion over
   the time variable $t$. Here they are:

```julia
spool(N) = flatten([-1:-2:-N, 1:2:N])
F(k) = 2/(k*π*im)
kth_term(t) = k -> F(k) * exp.(2π*k*im*t)
```
Next we define `N` to use in the `spool` function above, the time variable on
the interval $[0, 5]$. After that we evaluate the sum and extract only its real
part (since the signal was real to begin with). The final command just plots
the reconstruction. 

```julia
N, t = 20, 0:0.01:5
y = real(sum(kth_term(t).(spool(N))))
title = "Reconstructed sq. wave for N=$N"
plot(t, y, label=false, title=title)
```

That **really** is it, six lines. Here is the whole code and the output:

\input{julia}{square_recon}
\input{plot}{square_recon}

\emphasis{**Note:** Okay, okay, alright. I cheated a bit and used a different
programming language than what we used in the course. We will look at the
MATLAB code now. But really it was just implementing a sum. Therefore, I
**highly recommend** that you pull out MATLAB and try to do a reconstruction
before you proceed to look at the MATLAB code below.}

#### MATLAB Version 

\collaps{Click to reveal the MATLAB version.}{The MATLAB version is slightly
longer because of its loop based idioms but nevertheless slightly more readable
in a sense.
\input{matlab}{sq_recon}
}

How about we try another one? 

### Triangle wave 

Recall from the previous lecture note that we derived that the Fourier
coefficients for the triangle wave as:
\nonumber{$$
a_k = \dfrac{4A\sin^2 \left(\dfrac{k\pi}{2}\right)}{k^2 \pi^2}  \qquad
\textrm{for } k \textrm{ odd}
$$}

Following a similar strategy as last time we get that the following code and
output recreate the triangle wave with as little as 10 terms in the sum. 

\input{julia}{triangle_recon}
\input{plot}{triangle_recon}

\emphasis{**Exercise:** Implement the above in MATLAB}

### Example from CSSB

In Example 3.4 of CSSB we are shown a periodic waveform in Figure 3.13.They
derive the complex Fourier coefficients in that case as:
\nonumber{$$
C_m = \dfrac{e^{2.4} - 1}{2.4 - 2\pi i m }, \qquad m=0, \pm 1, \pm 2, \dots
$$}

Let us try to reconstruct the waveform using these:

\input{julia}{cssb_recon}
\input{plot}{cssb_recon}

\emphasis{**Exercise:** If you have not yet mastered plotting periodic
functions, try to plot the function in Figure 3.13 in CSSB. Then try to
reconstruct it using the Fourier coefficients.}

## Computing the Fourier Transform
Now that we know how to reconstruct signals - i.e. to implement the _synthesis_
equations in software, we should think of what tools we have at our disposal to
implement the _analysis_ equations. 

Multiple examples in CSSB implement the analysis equations in great detail
using MATLAB. Therefore, this lecture note will not focus on those; rather we
will focus on examples of using MATLAB's `fft` function. 

\note{**Note:** You are still expected to be familiar with implementing the
analysis equations in MATLAB. In particular, check Examples 3.6 through 3.10 in
CSSB.}

#### MATLAB's fft

Most open source languages ship with a version of the [FFTW
library](https://www.fftw.org/) while MATLAB ships with its on internally
optimized version based on the FFTW library. In this class our inputs to `fft`
are vectors. But this need not be the case. If you check the
[documentation](https://www.mathworks.com/help/matlab/ref/fft.html) you will
find that you can pass multi-dimensional arrays to `fft` as well. The
documentation tells us that in such a case, MATLAB prefers to treat N-D arrays
as vectors along some dimension and then apply DFT to those _vectors_. This is
different from vanilla and most other `fftw` which will perform DFT along all
dimensions by default. The MATLAB equivalent for this is the `fftn` function.
Apart from this difference, most of the behavior of the two functions is same. 

If `x` is a real or complex vector then MATLAB's `fft(x)` returns a complex
vector of the same size as `x`. You might think this odd for real valued
vectors `x` because $\mathbb{C}$ inherently has twice the dimension compared to
$\mathbb{R}$, and so somehow the information _doubled_. This isn't true because
if `x` is real then the DFT will have components that are complex conjugates of
each other and so some information is redundant (in fact, exactly _half_ the
information). 

In each element of the complex valued output vector we get, there are three items
of interest to us: (a) the _magnitude_ and (b) the _phase_ and (c) the
_frequency_ at which the previous two are applicable. Remember the example
of the frequency domain representation that we have seen in multiple lectures
past (shown below). 

\input{plot}{eeg}


The output from the `fft` algorithm though, just returns a complex vector
in Cartesian form. From this vector is straightforward enough to extract the
_phase_ (using the `angle` function) and the magnitude (using the `abs`)
function. However, we don't have any information on the frequency vector,
needed to generate a plot like the above. 

Both in MATLAB's documentation as well as the examples in CSSB, this frequency
vector is crafted by hand using information about the length of the vector
input `x` and the sampling frequency `fs`. Pay particular attention to
how this is done in both places because this is a most frequent source of
confusion when introduced to FFT algorithms in software. 

Suppose we have a sinusoid composed of three different fundamental frequencies.
\nonumber{$$
x(t) = \sin(8 \pi t) + \sin(2\sqrt{2}\pi t) + \sin(2\sqrt{59}\pi t)
$$}
as shown below. 

```julia
t=0:0.02:2π
y = sin.(8*π*t) + sin.(2π*sqrt(2)*t) + sin.(2π*sqrt(59)*t)
plot(t, y, label=false, title="Wave with three diff freqs.")
```
\input{plot}{mix_plot}

Then plotting the magnitude of the complex DFT vector returned
by the `fft` algorithm we get:

```julia
X = fft(y)
plot(abs.(X), label=false, title="DFT same length as y=$(length(y))")
```
\input{plot}{plain_dft}

which as you can see indeed multiple peaks but doesn't really line up with the
expectation. 
 - For one there are six peaks instead of three for a signal with just three
   frequencies. 
 - The $x$ axis doesn't list any frequencies instead it simply shows the index
   along the vector. 

Regarding the first, we already touch upon the reason. The complex vector
returned by `fft` function for real valued inputs has redundant information
because half of it is the complex conjugate of the other half. Therefore when
we use the `abs` function on it, we get twice the number of peaks as there are
frequencies. 

Regarding the second, let us try to construct the
frequency vector and plot it. Now recall that the Nyquist frequency statement:
A sampling frequency of at least $2F$ is needed to capture frequency content up
to frequency $F$. Therefore, one expects that for an input of sampling
frequency $fs$, the DFT will return complex sinusoids with frequencies in
properly recovered up to `fs/2`, therefore for complex vector returned by `fft`
the convention is to make plots with the frequency axis as: `[-fs/2, fs/2]`[^1]. 

Hence, we construct the frequency vector `freqs` accordingly and normalize by
the length of the signal `lx` while multiplying with the sampling frequency
(1/0.02). 

```julia
lx = length(X)
freqs = (-lx÷2:lx÷2)/lx*50
p1 = plot(freqs, abs.(X), label=false)
vline!(p1, [sqrt(2), 4, sqrt(59)], label="Fundamental freqs.")
```
\input{plot}{freq_dft}

Hmm, is something wrong? 

Apart from the obviously
missing frequency vector, it also seems the returned DFT matrix orders the
components in a certain fashion to speed things up. This infact will be the 
the case in most FFT implementations. 

\emphasis{**Exercise:** Implement the above in MATLAB and check what is the
situation there.}

The way it is sorted is

\nonumber{
$$ \{c_0, c_1, c_2, \dots, c_k, \bar{c}_k, \bar{c}_{k-1}, \dots , \bar{c}_2,
\bar{c_1}\} $$}

where $c_0$ is the DC component and $\bar{c}_k$ is the complex conjugate of
$c_k$. 

Fortunately, most implementations also provide a helper function called
[`fftshift`](https://www.mathworks.com/help/matlab/ref/fftshift.html) which
centers the zero frequency for us. Most software packages _should_ provide some
implementation of it. 

```julia
lx = length(X)
freqs = (-lx÷2:lx÷2)/lx*(1/0.02)
p1 = plot(freqs, abs.(fftshift(X)), label=false)
vline!(p1, [sqrt(2), 4, sqrt(59)], label="Fundamental freqs.")
```

\input{plot}{fftshift_dft}

\note{**Note:** This part of lecture has intentionally provided very little MATLAB
code. The rational behind this is to let you get your hands dirty. There is
less learning involved if copying code is possible when compared to having to
implement it by hand. Recreating the above example in MATLAB shouldn't be hard
and I **highly** encourage you to do it.}

In the next lecture note, we will discuss the effects of sampling and aliasing on
the DFT spectrum. In class, we will also get a chance to examine the DFT of a real world
signal[^3]. In the mean time, here is a pretty cool video from YouTube-r and
math popularizer [Grant Sanderson](https://www.3blue1brown.com/about)[^2]. 

## Nice videos on the Fourier Transform 

The video below explains the decomposition we have been studying from the
perspective of sound waves (pure tones, which are essentially sinusoids).
What is a new perspective here though is the small "winding machine" that is
introduced to explain the peaks in the frequency-magnitude graphs we have shown
so far.

~~~
<iframe width="760" height="500" src="https://www.youtube-nocookie.com/embed/spUNpyF58BY" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
~~~

The same channel has a few more videos on the Fourier transform if you are
interested. They are a tad bit more involved than the above; particularly
because sometimes they are part of a playlist on differential equations or some
other advanced topic. 

The next video is a very informative video on what is arguably the most
important algorithm of our time, the _fast Fourier transform_. 

~~~
<iframe width="760" height="500" src="https://www.youtube-nocookie.com/embed/nmgFG7PUHfo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
~~~
~~~
<p align="center"><a href="/lectures/">[back]</a></p>
~~~

[^1]: A negative frequency $-f$ basically corresponds to the complex conjugate of whatever complex exponential was associated to frequency $f$.
[^2]: Apart from a deep respect for his skill and effort, this course, website or author has no affiliation or relations with Mr. Sanderson or his YouTube channel. 
[^3]: Notebook used available [here](http://146.190.199.141/intro_fft.html).
