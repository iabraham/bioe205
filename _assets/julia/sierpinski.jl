using Plots, Base.Iterators, Statistics

function sierpinski_triangle(coords,lvl,fig)
	lvl==0 && return fig
	plot_coords(c) = map(first, c), map(last, c)
	new_cs(c) = map(mean, plot_coords(c))
	ln, mn, rn = [new_cs(x) for x in take(partition(cycle(coords),2),3)]

	foreach(product(coords, coords)) do (i, j)
		plot!(fig, plot_coords([i,j]), axis=false, legend=false)
	end

	sierpinski_triangle([coords[1], ln, mn],lvl-1,fig)
	sierpinski_triangle([ln, coords[2], rn],lvl-1,fig)
	sierpinski_triangle([mn, rn, coords[3]],lvl-1,fig)
end

init = [(0,0),(0.5,1),(1,0)]
sierpinski_triangle(init, 6, plot(size=(800,600)))
savefig(joinpath(@__DIR__,"output/sierpinski")) # hide
