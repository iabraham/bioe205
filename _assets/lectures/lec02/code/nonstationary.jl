# This is Julia code, it will not run in MATLAB or Python
using Plots

unitstep(x) = x>0 ? 1 : 0

t0, tmax, fs = 0, 30, 100000/01875  
t = t0:1/fs:tmax;

f1(t) = sin(t^3/2)*exp(-(t-3)^2/2)
f2(t) = t/10*unitstep(t-7)*sin((t-7)^2/1.5)*exp(-(t-13)^2/8) 
f3(t) = unitstep(t-20)*sin((t-20)^2)

fullf(t) = f1(t) + f2(t) + f3(t)
plot(t,fullf.(t), label=false, title="Non-stationary signal")
savefig(joinpath(@__DIR__,"output/nonstationary"))

