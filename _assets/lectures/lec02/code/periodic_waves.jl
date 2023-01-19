# This is Julia code; it will not run in MATLAB/Python
using Plots, Waveforms

t = 0:0.01:10
plot(t, sin.(3t) .+ 6, label="Sine")
plot!(t, squarewave.(π.*t) .+ 3, label="Square")
plot!(t, trianglewave.(π.*t), label="Triangle")
plot!(t, squarewave1.(t/2,0.2) .- 3, label="Pulse")

savefig(joinpath(@__DIR__,"output/periodic_waves"))


