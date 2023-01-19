# This is Julia code; it will not run in MATLAB/Python
using Plots

s = 0:0.1:2π
f(t) = sin.(2t) + sin.(sqrt(2)*t)

scatter(s, f(s), marker=:circle, legend=false, size=(600,300))
savefig(joinpath(@__DIR__,"output/discrete"))
