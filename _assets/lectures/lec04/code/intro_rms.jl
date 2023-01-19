# This is Julia code; it will not run in MATLAB/Python

using Plots,  MAT, Plots.Measures

readfile(x) = read(matopen(joinpath(@__DIR__,x)), "eeg")[:]
eeg1, eeg2 = readfile.(["eeg_data1.mat", "EEG.mat"])
eeg1 = eeg1 ./ maximum(eeg1) .* 10
eeg2 = eeg2 ./ maximum(eeg2) .* 5 .+ 5
t = LinRange(0, 15, length(eeg1));

params = Dict(:label=>false, :xlim=>(0,15), :ylim=>(-15,15))
p11 = plot(t, eeg1; params...)
p12 = plot(t, eeg2[1:length(eeg1)]; params...)
plot(p11, p12, layout=(1,2), size=(800,350), frame=:box, ylabel="x(t)",
     xlabel="Time (s)", leftmargin=5mm, bottom_margin=5mm)

savefig(joinpath(@__DIR__,"output/intro_rms")) # hide

