# This is Julia, code will not run in Python/MATLAB
using Plots

begin
  local r = LinRange(1, 1000, 1000)
  y = 10 .* log10.(r)
  plot(r, y, label=false, xlabel="Ratio", ylabel="dB", title="Ratios in dB scale")
  savefig(joinpath(@__DIR__,"output/db_scale")) # hide
end
