# This is Julia code; it will not run in MATLAB/Python
using Plots, Waveforms

t = -3:0.01:3
plot(t, squarewave.(t*π), xticks=([0,2],("0","T")), label=false)
hline!([0], linestyle=:dash, label=false)
savefig(joinpath(@__DIR__,"output/square")) #hide
