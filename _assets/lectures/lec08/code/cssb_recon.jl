using Plots

spool(N) = -N:1:N
C(k) = (exp(24//10)-1)/(24//10 -im*2π*k)
kth_term(t) = k -> C(k) * exp.(2π*k*im*t)

N, t = 50, 0:0.01:5
y = sum(kth_term(t).(spool(N)))
plot(t, real(y), label=false, title="Reconstructed wave for N=$N")
savefig(joinpath(@__DIR__,"output/cssb_recon")) #hide
