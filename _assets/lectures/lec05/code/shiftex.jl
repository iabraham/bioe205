using Plots

t = -0.6:0.01:0.6
shifts = [0, π/4, π/2]
f1(t) = cos(2*π*2*t)
f2(t, shift) = 1/2*sin(2*π*2*t+shift)

ps = [plot(t, f1, label="Cosine") for _ in 1:length(shifts)]
corrs = [cor(f1.(t), f2.(t,s)) for s in shifts]
title(s, c) = "Shift=$(round(s, digits=2)), Corr=$(round(c, digits=2))" 
ps = [plot!(p, t, f2.(t, s), title=title(s, c), label="Sine") 
	  for (p, s, c) in zip(ps, shifts, corrs)]
rxx, lags = crosscorr(f2.(t, 0), f1.(t))
lags = plot(lags ./ 100, rxx, xlim=(0, 0.5), label=false, 
	        title="Correlation vs. lag")
plot(ps..., lags, layout=(2,2), size=(800,600))

savefig(joinpath(@__DIR__,"output/shiftex")) # hide
