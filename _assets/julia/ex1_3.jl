# This is Julia code; it will not run in MATLAB or Python.
using Plots, MAT

path = "_assets/matlab/"
I = read(matopen(joinpath(path,"brain.mat")), "I")
p11 = heatmap(I, c=:bone, title="Original Image", clims=(0,1))
p12 = heatmap(I .+ 0.30, c=:bone, title="Lightened", clims=(0,1))
p21 = heatmap(I .* 1.75, c=:bone, title="Contrast Enhanced", clims=(0,1))

I1 = zero(I)
I1[I .< 0.25] .= 1
p22 = heatmap(I1, c=:bone, title="Thresholded", clims=(0,1))

l = @layout [a b; c d]
plot(p11, p12, p21, p22, layout=l, size=(800,600))
savefig(joinpath(@__DIR__,"output/ex1_3")) # hide
