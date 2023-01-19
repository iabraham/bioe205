# This is Julia code; it will not run in MATLAB/Python
using Plots

f(t) = sin.(2t) + sin.(sqrt(2)*t)

t = 0:0.01:2π
s = 0:0.1:2π
yt, ys = map(f, [t, s])


plot(t, yt, size=(600,300))
plot!(s, ys, line=:stem, marker=:circle, legend=false)
savefig(joinpath(@__DIR__,"output/sampling"))
