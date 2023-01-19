# This is Julia code; it will not run in MATLAB/Python
using Plots

function logistic_plot(r, N)
	logistic(x, y) = r*x*(1-x)
	y = fill(0.5, N)
	z = accumulate(logistic, y)
	plot(1:N, z, title="r=$r", size=(1000,1000), ylims=(0,1), label=false)
end

Rs = [0.5, 1.5, 2.5, 3.2, 3.52, 3.547, 3.6, 3.83, 3.9]
Ns = [50, 50, 50, 500, 500, 500, 500, 500, 500]
plots = [logistic_plot(r, n) for (r,n) in zip(Rs, Ns)]

plot(plots..., layout=(3,3))
savefig(joinpath(@__DIR__,"output/logistic_map"))
