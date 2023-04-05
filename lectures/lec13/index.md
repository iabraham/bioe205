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

\collaps{**Exercise:** Derive the Laplace transform of the step input
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
The quantity on the right being integrated is nothing but the Laplace transform
of $x(t)$ (which we will denote by $X(s)$). This gives (applying the limits)
$$ \label{lapldiff}
\mathcal{L}\dfrac{dx(t)}{dt} = s X(s) - x(0^{-})
$$

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
you guessed it: division! Isn't mathematics beautiful & orderly?. In fact
that particular bit of math works out to look like:


\nonumber{$$
\mathcal{L} \left[ \int \limits _{0} ^{T} x \left( t \right) dt \right] = \dfrac{1}{s}
X(s) + \dfrac{1}{s} \int \limits_{-\infty} ^{0} x(t) dt
$$}

Therefore, in the presence of all zero initial conditions we can equate
integration in time domain with division by $s$ in the Laplace domain - often
called multiplication by $\frac{1}{s}$ for obvious reasons. 

\collaps{**Exercise:** What is the Laplace transform of the ramp
function?}{**Solution:** Recall that the integration of the step function gives
rise to the ramp function. Thus, the Laplace transform of the ramp function is
the Laplace transform of the step function multiplied by $s$, i.e.
$\dfrac{1}{s^2}$}


### Solving convolutions

Another major result that we had when we learnt about Fourier analysis was the
fact that convolutions in the time domain became multiplications in the
frequency domain. Once again, as should be true of any generalization, this
result remains unchanged in the Laplace domain. In other words 

\nonumber{$$
f(t) \star g(t) = F(s) G(s)
$$}


#### Example

Let us try to solve the following convolution using Laplace domain. 

\input{plot}{conv}

The functions in the above plot are as follows:

\nonumber{$$
h(t) = u(t)-u(t-1) \qquad \textrm{and} \qquad f(t) = e^{-2t} \quad \textrm{for}
\quad t \ge 0
$$}

Then we have that
\nonumber{$$
\mathcal{L} \left( h(t) \right) = \frac{1}{s} - e^{-s}\frac{1}{s}
$$}
and
\nonumber{$$
\mathcal{L} \left( f(t) \right) = \frac{1}{s+2}
$$}

\emphasis{Verify that the above claims are true! In particular, we made use of
the following result:
\nonumber{$$
\mathcal{L}\left[x(t-T)\right] =e^{-sT}\mathcal{L}\left[x\left(t\right)\right]
$$}
which you should be able to prove.}

Therefore 
\nonumber{$$
f(t) \star h(t) \implies F(s) H(s) = \left( \frac{1}{s} - e^{-s}\frac{1}{s}
\right) \frac{1}{s+2} = \frac{1}{s(s+2)} - e^{-s}\frac{1}{s(s+2)}
$$}

Now to find the result $y(t) = f(t) \star h(t)$ we need to take the inverse
Laplace transform of $F(s)H(s)$ which we can do using Laplace transform tables
if we can find the above functions in them. Often the tables of Laplace
transforms will only have basic generic forms listed in them and the onus is on
us to convert our functions into the forms given in the tables. 

One particular technique that is useful here is to be able to break apart
complex fractions like the above into their constituents. This is called the
technique of _partial fractions_ which is powerful and very useful one to have
under our repertoire. Here we will show the technique in action for now but
relegate the general treatment to the next section. 

Consider:
\nonumber{$$
\dfrac{1}{s(s+2)} = \frac{A}{s} + \dfrac{B}{s+2}
$$
}
where we have made the assumption that we can rewrite the rational form on the
left using two constants $A$ and $B$ on the right. A little manipulation of the
quantity on the right and then equating the numerators gives:
\nonumber{$$
 \dfrac{1}{s(s+2)}  = \dfrac{A(s+2)+Bs}{s(s+2)} \quad \implies \quad A(s+2) +Bs
= 1
$$
}
The equation on the extreme right should hold for _all values_ of $s$. In
particular, plugging $s=0$ and $s=-2$ we can easily get that:
\nonumber{$$
2A = 1 \quad \implies \quad A = 1/2 $$}
and
\nonumber{$$
\quad -2B =1 \quad \implies \quad B = -1/2
$$}
Therefore, 
\nonumber{$$
\dfrac{1}{s(s+2)} = \dfrac{1}{2s} - \dfrac{1}{2(s+2)} 
$$}
These fractions can be commonly found in tables: for example
[here.](https://tutorial.math.lamar.edu/pdf/laplace_table.pdf)

Taking the inverse Laplace transform gives:
\nonumber{$$
y(t) = = \frac{1}{2}\left(1- e^{-2t}\right) - u(t-1) \frac{1}{2}\left(1- e^{-2(t-1)}\right)
$$}

which we plot below along with the original functions. 
\input{plot}{conv_ans}
\emphasis{**Exercise:** Verify that the above claim is true using a Laplace
transform table.}

Now we turn our attention to the general procedure for finding partial fraction
expansions (PFE). 


## General method of partial fractions


\warn{Note: Skip the exercises and verification steps in the following
section at your own risk: PFEs tend to be popular on exams and if you have been
sourcing rather than solving homework or have become accustomed to using MATLAB
all the time, you **need** to work out every step here.} 

The basic objective in the method of partial fractions is to decompose a
_proper_ rational fraction (a rational fraction is proper only if the degree of
the numerator is lower than the degree of the denominator) into simpler
constituents. Here is the general strategy:

1. Start with a proper rational fraction. If improper, then perform polynomial
   long division first and focus on the part that is proper. 
2. Factor the denominator into linear and irreducible higher order terms. A term
   or factor is called irreducible if it cannot be factored further using
   rational numbers: e.g. $s^2+36s+25$ is irreducible because factoring it
   requires writing:
   \nonumber{$$
   s^2 + 36s + 25 = -\left(\left(-s+\sqrt{299}-18\right)
   \left(s+\sqrt{299}+18\right)\right)
   $$}
   which involves an irrational: $\sqrt{299}$. 
3. Next, write out a sum of partial fractions for each factor (and every
   exponent of each factor) using the forms/rules for PFEs (see table below). 
4. Multiply the whole equation by the bottom/denominator and solve for the
   coefficients. 

The form of the partial fraction written in Step 3 depends on the form of the
factor in the denominator as elucidated in the following table:


|           Type                | Partial Fraction Decomposition |
| ------------------------------| ------------------------------ | 
| Non-repeated linear factor    | $\dfrac{A_1}{ax+b}$            |  
| Repeated linear factor        | $\dfrac{A_1}{ax+b} + \dfrac{A_2}{(ax+b)^2} + \dots + \dfrac{A_n}{(ax+b)^n}$ |
| Non-repeated quadratic factor | $\dfrac{B_1x+C_1}{ax^2+bx+c}$  | 
| Repeated quadratic factor     | $\dfrac{B_1x+C_1}{ax^2+bx+c} + \dfrac{B_2x+C_2}{(ax^2+bx+c)^2} + \dots + \dfrac{B_nx+C_n}{(ax^2+bx+c)^n}$ |

As you can see, when we have a repeated factor we have to write a partial
fraction for it as many times as it repeats (with different powers as well). 
We now do an example to illustrate the above steps. 

#### Partial fractions example:

Find the partial fraction decomposition of:
$$ \label{simple}
\dfrac{3s+1}{\left(2s-1\right)\left(s+2\right)^2} 
$$

**Solution:** 
Fortunately the denominator is already factored for us and consists of two
repeated linear terms and a non-repeated linear term. So we have:
\nonumber{$$
\dfrac{3s+1}{\left(2s-1\right)\left(s+2\right)^2}  = \dfrac{A_1}{2s-1} +
\dfrac{A_2}{s+2} + \dfrac{A_3}{(s+2)^2}
$$}
Multiply throughout by $(2s-1)(s+2)^2$ to get rid of the denominator. We get
\nonumber{$$
3s+1 = A_1(s+2)^2 + A_2(s+2)(2s-1) + A_3(2s-1)
$$}
Now we can solve for the uppercase coefficients by plugging in different values
of $s$ (because the equation should hold of _any_ value of $s$). 

 - For example $s=-2$ gives us $A_3 = 1$ because:

 	\nonumber{$$
	3 (-2) + 1 = A_3 \left(2(-2) -1 \right) \quad \implies \quad -5 =
	-5A_3
	$$}
 - Similarly, one can (and you should) verify that $s=1/2$ gives us that $A_1 = \dfrac{2}{5}$. 
 - Using the values of $A_3$ and $A_1$ with $s=0$ gives us that $A_2 = -\dfrac{1}{5}$ (again verify this). 

Thus, 
$$ \label{easy}
\dfrac{3s+1}{\left(2s-1\right)\left(s+2\right)^2}  = \dfrac{2/5}{2s-1} -
\dfrac{1/5}{s+2} + \dfrac{1}{(s+2)^2}
$$

\emphasis{**Exercise:** Again ... verify that the equality above holds!}

Now it may not always be the case that the method of partial fractions will be
solvable by trying different values of $s$ as in \eqref{simple}. Sometimes we
may need to set up a system of linear equations to solve for the coefficients
or resort to using software. Below follows an example where this happens:

#### Example redux 

Find the partial fraction expansion of:

$$
\dfrac{s^2+15}{(s+3)^2(s^2-3)}
$$

**Solution:**
Again the denominator is already factored for us and consists of a twice
repeated linear terms and a single quadratic term (why?). Therefore as per the table
above we get that: 

\nonumber{$$
\dfrac{s^2+15}{(s+3)^2(s^2-3)} = \dfrac{A_1}{s+3} + \dfrac{A_2}{(s+3)^2} +
\dfrac{B_1s+C_1}{s^2-3}
$$}
Now multiply both sides with $(s+3)^2(s^2-3)$ to get rid of the denominator:
\nonumber{$$
s^2+15 = (s+3)(s^2-3)A_1 + (s^2-3)A_2 + (s+3)^2(B_1s+C_1)
$$}
Now our task is to solve for the uppercase coefficients using different values
of $s$. For example, using $s=-3$ we get:

\nonumber{$$
6A_2 = 24 \qquad \implies \qquad A_2 = 4
$$}

But that is pretty much the only headway we can make here to get at the
uppercase coefficients directly. What we will need to do next is to substitute
in this value of $A_2$ into the above equations and collect like powers of $s$
to compare coefficients. This will give us a linear system of three equations
in three unknowns. One can verify that these are:

\begin{align*}
-9A_1 + 9C_1 &= 27 \\
3A_1 + 6B_1 + C_1 &= -3 \\
-4A_1 + 8B_1 + 6C_1 &= 0
\end{align*}

\collaps{**Exercise:** Verify that these equations are indeed correct and
solve them.}{**Solution:** One gets $2A_1 = C_1 = 6$ and $B_1=-A_1$. We leave
it as an exercise to write down and verify the partial fraction expansion in
this case.}

### Partial fractions in software

Fortunately, we can use MATLAB (or some other software package) to solve
partial fraction problems[^1]. In this section we will show examples of using
software to solve the above problems. As usual with software toolkits, using
the right tool for the correct job makes life easier. 

The most straightforward method is to use a CAS. For example Mathematica
implements this as
[`Apart`](https://reference.wolfram.com/language/ref/Apart.html). 

\input{plot}{apart_mma}

but our go-to software in this course is either MATLAB or Python so we look at
MATLAB next. In MATLAB the command we will use is called
[`residue`](https://www.mathworks.com/help/matlab/ref/residue.html) and the
code snippet below shows how we solve the **first** problem above. 

\input{matlab}{matlab_ex.m}

which gives 

\output{matlab_ex}

The output suggests that the partial fraction expansion is:

$$ \label{easydec}
\dfrac{3s+1}{\left(2s-1\right)\left(s+2\right)^2} = \dfrac{-0.2}{s+2} +
\dfrac{1}{(s+2)^2}+ \dfrac{0.2}{s-1/2}
$$

\emphasis{**Exercise:** Verify the partial fractions in \eqref{easy} and
\eqref{easydec} are the same.}

A similar exercise in coding shows that the second example from above can be
formulated as follows:

\input{matlab}{matlab_bad.m}

with output:

\output{matlab_bad}

But here we run into trouble because MATLAB factored the $s^2-3$ term further
using $(s - \sqrt{3})(s+\sqrt{3})$ (see footnote 1). 

\collaps{**Question:** Can you fix the above code to get the answer we
want?}{**Answer:** Left as an exercise (and please inform me if you do fix it).}

One (particularly unsatisfactory) way around this limitation is to use the
[`partfrac`](https://www.mathworks.com/help/symbolic/sym.partfrac.html) from
MATLAB's Symbolic Toolbox (which might involve paying for yet another add-on to
MATLAB):

```matlab
syms s 
partfrac((s^2+15)/((s+3)^2*(s^2-3)))
```

The above gives:

\output{matlab_sym}

## Solving ODE's in the presence of nonzero initial conditions

As remarked previously, the one-sided Laplace transform (when properly taken)
ends up having a $s(0^-)$ term (see Eq. \eqref{lapldiff} for example). In
the following we will make use of this to see how we can solve initial value
problems. Consider our mass-spring and damper system from [Lecture
12](/lecture/lec12):



## Final and initial value theorems


[^1]: ... with a few caveats. More specifically, the answer MATLAB gives you may not always be the answer you want. 
