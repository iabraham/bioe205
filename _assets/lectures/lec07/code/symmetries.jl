# This is Julia code; it will not run in MATLAB/Python
using Plots, Waveforms

t = -5:0.01:5
p11 = plot(t, t.^2, label="Even function")
p12 = plot(t, t.^3, label="Odd function")
halfwave(t) = squarewave(2t) - 0.5*squarewave(2(t - π/4))
p3 = plot(t, halfwave.(t), label=false, title="½ wave symmetry")
p3 = vline!(p3, [π/2, π], label=false)
l = @layout [a b 
c]
plot(p11, p12, p3,  layout = l, framestyle=:origin, size=(800,500))
savefig(joinpath(@__DIR__,"output/symmetries")) #hide
