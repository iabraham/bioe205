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
$$
y (t) = \begin{cases} &0, \quad t < t_0 \\ &c,\quad t \geq t_0 \end{cases} 
$$

The Laplace transform of the step signal is computed as follows:



## Mathematical operations & Laplace transforms 


## Solving ODE's in the presence of nonzero initial conditions


