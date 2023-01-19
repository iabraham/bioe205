# This is Julia code; it will not run in MATLAB or Python.
using Plots

N = 100;
x = (1:N)/N;
y = sin.(8π.*x);
I = [y for _ in range(1,100)];
heatmap(hcat(I...)', c=:bone)
savefig(joinpath(@__DIR__,"output/ex1_2")) # hide
