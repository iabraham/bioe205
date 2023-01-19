# This is Julia code; it will not run in MATLAB/Python
using MAT, Plots, FFTW

filename = joinpath(@__DIR__,"eeg_data1.mat")
eeg = read(matopen(filename))["eeg"][:]
t0, tmax = 0, 15
fs = 100000/01875   # Sampling rate (Hz)
t = t0:1/fs:tmax

F = fftshift(fft(eeg))
freqs = fftshift(fftfreq(length(t), fs))
l = @layout [a [b
                c]]

time_domain = plot(t, eeg, title = "Time domain signal", label=false)
freq_mags = plot(freqs, abs.(F), title = "Magnitude spectrum", xlim=(0, 25),
		 xticks=0:5:25, label=false,legend=:top) 
freq_phase = plot(freqs, angle.(F), title = "Phase spectrum", xlim=(0, 25),
		  xticks=0:5:25, label=false,ylim=(-4,4)) 
plot(time_domain, freq_mags, freq_phase, layout=l, size=(800,400))
savefig(joinpath(@__DIR__,"output/eeg"))
