+++
title = "Lecture 12"
tags = ["code"]
hascode = true
hastex = true
+++

# Lecture 12

> **Reading material:** Chapter 6 of CSSB

Last lecture, we spent a considerable amount of time  discussing the frequency
response of a system, the meaning of the system spectrum, analytically
computing the system response to sinusoid inputs, simple block diagram algebra,
etc. We ended the lecture discussing a systematic way to draw magnitude & phase
diagrams given a system transfer function using the Bode plot technique. We
continue this thread in this lecture. 

\toc 

## Block diagram algebra 

We discussed in class some basic rules of block diagram manipulation and
algebra. These notes are available [here](/inclass/mar09/) and class is
expected to be familiar with the techniques discussed therein and should have
been useful for completing homework assignments as well. 

\warn{While not part of the lecture notes per the techniques in the link above
are important topics and fair game on exams/quizzes and ignoring them entails
considerable risk.}

## Bode plot examples
Let us consider a few examples of plotting Bode diagrams (i.e. the
magnitude/phase plots) for a few system transfer functions. To review what
the plots of [Bode primitives](/lectures/lec11/#bode_form) look like check out
this [interactive demo](http://146.190.199.141/bodeprimitives.html).

### Example 1
Let us start with the example we considered in the last lecture. Namely, 

$$ \label{ex1}
G(s) = \frac{s+3}{s(s^2 + 2s + 4)}
$$

Recall that in Bode form it had was written as:

\nonumber{$$
\frac{3}{4}(j\omega)^{-1} \cdot \left(\frac{j\omega}{3}+1\right) \cdot
\left[\left(\frac{j\omega}{2}\right)^2 + \frac{j\omega}{2} + 1\right]^{-1}
$$}

#### Type 1 factor 
The Type 1 factor here is $3/4 \left(j \omega \right) ^{-1}$. It has a negative unity
exponent and $K=3/4$. We already showed in the previous lecture what the Type 1
factor for this transfer function will contribute to the Bode plot. These
figures are reproduced here for consistency. 

\input{plot}{type1}

#### Type 2 factor 
For the Type 2 factor in this transfer function, that is, 
\nonumber{$$
\left( \dfrac{j \omega}{3} + 1 \right)
$$}
we see that it has a positive unity as exponent and $\tau = 1/3$. Thus the
magnitude and phase plot for this term are as follows:

\input{plot}{type2_ex1}

The magnitude plot is horizontal until near the breakpoint and then proceeds
upwards with slope 1 while the phase plot climbs from $0$ to $90^\circ$ by hitting
$45^\circ$ at the breakpoint. 

#### Type 3 factor

The type 3 factor in this case is 
\nonumber{$$
\left[ \left( \dfrac{j\omega}{2} \right)^2 + \dfrac{j \omega}{2} + 1
\right]^{-1}
$$}
which has negative unity as exponent, $\omega_n = 2$ and $\zeta =
\dfrac{1}{2}$. Therefore for the magnitude plot, the graph is horizontal until
it reaches near the natural frequency whereupon it descends downwards with
slope 2. Similarly the phase plot goes from 0 to $-180 ^\circ$ passing through $-90
^\circ$ at the natural frequency. 

\input{plot}{type3_ex1}

#### Combining plots

The final plot is a pointwise addition of all the graphs above. For example we
know the phase plot will start at $-90 = -90 + 0 + 0$ where the terms on the
right of the equality are contributions from the Type 1, Type 2 and Type 3
factors. Similarly, we know it will end at $-180 = -90 + 90 -180$. If the
breakpoint frequency $1/\tau$ of the Type 2 term and the natural frequency
$\omega_n$ of the Type 3 term where the same, we could have expected the phase
plot to cross $-135^\circ = -90^\circ +45^\circ -90^\circ$ at this joint
frequency. However,  $\omega_n < 1/\tau$ and so the phase plot crosses
$-135^\circ$ much earlier. 

\input{plot}{ex1_final}

In the same way we can reason about the magnitude plot. We know it will start
out with a slope of negative unity. But once the frequency passes beyond the
breakpoint/natural frequency, the Type 2 term will add a slope of positive
unity; at the same time the Type 3 term will contribute $-2$ to the slope. So
the slope of the graph beyond the breakpoint will be $-1 + 1 - 2 = -2$.
Therefore the overall plot is two segments of slope -1 and -2 joined around the
the breakpoint/natural frequency with a small kink. 

### Example 2

Consider the following transfer function:

$$ \label{ex2}
G(s) = \dfrac{2000\left(s + 0.5\right)}{s \left(s+10\right)\left(s+50\right)}
$$

\collaps{**Exercise:** Convert \eqref{ex2} to Bode form:}{**Answer:** Left as
an exercise}

This function has one factor of Type 1 and _**three**_ factors of Type 2. 

#### Type 1 term 
This term is $ \dfrac{2}{j \omega}$. Here $K=2$ and $n=-1$. This factor
contributes a line of slope $-1$ passing through $(\omega, M) = (1, 2)$.  Since
$n=-1$ its phase plot starts at $-90^\circ$. 

#### Type 2 terms
These terms are:
\nonumber{$$
a=\left( \dfrac{j \omega}{0.5} + 1\right) \qquad b=\left( \dfrac{j\omega}{10} + 1\right)^{-1} \qquad c=\left(\dfrac{j\omega}{50} +1 \right)^{-1}
$$}
with $\tau_a = 2, \tau_b = 1/10$ and $\tau_b = 1/50$. We can consider their
contributions to the magnitude plots as follows:

 * The magnitude plot will start with a slope of -1. 
 * When $\omega = 0.5$, the first Type 2 factor contributes a slope increase of 1. 
 * When $\omega = 10$, the second Type 2 factor contributes a slope decrease of 1. 
 * When $\omega = 50$, the third Type 2 factor again contributes a slope decrease of 1.

\input{plot}{ex2_mag}

We can similarly reason about the phase plots:

 * From the Type 1 factor we know the graph will start at $-90^\circ$. 
 * At $\omega =0.5$, the first Type 2 term adds a phase contribution of $90^\circ$.
 * At $\omega=10$, the second Type 2 factor adds a phase of $-90^\circ$.
 * At $\omega=50$, the third Type 2 factor adds yet another contribution of $-90^\circ$.
 * Together, this means the phase plot ends at $-180^\circ$. 

\input{plot}{ex2_pha}

### Example 3
Consider the following transfer function which is already in Bode form:
$$ \label{ex3}
  G(s) = \dfrac{0.01 \left(s^2 + 0.01s + 1\right)}{s^2 \left(\dfrac{s^2}{64} + 0.02 \dfrac{s}{8} + 1 \right)}.
$$
This transfer function has a single Type 1 factor and **_two_** Type 3 factors.

For its magnitude plot we have that, 

 * The Type 1 factor with $K=0.01$ and $n=-2$ contributes a line of slope -2
   passing through the point $(\omega, M) = (1, 0.01)$. 
 * The Type 3 factor with positive exponent has natural frequency $\omega_n=1$
   and damping coefficient $\zeta=0.005$. It contributes a slope **increase**
   of 2 beyond $\omega =\omega_n$ along with a resonance **dip**.
 * The Type 3 factor with negative exponent has natural frequency $\omega_n=8$ and
   $\zeta=0.01$. It contributes a slope **decrease** of 2 beyond $\omega = \omega_n$
   along with a resonance **peak**.  

\input{plot}{ex3_mag}

For its phase plot we have that, 

 * The Type 1 factor has exponent negative 2, therefore the phase plot starts
   at $-2 \times 90 ^\circ = 180^\circ$. 
 * At $\omega_n = 1$ the first Type 3 factor contributes a phase increase of
   $180^\circ$. 
 * At $\omega_n = 8$ the second Type 3 factor contributes a phase decrease of
   $180 ^\circ$. 
 * Since $\zeta$ is very small for, both Type 3 factors have _sharp_
   transitions (see [demo](http://146.190.199.141/bodeprimitives.html)). 

\input{plot}{ex3_pha}

## Bode plots using software

\note{Some of the following commands/code require the use of the Control System
Toolbox in MATLAB; so you might have to use the Engineering Workstations made
available by the Grainger College of Engineering.}

One can solve for the above examples in MATLAB using the following code. 

\emphasis{If you would rather not use MATLAB, then [**this
link**](/lectures/lec12/examples) points to a notebook that generated
the above figures. There is an experimental feature saying it should be
runnable in the cloud (click "Run in Binder"); but it is not guaranteed to
work.}

#### Example 1 - MATLAB

In this example we make use of the Control System Toolbox in MATLAB while in
the next example we will make plots without relying on the toolbox. Recall that
the transfer function \eqref{ex1} is:
\nonumber{$$
G(s) = \frac{s+3}{s(s^2 + 2s + 4)}
$$}

The below code generates the final Bode plot. 
```matlab 
num=[1, 3];         % Numerator coefficients
den=[1, 2, 4, 0];   % Denominator coefficients
sys = tf(num, den); % Transfer function model
bodeplot(sys);      % Generate bodeplot
title("Final Bode Plot - Example 1")
grid on;
```

\input{plot}{ex1_matlab}

The below code also shows the term by term contributions. 

```matlab
typ1 = tf(3,[4, 0]);		%TF from just Type 1 term
typ2 = tf([1/3, 1], 1);		%TF from just Type 2 term
typ3 = tf(1, [1/4, 1/2, 1]); 	%TF from just Type 3 term

bodeplot(typ1);
hold on
bodeplot(typ2);
bodeplot(typ3);
legend('Type 1', 'Type 2', 'Type 3')
```

\collaps{**Exercise:** Solve this problem in MATLAB without using the Control
Systems Toolbox.}{**Answer:** Left as an exercise.}

#### Example 2 - MATLAB 
In this example (i.e. transfer function of \eqref{ex2}), 
\nonumber{$$
G(s) = \dfrac{2000\left(s + 0.5\right)}{s \left(s+10\right)\left(s+50\right)}
$$}
we generate the magnitude/phase plots without using any
toolboxes. 

```matlab 
den = @(w) (w.*j).*(w.*j+10).*(w.*j+50);
num = @(w) 2000.*(w.*j + 0.5);
tf = @(w) num(w)./den(w);


w = logspace(-2,3, 1000);
subplot(1, 2, 1)
loglog(w, abs(tf(w)));
xlabel("Frequency [rad/s]")
ylabel("Magnitude")
title("Magnitude plot")
grid on

subplot(1, 2, 2)
semilogx(w, angle(tf(w))*180/pi);
grid on
xlabel("Frequency [rad/s]")
ylabel("Phase angle")
title("Phase plot")
sgtitle("Magnitude/phase plot for Example 2 above")
```

\input{plot}{ex3_matlab}

#### Example 3 - MATLAB

Left as an exercise. Plot in MATLAB the transfer function of \eqref{ex3}. 

\caution{Practice, practice, practice. Do not skip the exercises.}
~~~
<p align="center"><a href="/lectures/">[back]</a></p>
~~~
