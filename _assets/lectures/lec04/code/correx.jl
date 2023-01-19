# This is Julia, code will not run in Python/MATLAB
using Plots

t = 0:0.01:2π
p1, p2 = [plot(t, sin.(t).^2) for _ in 1:2]
p1 = plot!(p1, t, sin, title="Uncorrelated?")
p2 = plot!(p2, t, abs.(sin.(t)) .- 1/2, title="Correlated?")
plot(p1, p2, size=(800,300), ylim=(-1,1))

savefig(joinpath(@__DIR__,"output/correx")) # hide
