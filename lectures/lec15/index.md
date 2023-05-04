+++
title = "Lecture 15"
tags = ["code"]
hascode = true
hastex = true
+++

# Lecture 15

> **Reading material:** Chapter 12 of CSSB

We finally come to the third and last major thematic portion of the course with
this lecture. In this lecture we discuss the basic strategies and theory of
analysis of simple mechanical and electrical networks. We start with a review
of the basic laws and principles of mechanics. 

\toc

## Mechanical systems

The most studied mechanical system is probably the mass-spring-damper system. 
Why do we worry so much about mass-spring systems, you may be wondering. We
research these systems because they can be used to represent or simplify a wide
range of engineering issues. Several of these consist of:

* **Solid mechanics systems:** small local sections of a material can be
  modeled as a springs with damping
* **Fluid flow:** mass-spring models serve as one starting point for deriving
  the equations of motion for fluids
* **Circuits:** the next section of the notes will show how many circuit
  elements share similiarities with mass-spring-damper systems 
* **Real** mass-spring-damper mechanisms: obviously 
* **Mechanical computers:** see for example
  [Voskhod Globus](https://en.wikipedia.org/wiki/Voskhod_Spacecraft_%22Globus%22_IMP_navigation_instrument)
* **Musculo-skeletal systems:** actual biological mechanics is often modeled
  using mass-spring-damper systems 

In the sections that follow, we'll first go through a mass spring system's
fundamental parts and how to set up the equations. Masses, springs, and
dashpots (or dampers) are the three major parts of mass spring systems. The
equation(s) of motion for the system are derived using Newton's second law
along with the equations for the spring and friction (dashpot) forces. Let's
have a look at a really straightforward mass spring system we already have seen
before:

\figstyled{/assets/lectures/lec15/code/output/onemass.png}{width:50%;}

We should already know from [PHYS 211](https://courses.physics.illinois.edu/phys211/sp2023/course-description.html)
that the force exerted by the spring is in opposition to motion and dependent
on the total displacement from its equilibrium position. The spring constant
$k$ tells us how much force is generated per unit displacement and thus takes
units N/m. On the other hand, the force exerted by the dashpot is  proportional
the rate of change of displacement, i.e. velocity. Therefore this term is also
often called a _viscous damper_ (in relation to viscous liquids like a can of
thick paint). Both these forces along with the applied external force are
related to the acceleration experienced by the object (by Newton's second law
of motion). 

$$ \label{massspring}
m \ddot{x} = F_{ext} -kx - c \dot x 
$$

As a preview of BIOE 420, often this second order system is written as two
coupled first order differential equations by the introduction of _state
variables_ $z_1=x$ and $z_2 = \dot{z_1}$ which are displacement and velocity
respectively as:
\nonumber{$$
\dfrac{d}{dt} \begin{bmatrix} z_1 \\ z_2 \end{bmatrix} = \begin{bmatrix}
0 & 1 \\ -k/m & -c/m 
\end{bmatrix} \begin{bmatrix} z_1 \\ z_2 \end{bmatrix} + \begin{bmatrix}
0 \\ 1/m
\end{bmatrix}F_{ext}
$$}


Most mechanical systems we will concern ourselves with are different
arrangements of the above basic components. 

\collaps{**Exercise:** Derive the coupled second order ODEs which represent the
equations of motion for the following system:

\input{plot}{twomass}

}{**Answer:** Derivation left as an exercise to recall PHYS 211. Setting
$z_1=x_1, z_3=x_2, z_5=x_a$ we get, 
\nonumber{
$$
\begin{bmatrix} \dot z_1 \\ m_1 \dot z_2 \\ z_3 \\ m_2 \dot z_4 \\ \dot z_5 \\ m_a \dot z_6 \end{bmatrix} = 
\begin{bmatrix} 
0    &1    &0     &0    &0    &0 \\
-(k_1+k_2)   &-(c_1+c_2)  &k_2  &c_2  &0  &0 \\
0     &0    &0   &1    &0   &0\\
k_2 &c_2 &-(k_2+k_a)  & -(c_2 + c_a)  &k_a  &c_1 \\ 
0    &0    &0   &0    &0     &1\\
0  &0   &k_a  &c_a   &-k_a  &-c_a 
\end{bmatrix} \begin{bmatrix} 
z_1 \\ z_2 \\ z_3 \\ z_4 \\ z_5 \\ z_6
\end{bmatrix} + \vec{F} 
$$}
where 
\nonumber{
$$\vec{F} = \begin{bmatrix}
0 & 0 & 0 & 0 & 0 & F_{ext}
\end{bmatrix}^T $$
}}

To get \eqref{massspring} above written in the standard second order ODE
format we are already familiar with, i.e. 

\nonumber{$$
\ddot{x} + 2 \zeta \omega_n \dot x  + \omega_n ^2 x = F
$$}

we need to set:

\nonumber{$$
\omega _n ^2 = \dfrac{k}{m}, \qquad  \zeta = \dfrac{c}{2\sqrt{km}}, \qquad
\textrm{and} \qquad F = \dfrac{F_{ext}}{m}
$$}

This puts our system in the form that we have examined in detail in the
previous lecture - [Lecture 14](/lectures/lec14). In particular, there we
discussed the how different values of $\zeta$ lead to qualitatively
different responses from the system and we examined those responses using a
[demonstration](http://146.190.199.141/secondorder.html). Recall that these
were the cases of: **underdamped, overdamped and critically damped** systems. 

\note{**Note:** If those cases or terms seem alien to you then you should stop
here and go catch up with the earlier lecture.}

In this lecture note we further discuss two more qualitatively different
responses that can come from such systems which have to do with the _relative_
values of $\omega_n$ and the **forcing** frequency $\omega$ of the input
function $F(\omega)$. 

Forced motion means there is some sort of outside force acting on the masses
(i.e. motion independent of the spring or damping forces). Let’s modify the
above mass-spring system slightly to include a forcing term i.e. something
driving the mass that is driven separately from the mass:

\input{plot}{forced}

Note that $F$ above can be either a function for _force_ or _displacement_ of
the right endpoint. 

\collaps{**Exercise:** Derive the equations of motion for the above
system.}{**Solution:** Left as an homework exercise where $F$ is a function for
the displacement.}

In the following we assume that the reader is familiar with second order
differential equations of the _inhomogenous type_ (see MATH 285 syllabus); i.e.
with forcing term present. Let the forcing function be sinusoidal with
frequency $\omega$. Then we have four cases to discuss:

 * When the system is damped (and therefore has a decaying homogeneous
   solution), a case well discussed in MATH 285 and in last lecture. 
 * When the system is undamped and its natural frequency $\omega_n$ is very
   different from the forcing frequency $\omega$. 
 * When the system is undamped and $\omega \sim \omega_n$. 
 * When the system is undamped and $\omega = \omega_n$ 


### Damped systems or $\zeta \neq 0$. 

Quite simply, in the first instance with damping, we know that the
_homogeneous_ solution will be a decaying sinusoid, and we know that the
specific solution will be a sine/cosine from the _method of undetermined
coefficients_. The homogeneous solution is referred to as the **transient
solution** since it degrades/fades with time. The particular solution is known as the
**steady-state** solution since it consists just of a sine or cosine that never
ends. 

\input{plot}{damped_forced}

In general, you should picture the solution's appearance as $t\to \infty$
when you hear the term "steady state solution". We have already examined what
happens with different values of $\zeta$ the damping coefficient and so we
don't repeat it here. 


### Undamped systems or $\zeta = 0$. 

The cases of real interest for this lecture note are what happens without
damping in the presence of a forcing function.

#### General case, i.e. $ \omega \neq \omega_n$ 

In this case the frequency of the forcing function is very different from the
natural frequency of the system. This case is similar to the previous one,
except that absent any damping neither the homogeneous and nor the particular
solutions decay (they are both sinusoids with distinct frequencies). Thus the
full solution will be the superposition or addition of two sinusoids.

\input{plot}{undamped_forced}

#### Beats, i.e. $\omega \approx \omega_n$. 

This is where $\omega \approx \omega_n$ and there’s no damping, so both the
homogeneous and particular solutions are sinusoids. Moreover, the frequencies
are close enough such that we have periodic cancellations
between the homogeneous and particular solutions. An example solution of such a
case is there in your homework. It is actually possible to show that when
$\omega \approx \omega_n$, the solution will be a superposition of two sine
waves with very similar frequencies leading to the presence of a high frequency
component and a low frequency component in the solution. However,this requires
a lot of algebra to show and isn’t going to significantly improve your life, so
we don’t go into it here.

\input{plot}{beats}

#### Resonance, i.e $\omega = \omega_n$.

This last case, as the title says is the case of resonance. Recall that for a
inhomogeneous system:
\nonumber{
$$
\dfrac{d^2x}{dt^2} + \omega^2 x  =   F(t)
$$}
the homogenous solution (i.e. obtained when $F(t) \equiv 0$) is given by:
\nonumber{$$
x_h (t) = C_1 \sin (\omega t) + C_2 \cos (\omega t)
$$}
and we need to solve for the particular solution using the method of
undetermined coefficients. But now $F(t) = \sin(\omega t)$ is a match for a
homogenous basis function which results in a modification 
\nonumber{
$$
x_p(t) = C_{11} \sin (\omega t) + C_{22} t \cos (\omega t)  
$$}
which means the particular solutions grow with time. Thus, in the case of
resonance, the solution "blows up". 

\input{plot}{resonance} 

\note{**Note:** If you have forgotten MATH 285 or did not end up taking it this
semester that is fine, BIOE 205 won't test you on differential equations
material, we will leave that up to the math professor. Nevertheless, you should
see these two solution behaviors show up in your homework via Laplace transforms.}


## Electrical systems 

We assume everyone is familiar with PHYS 212 material regarding basic
electrical components like resistors, capacitors and inductors and Kirchoff's
current (KCL) and voltage laws (KVL). In this section, we start by discussing how the
differential equations arising from electrical circuits have analogues with the
mechanical systems we were just discussing. 

### Analogues with mechanical systems
The basic relations to remember here from PHYS 212 are the equations for the
voltage drops across the resistor, capacitor and inductor which are presented
below in their most common form:

\nonumber{
$$
V_R = IR, \quad \qquad V_C = q/C = \frac{1}{C} \int I dt , \quad \qquad V_L = L \dfrac{dI}{dt}
$$}

To start consider the basic RLC circuit shown below:


\input{plot}{series_rlc}


We can derive the differential equation governing this circuit via an
application of KVL using the familiar rules above:

\nonumber{$$
V_1 = IR + L \dfrac{dI}{dt} + \dfrac{1}{C} \int I dt 
$$}

however if we switch the basic unit from current to charge $q$ such that
$I=\dfrac{dq}{dt}$ then we can put the above equation in the form 

$$ \label{LRC}
L \ddot{q} = V_1 - R \dot{q} - \dfrac{q}{C}
$$

which we say is analogous to the mass-spring-damper equation \eqref{massspring}
because the variable substitutions $q \to x, V_1 \to F_{ext}, R \to c$ and
$\dfrac{1}{C} \to k$ allow us to go between the two equations. 

In fact we can derive more analogies based on these observations as summarized
in the below table. The key points are:

* Capacitors store energy by accumulating charge akin to springs store energy
  under extension or compression. This accounts for potential energy. 
* Inductors provide inertia against a change in the current flow through them
  and store energy via magnetic fields; thus providing an analogy with mass &
  energy associated with motion, i.e. kinetic energy. 
* Dashpots/dampers and resistors both dissipate energy in a system by opposing
  motion, one via friction and the other via opposition to the motion of
  electrons. 

#### Summary table 

| Type      | Basic unit   | Derivative | Storage        | Energy             | Dissipation | Driver  | Inertia     | Energy  |
|-----------|--------------|------------|----------------|--------------------|-------------|---------|-------------|---------|
|Mechanical | Disp.[^1]    | Velocity   | Spring         | Potential          |  Friction   | Force   | Mass        | Kinetic |
|_Equations_  | $x$          | $\dot x$   | $k x$          | $\dfrac{kx^2}{2}$  | $c\dot x$   | $F$     | $M\ddot{x}$ | $\dfrac{m\dot{x}^2}{2}$ |
|Electrical | Charge       | Current    | Capacitor      | Electric           | Resistor    | Voltage | Inductor    | Magnetic |
|_Equations_ | $q$           | $\dot q$   | $\dfrac{q}{C}$ |$\dfrac{q^2}{2C}$   | $R\dot q$   | $V$     | $L\ddot{q}$ | $\dfrac{L\dot{q}^2}{2} $
 
\note{**Note:** The analogies as summarized above is a particular form of
similarity that can be derived by equating applied external force in the
mechanical system with the potential difference that drives an electrical
circuit. Such an analogy is called the _Force-Voltage_ analogy. We could get a
different analogy by equating the applied external force with a current source.
Such analogies are called _Force-Current_ analogies.}

\collaps{**Exercise:** Find the mechanical analogue of the electrical system
depicted below:

\figstyled{/assets/lectures/lec15/code/output/analog.png}{width:70%}
}{**Solution:** Discussed in class, see lecture slides.}


### Impedance, a generalized resistance

We are familiar with the notion of calling the obstruction of the motion of
electrons through a material as the characteristic _resistance_ of a material.
Naturally, conductors have very low resistance and insulators have extremely
high resistance. Generally speaking, this applies to electrical circuit
elements regardless of whether we are dealing with a DC (direct current)
circuit or an AC circuit (alternating current) circuit. However, when it comes
to inductors and capacitors, recall that their behavior is far more interesting
in the AC case than in the DC case. Indeed, for example, with DC current,
uncharged capacitors act like short circuits (transient phase) and fully
charged capacitors (steady state) act like open circuits. Similarly, inductors
in steady state can be considered short circuits and vice versa. It is
precisely when the electric field changes continuously across the dielectric in
a capacitor or within an inductor that our familiar equations 
$$ V = \label{capindeq} L\dfrac{dI}{dt} \qquad \textrm{and} \qquad I = C\dfrac{dV}{dt}$$ 
hold. It turns out that each of these circuit elements
offer their own obstruction to the flow of AC, albeit in a frequency dependent
manner. This obstruction term is called _reactance_.

In fact, \eqref{capindeq} tells us even more. The first of these tells us that
the voltage across the inductor is zero whenever the slope of the $I$ vs. $t$
(time) graph is horizontal and that $V$ is maximized when the rate of change of
current is maximized. Thus if $I=sin(t)$ then $V$ is a cosine and vice versa. A
similar relationship can also be seen to hold for the second equation above.
This leads us to the following conclusions:

 * Current _lags_ voltage by $90^\circ$ in a purely inductive circuit
 * Current *leads* voltage by $90^\circ$ in a purely capacitive circuit

Moreover, for an inductor, faster the current switches direction (consider AC)
the larger the voltage drop and so is its contribution to the voltage drop in a
circuit (i.e reactance) is directly proportional to the frequency $\omega$ of
the applied AC. Conversely for a capacitor, faster the electric field switches,
the more is the current. Thus its opposition to current (or reactance) is
inversely proportional to the AC frequency. Thus we get the following
definitions of inductive and capacitive reactance (denoted using a $X$):

\nonumber{$$
X_L = L \omega \qquad \textrm{and} \qquad X_C = \dfrac{1}{\omega C}
$$}

Coupling this with inherent/internal Ohmic losses (i.e. pure resistance $R$) and the fact
that the current/voltage relationship are out of phase with each other we
defined the _impedance_ for each of these elements as:

\nonumber{$$
Z_L = L\omega j \qquad \textrm{and} \qquad X_C = \dfrac{1}{j\omega C}
$$}

which dovetails nicely with our adopted notation for the Laplace domain
variable $s = j \omega$ to give us the usual definition of impedances for the
capacitor and inductor:

$$ \label{imped}
Z_L = L s \qquad \textrm{and} \qquad Z_C = \dfrac{1}{Cs}
$$

\collaps{**Exercise:** Make sense of the lead-lag relationship in the bullet
points above for inductors/capacitors in conjunction with the definition of
impedance in \eqref{imped} and the generalized Ohm's law: $V=IZ$.}{}

**Solution:** From the form of the generalized Ohm's law: $V=IZ$ the $Z$ term
should appropriately add or subtract phase from the current to give the right
relationship with velocity. Considering the [Argand
plane](https://mathworld.wolfram.com/ArgandDiagram.html) 

\input{plot}{argand}

we see that $Z_L$ should add a phase of $\pi/2$ whereas $Z_C$ subtracts a phase
of $\pi/2$. This meshes well with the bullet points above since:

 * For inductors we take the lagging current and add $\pi/2$ to get voltage
   with the correct phase. 
 * For capacitors we take the leading current and subtract $\pi/2$ to get
   voltage with the correct phase.

This is another example where algebra and math is simplified using "imaginary"
numbers. 

~~~
<p align="center"><a href="/lectures/">[back]</a></p>
~~~

 [^1]: _Displacement_: Just trying to make the table fit. 😁
