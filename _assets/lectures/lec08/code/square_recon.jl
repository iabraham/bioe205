using Plots, Base.Iterators

spool(N) = flatten([-1:-2:-N, 1:2:N])
F(k) = 2/(k*π*im)
kth_term(t) = k -> F(k) * exp.(2π*k*im*t)

N, t = 20, 0:0.01:5
y = real(sum(kth_term(t).(spool(N))))
title = "Reconstructed sq. wave for N=$N"
plot(t, y, label=false, title=title)
savefig(joinpath(@__DIR__,"output/square_recon")) #hide
