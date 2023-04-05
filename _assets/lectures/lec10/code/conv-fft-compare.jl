# This is Julia code; it will not run in MATLAB/Python
using FFTW, Waveforms, DSP


local t = 0:(1/160):1
h(t) = 5*exp(-5t)*sin.(100*t)
x(t) = trianglewave.(20*t-π/2)
p1 = plot(t, h.(t), title="Impulse response", label=false)
p2 = plot(t, x.(t), title="Input to system", label=false)
yb(t) = conv(x.(t), h.(t))
p3 = plot(t,yb(t)[1:length(t)], title="Output via convolution", label=false)
r(t) = ifft(fft(h.(t)) .* fft(x.(t))) 
p4 = plot(t, real.(r(t)), title="Output via FFT", label=false)
local pp = plot(p1, p2 , p3, p4, layout=(2,2), xlim=(0,1))
savefig(pp, joinpath(@__DIR__, "output/conv-fft-compare"))
