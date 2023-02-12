+++
title = "Lecture 9"
tags = ["code"]
hascode = true
hastex = true
+++

# Lecture 09

> **Reading material:** Chapter 4 of CSSB

Last time we discussed implementing different reconstructions of signals based
on their Fourier coefficients in a programming language. We also discussed the
use of the FFTW library to perform the Fast Fourier Transform in MATLAB or some
other programming language. Further, in class we did an example where we took
the Fourier transform of a sound wave. The notes/notebook we used in class is
[accessible here.](http://146.190.199.141/intro_fft.html)

\note{If you haven't understood how to take the Fourier transform of a signal
using MATLAB or some other software, then stop here. Read the previous
lectures, check out the above notebook and catch up before proceeding.}

\toc

## Sampling
In this lecture we want to study the effect of sampling on the DFT spectrum.
The vast majority of real life signals are continuous time signals. However,
our primary methods of analyzing them are all based on computers. Thus there
arises a central question: When is a sampled signal a good[^1] representation of
its continuous time counterpart? 

We start, as you must have guessed, but looking at sinusoids. 


### The sampling rate & constraints

\input{plot}{sampled}

Consider the left plot above which we can suppose we got by sampling some signal.
Intuitively, we might guess that we must have sampled some sort of periodic
waveform like a sinusoid. And indeed as shown on the right we see that a 1 Hz.
cosine neatly fits through those points. However, is this the only signal that
could have generated those sampled points?

Indeed, consider the plots below. 

\input{plot}{aliases}


Therefore it is possible to get the same sampled sequence of points from
different signals; and this phenomenon is called aliasing. 

\definition{Aliases}{Given a sampling frequency $f_s$, two frequencies $f_1$
and $f_2$ are called aliases of each other if for some integer $k$, 
\nonumber{$$
f_2 = f_1 + k\cdot f_s 
$$}
}

One of the primary concerns when dealing with sampled signals is to avoid
aliasing because then we will not be able to tell apart signals of different
frequencies. Fortunately for us, this problem has been solved by folks at Bell
Labs in its heyday but before we get to that, here is another question:

> What is the effect of the sampling rate on the DFT spectrum? 

The demonstration below allows you to explore this question:

~~~
<iframe src="http://146.190.199.141/fft_sampling.html" width="760px"
allowfullscreen="false" scrolling="no" height="1380px" style="border:0px;">
</iframe>
~~~

In the above we saw that increasing the number of samples that is passed to
`fft` allows us to get sharper peaks with greater resolution. Thus zero padding
is a frequent technique used by people to "increase" the resolution of a DFT
magnitude spectrum. Of course zero padding doesn't add any new information, so
it really amounts to an aesthetic trick, albeit with some consequences[^2] but
more on that later. The plot below shows the DFT of the same signal without
zero padding, with some zero padding, and with even more zero padding. 

\input{plot}{zeropadding}

### Sampling theorem
So now that we have seen what effect the length of the input sample, or rather
the sampling rate has on the DFT spectrum, let us return to the original
problem involving sampling. The central result here is called Shannon's Sampling Theorem after 
the great polymath [Claude
Shannon](https://en.wikipedia.org/wiki/Claude_Shannon) though it often (and
rightly) has various other [names associated](https://en.wikipedia.org/wiki/Nyquist%E2%80%93Shannon_sampling_theorem#Historical_background)
with it. 

\theorem{Shannon}{If a signal $y(t)$ contains no frequencies higher than $f$ hertz, it is completely determined by sampling its values at a series of points spaced 
$1/(2f)$ seconds apart.}

We have already seen this result and remarked upon it in class. Indeed in the
above demonstration, one can check that for a $4$ Hz wave, setting the sampling
frequency to $8$ Hz (via the slider) results in a flat line. The same effect
can also seen in the DFT magnitude spectrum. 


~~~
<iframe
src="http://146.190.199.141/fft_aliasing.html"
width="760px" allowfullscreen="false" scrolling="no" height="1280px"
style="border:0px;"> </iframe>
~~~



## Power spectral density 

\highlight{🚧 ... check back later ... 🚧}

[^1]: As usual, good is in air quotes because it really depends on the application. 
[^2]: See [spectral leakage](https://mathworld.wolfram.com/Leakage.html)

