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
sigs = [awgn(50*sin.(2*π*30 .* ts), -3) for _ in 1:50]

pp1 = plot(ts, sigs[1], title="One noisy sinusoid", label=false)
pp2 = plot(ts, mean(sigs), title="Mean of 50 noisy sinusoids", label=false)
plot(pp1, pp2, layout=(1,2), size=(800,400))

savefig(joinpath(@__DIR__,"output/ensemble")) # hide
