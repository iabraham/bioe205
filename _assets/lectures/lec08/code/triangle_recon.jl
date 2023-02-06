using Plots, Base.Iterators

spool(N) = flatten([-1:-2:-N, 1:2:N])
a(k) = (4*sin(π*k/2)^2)/(k^2*π^2)
kth_term(t) = k -> a(k)*cos.(2π*k*t)

N, t = 10, 0:0.01:5
y = real(sum(kth_term(t).(spool(N))))
title = "Reconstructed △ wave for N=$N"
plot(t, y, label=false, title=title)
savefig(joinpath(@__DIR__,"output/triangle_recon")) #hide
