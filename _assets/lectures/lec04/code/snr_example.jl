# This is Julia, code will not run in Python/MATLAB
using Plots

function awgn(x,snr)
    N=length(x)
    signal_power = sum(x[:].^2)/N
    linear_snr = 10^(snr/10)
    noise = randn(N) .* √(signal_power/linear_snr)
    snr==0 ? x : x + noise
end

ts = LinRange(1, 500, 1000)
sig = 50*sin.(2*π*30 .* ts)
snrs = [0, 10, 3, -3]

plot_snr(snr) = plot(ts, awgn(sig, snr), label=false, title="SNR=$snr dB")
plots = plot_snr.(snrs)
plot(plots..., layout=(2,2), size=(800,600))

savefig(joinpath(@__DIR__,"output/snr_example")) # hide
