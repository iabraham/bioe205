+++
title = "Lecture 13"
tags = ["code"]
hascode = true
hastex = true
+++

# Lecture 13

> **Reading material:** Chapter 7 of CSSB

Last lecture we introduced Laplace transform as a generalization of the Fourier
Transform that is applicable to signals whose Fourier transform does not exist. 
In this lecture we spent a great deal of time learning about the Laplace
transform of basic signals and how different mathematical operations can be
translated to the _Laplace domain_. We will build a repertoire of common
Laplace and time-domain pairs and then see how we can utilize that to solve
both ordinary differential equations as well as initial value problems. 


\toc 


## Basic Laplace transforms
In the last lecture we introduced the Laplace transform as a necessary
generalization of the Fourier transform integral that is able to accommodate
wider class of signals. We showed this by computing the Laplace transform of a
hyperbolic sin for which the Fourier transform did not exist. However, there
is far simpler and more ubiquitous signal whose Fourier transform doesn't exist
but the Laplace transform does. This is the so called "on" signal or _step_
signal (recall [Lecture 04](/lectures/lec04/#step_signal)) defined as
\nonumber{
$$
u (t) = \begin{cases} &0, \quad t < t_0 \\ &c,\quad t \geq t_0 \end{cases} 
$$
}
A simple exercise shows that the Laplace transform of the step input is given
as $\mathcal{L}\left(u(t)\right)$. 

\collaps{**Exercise** Derive the Laplace transform of the step input
function}{**Solution:** Left as an exercise.}

However if the only advantage of defining the Laplace transform were to simply
make some tough integrals converge its utility would have been offset by the
loss in interpretability - i.e. we can interpret the Fourier transform as a
change of basis for our time domain signals that exposes the underlying
frequency contributions in its constitution. Alas no such easy to intuit
explanation exists for the Laplace transform. Nevertheless, we have gained far
more utility with this generalization as we will shortly see. 


### Mathematical operations & Laplace transforms 
Consider the derivative of a function $f(t)$ given as 
\nonumber{
$$
f'(t) = \dfrac{d}{dt} f(t) 
$$
}
and consider its Laplace transform (and apply integration by parts):
\nonumber{
$$
\mathcal{L}\left(f'(t)\right) = \int \limits _{0} ^{\infty} \dfrac{dx(t)}{dt}
e^{-st} dt = \left. x(t) e^{-st}\right|_{0}^{\infty} + s \int \limits _{0}
^{\infty} x(t) e^{-st} dt 
$$
}
The quantity on the right being integrated is nothing but the Laplace transform of $x(t)$ (which we will denote by $X(s)$). This gives (applying the limits)
\nonumber{
$$
\mathcal{L}\dfrac{dx(t)}{dt} = s X(s) - x(0^{-})
$$}
where $x(0^{-})$ is used to denote the value of the signal at time $t=0$. The negative
sign $t=0^{-}$ is used to indicate that the negative time history of the signal
up till $t=0$ has been lumped together into the value at $t=0$. When the
initial condition for the signal is zero (as is often the case) this extra term
disappears. 

\note{**Note:** Indeed, it is precisely through this extra term that we will be able to
incorporate nonzero initial conditions in our set up and solve initial value
problems or IVPs.}

Thus we get that as must be true of any generalization, the generalization must
respect or uphold truths or results established by whatever mathematical object
or concept was being generalized. The precise result being preserved here is
the fact that the Laplace domain representation of the impulse function is
still $1$. Indeed, recall that the derivative of the step function is the
impulse function and thus we see that we can multiply $\mathcal{L}(s)$ with $s$
to get 1. 

\collaps{**Exercise:** What happens to higher order derivatives?}{**Answer:**
Full answer is skipped. Indeed repeated differentiation is simply repeated
multiplication by $s$, but we leave it as an exercise to figure out what
happens to initial conditions in this case.}

\note{**Note:** Don't skip the exercise if you want to understand how to solve
IVPs of higher orders, say for example a second order system.}

Now if differentiation in the time domain is represented in the Laplace domain as
multiplication by $s$ then one can guess that the natural counterpart of
differentiation being integration, the multiplication must be replaced by ...
you guessed it: division. (Isn't mathematics beautiful & orderly?). In fact
that particular bit of math works out to look like:


\nonumber{$$
\mathcal{L} \left[ \int \limits _{0} ^{T} x \left( t \right) dt \right] = \dfrac{1}{s}
X(s) + \dfrac{1}{s} \int \limits_{-\infty} ^{0} x(t) dt
$$}


Therefore in the presence of all zero initial conditions we can equate
integration in time domain with division by $s$ in the Laplace domain - often
called multiplication by $\frac{1}{s}$ for obvious reasons. 

\collaps{**Exercise:** What is the Laplace transform of the ramp
function?}{**Solution:** Recall that the integration of the step function gives
rise to the ramp function. Thus, the Laplace transform of the ramp function is
the Laplace transform of the step function multiplied by $s$, i.e.
$\frac{1}{s^2}$}


### Solving convolutions


## Solving ODE's in the presence of nonzero initial conditions


