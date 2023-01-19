using Plots

y1 = [1 + rand() for _ in 1:10]
y2 = [-2 + rand() for _ in 1:10]
ylims, xlims = (-5, 5), (-2, 16)
p1 = scatter(1:10, y1, marker=:o, label=false, xlim=xlims, ylim=ylims, color=:red)
p1 = scatter!(p1, 1:10, y2, marker=:d, label=false, xlim=xlims, ylim=ylims, color=:blue, title="Original signals")

p2 = scatter(1:10, y1, marker=:o, label=false, xlim=xlims, ylim=ylims, color=:red)
p2 = scatter!(p2, 4:13, y2, marker=:d, label=false,xlim=xlims, ylim=ylims, color=:blue, title="Shifted signals")

p3 = scatter(1:10, y1, marker=:o, label=false, xlim=xlims, ylim=ylims, color=:red)
p3 = scatter!(p3, 4:13, y2, marker=:d, label=false,xlim=xlims, ylim=ylims, color=:blue)
p3 = scatter!(p3, 1:3, [0, 0, 0], marker=:s, label=false, color=:blue)
p3 = scatter!(p3, 11:13, [0, 0, 0], marker=:s, label=false, color=:red, title="Zero padded")

l = @layout [a b
c]
plot(p1, p2, p3, layout=l, size=(800,500))
savefig(joinpath(@__DIR__,"output/zeropad")) # hide
