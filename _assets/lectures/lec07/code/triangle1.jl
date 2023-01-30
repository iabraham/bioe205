# This is Julia code; it will not run in MATLAB/Python
using Plots

△(A, P) = x -> 4*A/P * abs(mod(x - P/4, P)-P/2) - A
t=-6:0.01:14
plot(t, △(2, 8).(t.-2), label=false, xticks=-4:2:12, framestyle=:origin)
savefig(joinpath(@__DIR__,"output/triangle1")) #hide
