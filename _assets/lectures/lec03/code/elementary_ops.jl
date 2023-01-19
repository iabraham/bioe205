# This is Julia, code will not run in Python/MATLAB

using Plots, Waveforms, LaTeXStrings

function plot_items(items, labels, title, pp=plot())
	foreach(zip(items, labels)) do (y, l)
		plot!(pp, t, y, label=l)
	end
	plot!(pp, title=title)
end

t = 0:0.05:10
traces = [[squarewave.(t), squarewave.(t) .+ 0.5, squarewave.(t) .- 0.5],
	  [trianglewave.(t), trianglewave.(t .- 1), trianglewave.(t .+ 1)],
	  [sin.(3t), exp.(-0.5t), exp.(-0.5t) .* sin.(3t)],
	  [sin.(t), 2 .* sin.(t), 1/2 .* sin.(t)],
	  [sawtoothwave.(t), sawtoothwave.(2t), sawtoothwave.(1/2*t)],
	  [sin.(t), sin.(t.^2), sin.(t) .+ sin.(t.^2)]]

labels = [[L"$y(t)$", L"$y(t) + 0.5$", L"$y(t) - 0.5$"], 
	  [L"$y(t)$", L"$y(t-1)$", L"$y(t+1)$"],
	  [L"$f(t)=\sin(3t)$", L"$g(t)=e^{-t/2}$", L"$y(t) = f(t)g(t)$"],
	  [L"$y(t)$", L"$2y(t)$", L"$0.5y(t)$"], 
	  [L"$y(t)$", L"$y(2t)$", L"$y(t/2)$"],
	  [L"$f(t)=\sin(t)$", L"$g(t)=\sin(t^2)$", L"$y(t) = f(t) + g(t)$"]]

titles = ["Y-axis shifts", "X-axis shifts", "Multiplication", 
	  "Y-axis scaling", "X-axis scaling", "Addition"]

final_plot = plot(map(plot_items, traces, labels, titles)..., 
		  layout=(2,3), size=(850, 500))
savefig(joinpath(@__DIR__,"output/elementary_ops")) # hide
