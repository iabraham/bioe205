# This is Julia, code will not run in Python/MATLAB
using Plots, NumericalIntegration

h(t) = t < 0 ? 0 : 1 
t = -2:0.001:2 
funcs = [("Unit Step", t, h), ("Ramp", t, cumul_integrate(t, h.(t))),
	 ("Impulse", t[2:end], diff(h.(t))),
	 ("Exponential", t, exp.(t))]
ps = [plot(x, y, label=k) for (k,x,y) in funcs]
plot(ps..., layout=(2,2), size=(600,400))

savefig(joinpath(@__DIR__,"output/simple_funcs")) # hide
