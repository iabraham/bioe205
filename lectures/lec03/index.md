+++
title = "Lecture 3"
tags = ["code"]
hascode = true
+++

# Lecture 03

> **Reading material:** Section 1.4, 2.1 and 2.3 of the textbook. 

#### Recap 

Recall that last lecture we talked about:

- sources of noise and variability in biological systems, some common examples
  of them and how to model and address them. 
- Gaussian models for noise and the essence of the central limit theorem. 
- types of systems including deterministic, stochastic, causal, non-causal,
  stationary, non-stationary, linear and nonlinear systems. 
- properties of some deterministic signals 

--- 

Today we will continue discussion to wrap up Chapter 1 material. Then we will
move towards a discussion about processing of signals, including operations on
signals, some common signals and their characterizations and constructions
(both in theory & code). 

\toc

## Modeling biological systems
The textbook discusses two different approaches to modeling biological systems
as engineers. The first it calls the **analog** model and the second it calls the
**systems** model. We briefly discuss the key themes in each here. 

### Analog(ue) approach 
In this approach, we try to model the properties of the system using mechanical
or electrical devices. For example, an early model of musculo-skeletal
systems utilized nonlinear springs, contractile elements, and other such
mechanical elements in series and parallel connections to mimic the properties
and behavior shown in actual animal systems. 

See Figure 1.23 in the textbook.

\emphasis{The key point here is: the differential equations
which govern the behavior of the mechanical components used in the model, take
the same (if simplified) form as those biological characteristic we seek to
represent in the real system.}

The model forces and velocities correspond to biological forces and velocities when
mechanical elements are utilized to simulate biological mechanics. We could
also do the same with electrical components if the same principle (that the
defining dynamical equations are similar/identical) holds. As an
example, we know from Ohm's law that a resistor provides a linear relationship
between voltage & current. Then, using voltage as a stand-in for force (or pressure)
and current for velocity, one can model features of the cardiovascular system
with the resistance of the resistor mimicking the resistance provided by blood
vessels to blood flow. Of course, blood vessels are not exactly the same as a
plain old resistance since they are elastic and can expand. Thus one finds that
the addition of a capacitance or the adoption of a nonlinear resistor is
required to further capture such intricacies. 

The "analog" in the title of this section thus is also rightly interpreted as
"analogous" approach and not just in the sense of analog vs. digital modeling.  

### Systems approach 
In this approach, one does **not** seek to create models that mimic the exact
behavior of a biological system with mechanical, electrical or pneumatic
elements. Instead a more abstract approach is taken. Arguably, this is the more
modern of the two approaches. In this conceptual
framework, one wants to model the _input-output_ behavior of different systems
or system components. Rather than concentrate on the specifics of _how_ each
operation is implemented, the focus now is on accurately describing _what_ the
system does. 

\emphasis{Since the key is now to describe accurately (often via
differential equations) how the input or stimulus to the system is _tranformed_
into the output or response of the system, these models are frequently called
**transfer function** models which are traditionally represented via _system
diagrams_.}

An important innovation in this approach is the separation of the process into a
_plant_ & a _controller_ as well as the introduction of _feedback_ to the
system[^1]. Consider a simple system that must regulate or keep some variable
$x$ of interest within an acceptable reference $r$. Here $x$ could be the
velocity of your car in cruise control mode or the temperature in your home
when the thermostat is set to `auto` or your basic body temperature. In this
setting, we can consider the ECU in the car or the thermostat in your home, or
the autonomous nervous system to be the _controller_ and the engine in the car
or A/C unit in the home or our body itself to be the _plant_.
_It is the job of the controller to regulate the output of the plant._


In whichever system, one can consider the reference $r$ to be the input to the
system controller: $60$ mph, $70 ^\circ$F or $37 ^\circ$C. In the systems
model, this reference $r$ is compared to the current value or output coming
from the _plant_ and an error signal $e:=r-y$ generated using which the
controller sends signals to the plant to modify its output. Since this output
is then again measured, _fed back_ into the system via the error signal we say
that we have a _feedback_ system (infact a negative feedback system, but that
is for later lectures). The figure below illustrates this abstraction. 

\fig{sysdiag.png}

\note{Here we transition to material of Chapter 2 of CSSB.}

## Elementary operations on signals

First we discuss about some elementary operations done on signals. All
operations we discuss are visualized in the figure below.

[\figstyled{/assets/lectures/lec03/code/output/elementary_ops.png}{width:105%;padding-left:0%;}](/assets/lectures/lec03/code/elementary_ops.jl)

### Y-axis shifts (vertical shift)
The first operation we are going to discuss is about $Y$-axis shifts or
vertical shifts. 

Given a function $f(t)$, its vertical shift is a new function $g(t) = f(t) +
k$. In other words, all the output values change by $k$ units. If $k$ is
positive, the graph will shift up. If $k$ is negative, the graph will shift
down.

