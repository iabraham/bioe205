using Plots, Base.Iterators, FFTW

t=0:0.02:2π
y = sin.(8*π*t) + sin.(2π*sqrt(2)*t) + sin.(2π*sqrt(59)*t)
plot(t, y, label=false, title="Wave with three diff freqs.")
savefig(joinpath(@__DIR__,"output/mix_plot")) #hide


X = fft(y)
plot(abs.(X), label=false, title="DFT same length as y=$(length(y))")
savefig(joinpath(@__DIR__,"output/plain_dft")) #hide


lx = length(X)
freqs = (-lx÷2:lx÷2)/lx*(1/0.02)
p1 = plot(freqs, abs.(X), label=false)
vline!(p1, [sqrt(2), 4, sqrt(59)], label="Fundamental freqs.")
savefig(joinpath(@__DIR__,"output/freq_dft")) #hide


p2 = plot(freqs, abs.(fftshift(X)), label=false)
vline!(p2, [sqrt(2), 4, sqrt(59)], label="Fundamental freqs.")
savefig(joinpath(@__DIR__,"output/fftshift_dft")) #hide
