# This is Julia code; it will not run in MATLAB/Python
using Plots, StatsBase, StatsPlots, Distributions

μ = 1/2
σ2 = 1/12

function compare(n)
	n_vec = [mean(rand(n)) for _ in range(1, 1000)]
	dn = Normal(1/2, sqrt(σ2/n))
	histogram(n_vec, normalize=:pdf, label="Empirical")
	plot!(dn, label="Theoretical", title="Averaging: $n RVs")
end

nvals = [1, 4, 8, 16];
myplots = compare.(nvals)
plot(myplots..., layout=(2,2), size=(800,600))
savefig(joinpath(@__DIR__,"output/clt"))