In the figure $y(t) \pm 0.5$ is the vertically shifted versions of the
original signal $y(t)$

### X-axis shifts (horizontal/time shift)

The next operation is $X$-axis shifting or time shifting of a signal. This
means that the signal may be either delayed or advanced in the time axis.

Given a function $f(x)$, a new function $g(x) = f(x-h)$, where $h$ is a
constant, is a horizontal shift of function $f(x)$. If $h$ is positive, the
graph will shift right. If $h$ is negative, the graph will shift left.

The figure above shows the time shifted version of the signal $y(t)$, which is
$y(t \pm h )$, with $h=1$.

\begin{align*}
y (t + 1) &\mapsto \textrm{negative shift (delayed signal)} \\
y (t - 1) &\mapsto \textrm{positive shift (advanced signal)}
\end{align*}

### Multiplication

The next basic signal operation is Multiplication. In this case, amplitudes or
output values of two signals are multiplied in order to obtain a new signal.
Mathematically, this can be given as:

\begin{align*} 
	y(t) = f(t) \times g(t) 
\end{align*}

In the figure, $y(t)$ is the product of two signals $f(t) = \sin(3t)$ and $g(t)
= e^{-t/2}$.

### Y-axis scaling (amplitude scaling)

The process of rescaling the amplitude of a signal, i.e., the amplitude of the
signal is either amplified or attenuated, is known as amplitude scaling. The
amplitude scaling of a continuous time signal x(t) is defined as,
\begin{align*}
	y(t) = A \cdot x(t) &\quad \textrm{where A is a constant} \\
\end{align*}

In the above figure, as you can see, if $A > 1$ we have _amplification_ of
signal and if $A < 1$ we have _attenuation_ of signal.

### X-axis scaling (time scaling)

Time axis scaling of a signal $f(t)$ is also called reparametrization[^2] of
$f(t)$. Mathematically we write $g(t) = f(\lambda t)$ where $\lambda$ is a
scalar constant. This in essense amounts to speeding up or slowing down of the
signal. If $ \lambda >1$ then the signal is sped up and if $\lambda<1$ then the
signal is slowed down. 

### Addition
The addition of two signals is nothing but addition of their corresponding
amplitudes. That is, if $f(t)$ and $g(t)$ are the two continuous time
signals, then the addition of these two signals is expressed as $f(t) + g(t)$. 

The resultant signal can be represented as: 
\begin{align*}
            y(t) = f(t) + g(t)
\end{align*}
In the figure above, $f(t) = \sin(t)$ and $g(t) = \sin(t^2)$. \\
The resultant signal is given by $y(t) =  f(t) + g(t)$

## Constructing signals

Next, we will be discussing how to construct signals. The first signal we will
discuss is the sinusoid. In later lectures, we will discuss some other common
signals. 

### Sinusoids

Sinusoidal signals are periodic functions which are based on the sine or cosine
function. Note that the term sinusoid is a generic term for various curves or
traces constructed using sines and cosines (which are of course related to each
other)

The general form of a sinusoidal signal is 
\begin{align*}
            x(t) = A \sin(\omega t + \phi)
\end{align*}

Here $A$, $\omega$, and $\phi$ are parameters that characterize the sinusoidal
signal. When $A=\omega=1$ and $\phi=0$ we get what we call a _simple_ sinusoid. 

* **Amplitude** $A$, of the signal is determines how large the signal is in
  the dependent axis (height of the signal measured _peak-to-valley_).
  Specifically, the sinusoid oscillates between $+A$ and $-A$ absent any
  $y$-axis shifts. Thus, $A$ acts like a $y$-axis scaling factor on a simple
  sinusoid. 
* **Frequency** of the signal measures how fast the signal is in the time or
  independent axis. When it is measured in radians/second (recall that the sine
  function takes an _angle_ as input) it is represented by $\omega$
  (known as angular frequency). The frequency $f$, in Hertz (Hz) provides the
  number of complete cycles that the sinusoid repeats in one second. The
  duration of each cycle is called the **period** ($T$) of the sinusoid.
  
  Mathematically, the frequency (in Hertz) of a sinusoid is simply the inverse
  of its period and also related to the angular frequency as follows: 
	\begin{equation*}
      	f = \frac{1}{T} \qquad f = \frac{\omega}{2\pi} \qquad \omega = 2  \pi f
	\end{equation*} 

* **Phase** ($\phi$) of sinusoid causes a sinusoid to be time or $x$-axis shifted. 

\collaps{**Question:** What is the period of a simple sinusoid? In what units?}{Since
frequency is the inverse of the period and for a simple sinusoid $\omega=1$, we
have that 
\begin{equation*}
\omega = 2\pi f \implies f = \dfrac{1}{2\pi} \implies T = 2 \pi
\end{equation*}
The unit is in seconds. That is, the simple sinusoid completes one full cycle
in $2 \pi$ seconds. 
}

