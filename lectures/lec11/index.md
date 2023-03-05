+++
title = "Lecture 11"
tags = ["code"]
hascode = true
hastex = true
+++

# Lecture 11

> **Reading material:** Chapter 6 of CSSB

In the last lecture we discussed convolutions, impulse response of LTI systems,
the relationship between the impulse response of LTI systems and convolutions,
the relationship between multiplication in the frequency domain and
convolutions in the time domain. We further saw code examples on how to compute
the system response to a given input if we know the impulse response. In this
lecture, we continue our study of systems concepts; specifically we will study
the concepts of frequency response, systems spectrum, transfer functions and
system diagrams. 

\toc

## System diagrams 

Recall from from the very [first
lecture](/lectures/lec01/#system_diagrams_signals) that we have a graphical
method of representing systems and signals called system diagrams as shown
below.

\input{plot}{iosystem}

Now that we know about the impulse response of a system, in the following we
will represent systems with the letters $\mathcal{H}, \mathcal{G}, \mathcal{P}$
as appropriate and generally use $x(t)$  and $y(t)$ to represent the input and
output to systems. 

We call the process by which a system $\mathcal{H}$
transforms the  input $x(t)$ to the output $y(t)$ the _action_ of $\mathcal{H}$
on $x(t)$. More colloquially, $y(t)$ is produced by $\mathcal{H}$  _acting_ on
$x(t)$. We represent this mathematically as $y(t) =
\mathcal{H}\left(x(t))\right)$. Often for ease of notation, we drop the
argument $t$ when it is understood the signals $x$ and $y$ are functions of
time: $y = \mathcal{H}(x)$. 

\figstyled{/assets/lectures/lec11/code/output/basicsys.png}{width:250px;}

### System interconnections

Often it is quite useful to break down a complex system into its constituent
elements or conversely, to build up a complicated system behavior by the
composition of simpler constituent elements. There are two basic ways of
composing systems as outlined below. 

Borrowing terminology from circuit analysis, the first method of composing two
systems is called a _series connection_. In such a composition, the output of
one system element is fed in as input to the second system element. 

\figstyled{/assets/lectures/lec11/code/output/series.png}{width:380px;}

The output $y(t)$ in such a case can be represented as $y = \mathcal{H}_2
\left( \mathcal{H}_1 ( x ) \right)$. 

The second way of composing two system elements is to connect them in
_parallel_ as shown below. 

\figstyled{/assets/lectures/lec11/code/output/parallel.png}{width:500px;}

The summation element (shown by a circle above) is a new feature in our systems
diagram. In the parallel connection above, the input is fed separately to two
subsystems and their outputs are summed together to produce the final response:
$y = \mathcal{H}_1\left(x\right) + \mathcal{H}_2\left(x\right)$. 

### LTI interconnections 
For LTI systems we know the output $y(t)$ to an in input $x(t)$ can be written
in terms of the impulse response $h(t)$ as $y(t) = h(t) \star x(t)$. Thus the
above interconnections simplify. Indeed for the series connection we have the
output $y_s$ is:
\begin{align*}
y_{s} &= h_2 \star  z = h_2 \star \left( h_1 \star x \right) \\
& = \left(h_2 \star h_1 \right) \star x 
\end{align*}

\figstyled{/assets/lectures/lec11/code/output/res_series.png}{width:250px;}

Similarly for the parallel connection we have that the output is:
\begin{align*}
y_p &= z_1 + z_2 = (h_1 \star x) + (h_2 \star x) \\
 &= \left(h_1 + h_2 \right) \star x
\end{align*}

\figstyled{/assets/lectures/lec11/code/output/res_parallel.png}{width:250px;}

Therefore the LTI series interconnection of two systems with impulse responses $h_1$
and $h_2$ results in a system with overall impulse function: $h_1 \star h_2$
and the parallel interconnection results in a system with overall impulse
function $h_1 + h_2$. 

