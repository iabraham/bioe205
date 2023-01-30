# This is Julia code; it will not run in MATLAB/Python
using Plots, Waveforms

t = -2:0.01:3
plot(t, -trianglewave.((t.-1/2)*π), xticks=([0,1,2],("0","T/2","T")), label=false, yticks=([-1,0,1],("-A", "0","A")))
hline!([0], linestyle=:dash, label=false)
vline!([0], linestyle=:dash, label=false)
savefig(joinpath(@__DIR__,"output/triangle2")) #hide