**Constructing and plotting sinusoids**

Mathematically, constructing a sinusoid of a given amplitude and frequency is
easy. We just plug in the right numbers. 

\collaps{**Question:** Construct a sinusoidal signal with amplitude of 3 units
that completes 12 cycles every minute starting at 1.5V. The maximum value of
the signal cannot exceed 4 volts.}{
Let's parse this. \\ 

Clearly $A=3$ to have an
amplitude of 3 units. Thus our starting guess for the form of the signal is
$y(t) = 3\sin(\omega t)$. Now 12 cycles every minute implies $f = 12/60$ Hz.
Thus our signal becomes $y = 3 \sin ( 2\pi/5 t)$, i.e. $\omega = 2\pi/5$.
Since we need the signal to start at 1.5V, we can try a y-axis shift: $y(t) =
3\sin(\omega t) + 1.5 $. However this signal violates the given constraint
(why?). \\

Thus we should try a different strategy. Let's introduce a phase
shift:  $y(t) = 3 \sin(\omega t + \phi)$. Then solve for $y(0) = 1.5 =
3\sin(\phi)$ to get that the required signal is:
\begin{equation*}
y(t) = 3\sin(\omega t + \phi) \qquad \omega = \dfrac{2\pi}{5} \qquad \phi =
\dfrac{\pi}{6}
\end{equation*}
}

While mathematically constructing a sinusoid is straightforward as we have seen
above, visualizing one using a computer involves a bit more work. First, recall
that digital signals are not continuous time signals; but rather, they are
discretized using some sampling scheme. Therefore, the first task we must
complete is to define what the _sampling frequency_ will be for our signal.
Suppose we want to plot 30 seconds of the above example signal (how many cycles
would you expect to see?) and we make 50 measurements every second. Thus we
have, 

```matlab
fsample = 50;
t0 = 0; 
tf = 30;
fsignal = 2*pi/5;
```
where `fsample` is the sampling frequency and `fsignal` is the frequency of the
desired signal and `t0, tf` denote the interval over which we wish to visualize
the signal. Next we generate the time vector `t=t0:1/fsample:tf` and the plot
it. The whole code is shown below

\input{matlab}{sinusoid}
Note that we add some styling elements using `xlabel` and `ylabel` commands. 

[\input{plot}{sinusoid}](/assets/lectures/lec03/code/sinusoid.m)

## Review of some basics regarding $\mathbb{C}$
We will have the opportunity to work with Eulers formula and the complex
numbers as well as complex exponentials in this course. Therefore at this stage
it is instructive to review the basic laws of logarithms and exponents. This
should be very familiar material. 

For a real number $a \neq 0$ we _define_, $a^0:=1$. Then, for two real numbers
$a, b$ and two integers $m, n$ the following laws hold. 

1. $a^m a^n = a^{m+n}$
2. $(a^m)^n = a^{mn}$
3. $(ab)^{mn} = a^mb^n$
4. $a^{-k} = \dfrac{1}{a^k}; \qquad a \neq 0$
5. $a^{1/n} = \sqrt[n]{a}$

The logarithm is defined as an operation using the following:

\definition{Logarithm}{We say $y = \log _a x$ if and only if $x = a^y$ for positive
nonzero $a$}

One should read the operation $\log _a x$ as "logarithm to the base $a$ of
$x$". When the _base_, $a=e$, we replace the notation $\log$ with $\ln$
(natural logarithm)[^3]. 

From the above definition it is true that: 
$$x = a^{\log _a x} \qquad \textrm{and} \qquad y = \log _a (a^y)$$

Then the following properties hold as a result:

1. $\log _a (xy) = \log x + \log y$ 
2. $\log _a (x^y) = y \log _a x $
3. $\log _a (x/y) = \log_a x - \log_a y$ 

\collaps{**Exercise:** Show that $\log _a ( xy ) = \log_a x + \log_a y$.}{
We have from the first observation in (1) that we can write for some valid
base $a$:
\begin{equation*}
x = a^{\log _a x} \qquad \textrm{and} \qquad y = a^{\log _a y }
\end{equation*}
Then, 
\begin{align*}
x y = a^{\log _a x} a^{\log _a y} &= a^{\log _a x + \log _a y}  \\ 
xy = a^{\log _a (xy)} &= a^{\log _a x + \log_a y} 
\end{align*}
The first line uses the properties of exponents. In the second line, the first
equality arises by doing $z = a^{\log _a z}$ with $z=xy$. 

Since the second 
equality in the last line above has the same base then the two exponents must
be equal. Thus follows the identity.}

The other identities are left as an exercise. 

