using Plots

x_act = 98.6
x_measured = [x_act + 2*randn() for _ in 1:100]
p1 = hline!(plot(x_measured, label=false), [x_act], color=:red, 
	label="Actual value", title="100 measurements");

n_avgs = [4, 8, 12, 16, 24, 32, 48, 64, 72, 86]
means = [mean(sample(x_measured, n)) for n in n_avgs]
p2 = plot(n_avgs, means, marker=:s, label=:false, 
	title="Averages")
p2 = hline!(p2, [x_act], color=:red, label=:false)

stds = [std(mean(sample(x_measured, n)) for _ in 1:100) for n in n_avgs]
p3 = plot(n_avgs, stds, marker=:s, label=:false, 
	title="Std. Dev.")

l = @layout [a [b
c]]
plot(p1, p2, p3, layout=l, size=(800,400))

savefig(joinpath(@__DIR__,"output/averaging")) # hide