### Feedback
Recall that we [discussed](/lectures/lec03/#systems_approach) the use of
feedback to desirably modify the process or characteristics of a system when we
talked about different approaches to modeling biological systems. We are now in
a position to analyze with tools at our disposal the feedback interconnection
diagram. Consider the feedback interconnection diagram given below:

\figstyled{/assets/lectures/lec11/code/output/feedback.png}{width:360px;}

Then we have the following relations:

 - $z_2 = y \star \mathcal{H}$
 - $z_1 = x - z_2$
 - $y = z_1 \star \mathcal{G}$

Starting with the last equation we have that:
\begin{align*}
y &= z_1 \star \mathcal{G} = \left(x - z_2 \right) \star \mathcal{G} \\
&= \left(x - y \star \mathcal{H} \right) \star \mathcal{G} \\
&= x\star \mathcal{G} - y \star \mathcal{H} \star \mathcal{G}
\end{align*}
which we can rearrange to get
\nonumber{$$
y\star \left( \delta +  \mathcal{G} \star \mathcal{H} \right) = x \star \mathcal{G}
$$}
The above equation can and is often presented in a much cleaner format by
switching representations to the frequency domain. Indeed then, the above
diagram becomes:

\figstyled{/assets/lectures/lec11/code/output/feedbackfreq.png}{width:460px;}

and we get:

$$ \label{feedbacktf}
\dfrac{Y}{X} = \dfrac{G}{1+GH}
$$

which is very important equation that we can use to simplify algebraically many
interconnections between system elements as we will see in the examples below.
The ratio in \eqref{feedbacktf}, the ratio of the output to the input in the
frequency domain, is an important enough quantity that it gets its own name:
**transfer function.** We will spend entire lectures talking about transfer
functions, and so now is as good a time as any to understand its definition -
_the frequency domain[^1] domain ratio of the output to the input_. 

## Frequency response 
The same quantity as in \eqref{feedbacktf}, that is the ratio of the output to
the input is a very general abstraction that applies to a large class of
systems. However, when specialized to simple LTI systems, it has a nom de
guerre; specifically, it is called the _frequency response_. To see why this is
an apt name, it is instructive to examine the response of an LTI system with
impulse response $h(t)$ to a (complex) sinusoidal input $x(t) = e^{j\omega t}$.
We have that:
\begin{align*}
y(t) &= h(t) \star e^{j\omega t}= \int \limits_{-\infty}^{\infty} h(\tau) e^{j\omega (t-\tau)} d\tau \\
&= \int \limits_{-\infty}^{\infty} h(\tau) e^{j \omega t} e^{-j\omega \tau} d \tau = 
e^{j \omega t} \int \limits_{-\infty}^{\infty} h(\tau)e^{-j\omega \tau} d \tau 
\end{align*}
giving 
$$ \label{sysresp}
y(t)=H\left(j \omega\right) e^{j\omega t} 
$$

Thus we have that the output from the system is still a complex exponential (or
sinusoid) with the same frequency but now modulated by a $H(j \omega)$ factor
in front of it. 

\emphasis{**Key point:** Therefore we have that any stable LTI system with zero
initial conditions responds (in steady state) to sinusoidal inputs with
sinusoidal output of the same frequency; albeit with changes in amplitude and
phase.}

How the input sinusoids amplitude and phase are changed is a function of the
_complex frequency_ $j \omega$, as defined by the _frequency response_ $H(j
\omega)$. 

\note{The qualifier - "in steady state" - is required because as shown in
a class activity, there can be transient portions in the system response which
fade away with time. Similarly, we will deal with nonzero initial conditions
when we introduce the Laplace transform and stability of a system is a topic
for later lectures.}

### Example 1 
Given an LTI system with impulse response $h(t)$; use the above observations to
calculate the system response to a sinusoid input $x(t) = A \cos(\omega t)$. 

**Solution:** Using Euler's identity we have that
\nonumber{$$
x(t) = \dfrac{A}{2}  \left( e^{j \omega t } + e^{-j \omega t } \right)
$$}
Based on \eqref{sysresp} above we get:
\nonumber{$$
y(t) = \frac{A}{2} \Big( H(j\omega)e^{j\omega t} + H(-j\omega)e^{-j\omega t} \Big)
$$}
Since $H(j\omega)$ is a complex function, it has a polar representation. Let
$M(\omega)$ denote its magnitude and $\varphi(\omega)$ denote its phase. Then, 
\nonumber{$$
H(j\omega) = M(\omega)e^{j\varphi(\omega)} \qquad \textrm{and} \qquad H(-j\omega) = M(\omega)e^{-j\varphi(\omega)}
$$}
Using this to rewrite $y(t)$ we have, 
\begin{align*} 
y(t) &= \frac{A}{2} M(\omega)\Big( e^{j(\omega t + \varphi(\omega))} + e^{-j(\omega t + \varphi(\omega))}\Big) \\
    &= A M(\omega) \cos\big(\omega t + \varphi(\omega) \big) \\
 &= A\underbrace{M(\omega)}_{\text{amplitude}\atop\text{magnification}} \cos\big(\omega t + \underbrace{\varphi(\omega)}_{\text{phase}\atop\text{shift}}\big).
\end{align*}
That is, in went a cosine with amplitude $A$ and no phase, but out came a
cosine with amplitude scaled as $| H(j \omega)| =: M(\omega)$ and phase
$ \varphi(\omega) := \arg \left( H(j \omega) \right)$. 

### Example 2 
Consider the system below with a sinusoidal input $x(t) = 0.6 \sin (0.3 t +
20)$. What is the system response?

\figstyled{/assets/lectures/lec11/code/output/example2.png}{width:480px;}

**Solution:** To use the result of Example 1 above let us convert the input to
a cosine: $x(t) = 0.6 \cos(0.3t - 70)$. Application of \eqref{feedbacktf} with
the observation made for LTI series connection results in the overall transfer
function given as 
\nonumber{$$
H\left(j \omega \right) = \dfrac{20 j}{-20 \omega + j}
$$}
We can compute the magnitude and phase of $H(j\omega)$ as a function of
$\omega$. Indeed, 
\nonumber{$$
M \left(\omega \right) = \dfrac{20}{\sqrt{400 \omega^2+1}} \qquad
\textrm{and} \qquad  \varphi(\omega) = \pi/2 - \arg (j - 20\omega)
$$}
Plugging in $\omega = 0.3$ we get $M(3/10) = 20 / \sqrt{37}$. Similarly,
$\varphi(3/10) = \arctan(1/6) - \pi/2 \approx -80.5 ^\circ$. Thus we get that the output response
should be:
\begin{align*}
y(t) &= M(3/10) \times 0.6 \cos \left( 0.3t - 70 - \varphi (3/10) \right) \\
 & = \dfrac{12}{\sqrt{37}} \cos \left( 0.3t - 150.5 \right) 
\end{align*}

\note{Stop now and go read Example 6.3 and 6.4 of CSSB. Can you
relate the two examples with the above? 

**Hint**: They are exactly the same except for an error in CSSB where it does
the nonsense of converting things to the phasor form. 
}

### Example 3
Example 6.5 in CSSB calculates the system response to an input $x(t)= 10
\cos(20t +30)$ for a system with transfer function: 
\nonumber{$$
H \left( j \omega \right) = \dfrac{1}{1+\dfrac{2j\omega}{10} -
\dfrac{2\omega^2}{100}}
$$}
Use the methods on this page to compute the system response and compare
your answers. 

**Solution:** Left as an exercise. 

## System Spectrum 

While the spectrum of a signal tells us the how energy in a signal is
distributed amongst the constituent frequencies in the signal, the spectrum of
a system tells us how the system _modifies_ an input signal - both by
amplifying or attenuating its amplitude as well by modifying the phase
characteristics. Thus, the magnitude spectrum of a system looks very much like
the magnitude/phase spectrum plots we have seen so far. The blow figure shows
the spectrum of hypothetical system. 

\input{plot}{systemspec}

We can see that the system characterized by the above spectrum is a low pass
filter with a cutoff frequency of 100 Hz. How do we know 100 Hz is the cutoff
frequency? Recall that the cutoff frequency is where you get half power. In the
above figure, the magnitude plot has no units (not in decibel scale). Since
power directly related to amplitude squared, we would get half power when the
magnitude reads $\dfrac{1}{\sqrt{2}} \approx 0.707$ which happens at 100 Hz. 

Since reading and constructing system spectrum diagrams is a necessary skill
when dealing with systems and signals, we spent the rest of this lecture on how
to manually construct such diagrams given the system transfer function. The
starting point is to transform any given function in to the so called _Bode_
form. 

### Bode form 

\definition{Bode form}{The bode form of a transfer function is a factored form
where the constant term in each factor is unity:
\nonumber{$$
G(j \omega) = K \cdot \dfrac{(1+jw\tau_1)
\left(\left(\dfrac{j\omega}{\omega_{n_1}}\right)^2 + 2\zeta \dfrac{j\omega}{\omega_{n_1}} + 1\right) \dots }{jw (1+jw\tau_2) 
\left(\left(\dfrac{j\omega}{\omega_{n_2}}\right)^2 + 2\zeta \dfrac{j\omega}{\omega_{n_2}} + 1\right) \dots}
$$}
(see Eq. 6.50 in CSSB)
}
It is necessary to examine each of these factors above and learn how they
contribute to the shape of the system spectrum. We now begin this activity in
earnest. The three types of factors are:




[^1]: Later we will see that it is better defined in the _Laplace_ domain; but that is a topic for later lectures.