We assume the class is familiar with complex numbers and operations on them.
Recall that while real numbers $\mathbb{R}$ are one dimensional, the complexes
$\mathbb{C}$ are two dimensional, having both a _real_ coordinate and an
_imaginary coordinate_. All complex numbers therefore can be written in a
_Cartesian_ form $z = (a, b)$ (often written $z = a+ib$) and as well as a
_polar_ form $z = (r, \theta)$. 

\emphasis{**Appendix F** in CSSB has a primer on complex arithmetic which you should
peruse if you haven't seen them in a long time.}

\collaps{**Question:** What is the relationship between $(x, y)$ and $(r, \theta)$?}{**Answer:** Left as an exercise. Might help to draw out a diagram and recall some basic trigonometry.}

### Euler's formula
Euler's formula indicates an essential and deeply profound relationship between
the Polar and Cartesian forms via Euler's constant $e$ causing 19th century Harvard
mathematician Benjamin Peirce to remark (after proving a particular version of
it):

> _Gentlemen, that is surely true, it is absolutely paradoxical; we cannot
> understand it, and we don't know what it means. But we have proved it, and
> therefore we know it is the truth._

Let us therefore prove it, starting with the only the
supposition that a complex number as an exponent to $e$ should return a
complex number[^4] and examining what calculus can tell us.

Let $e^{ix}$, being a complex number, have _some_ polar
representation:
$$ \label{eulerdef}
e^{ix} = r \left( \cos \theta + i \sin \theta \right) 
$$
Differentiate both sides (with respect to $x$ and not assuming anything about
$r$ or $\theta$) and follow the product rule of calculus:
$$ \label{polardef}
i e^{ix} = \left( \cos \theta + i \sin \theta \right) \dfrac{dr}{dx} + r \left(
- \sin \theta + i \cos \theta \right) \dfrac{d\theta}{dx}
$$
Put definition \eqref{eulerdef} back into the left hand side of \eqref{polardef}. Then we have, 
\begin{align*}
ir \left(\cos \theta + i \sin \theta \right) &= \left( \cos \theta + i \sin \theta \right) \dfrac{dr}{dx} + r \left(
- \sin \theta + i \cos \theta \right) \dfrac{d\theta}{dx}
\end{align*}
Expanding out and collecting the real and imaginary parts we get:

\begin{align*}
r \cos \theta &= \sin \theta \dfrac{dr}{dx} + r \cos \theta \dfrac{d\theta}{dx}
\\
-r \sin \theta &= \cos \theta \dfrac{dr}{dx} - r \sin \theta
\dfrac{d\theta}{dx}
\end{align*}

For equality to hold we must have:
\begin{equation*}
\dfrac{dr}{dx} = 0 \qquad \textrm{and} \qquad \dfrac{d\theta}{dx} = 1
\end{equation*}
Therefore $r$ is a constant and $\theta = x + C$ where $C$ is another constant
and we have:
\nonumber{
$$ 
e^{ix} = r \left( \cos (x+C) + i \sin (x+C) \right) 
$$
}
Considering $e^{i0}=1$ for $x=0$ in the above, we get 
\nonumber{$$
1 = r \left( \cos C + i \sin C \right)
$$
}
Once again collecting the real and imaginary parts we get that the above system
of two equations has two solutions. Since the magnitude $r$ is restricted to be
non-negative we choose the solution with $r=1$ and $C=2n\pi$ for $n \in \mathbb{Z}$.\\
Thus for $n=0$ we get Euler's formula:
$$
e^{ix} = \cos x + i \sin x
$$
**Note:** It is indeed $2 \pi$ periodic. 

Now let us use it a couple of times. 

\collaps{**Question:** What is (a) $e^i$ and (b) $3^i$?}{
**Answer:**\\
(a) We can simply use $e^{ix} = \cos x + i \sin x$ with $x=1$.
Thus, 
\nonumber{$$ e^i = \cos 1 + i \sin 1 $$}
(b) Recall that $3 = e^{\ln 3}$ and therefore $3^i = \left( e^{\ln 3}
\right)^i$. Therefore, 
\nonumber{$$ 3^i = e^{i\ln(3)} = \cos (\ln 3) + i \sin (\ln 3 ) $$}
}

~~~
<p align="center"><a href="/lectures/">[back]</a></p>
~~~

[^1]: The term _plant_ is a relic from the old times when these concepts were first introduced in the setting of large industrial production plants (often for chemicals). 
[^2]: Technically this encompasses arbitrary changes to the timeline $t' = \phi(t)$ but we don't discuss that here. 
[^3]: It is _natural_ in many senses that are beyond the scope of the course; but it suffices to note that $e$ is a [very important](https://en.wikipedia.org/wiki/E_(mathematical_constant)) mathematical constant on par with $\pi$.
[^4]: A much more natural assumption than Appendix A in CSSB which admittedly seems to start out of nowhere. 

