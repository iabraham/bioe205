# This is Julia, code will not run in Python/MATLAB
using Statistics

function crosscorr(x, y)
	lx, rxx, lags = length(x), AbstractFloat[], Integer[]
	x = vcat(zeros(lx-1), x, zeros(lx-1))
	lags_ranges = [(k-lx, k:k+lx-1) for k=1:2*lx-1]

	foreach(lags_ranges) do (lag, range)
		push!(rxx, mean(x[range].*y))
		push!(lags, lag)
	end
	return rxx, lags
end
