# This is Julia code; it will not run in MATLAB/Python
using MAT, Plots, FFTW, Plots.Measures

filename = joinpath(@__DIR__,"eeg_data1.mat")
eeg = read(matopen(filename))["eeg"][:]
t0, tmax = 0, 15
fs = 100000/01875   # Sampling rate (Hz)
t = t0:1/fs:tmax

F = fftshift(fft(eeg))
freqs = fftshift(fftfreq(length(t), fs))
Fabs, Fphi = abs.(F), angle.(F)

l = @layout [a [b
                c]]
N = 502
time_domain = plot(t, eeg, title = "Time domain signal", label=false, xlabel="Time units")
freq_mags = plot(freqs, Fabs, title = "Magnitude spectrum", xlim=(0, 25),
		 xticks=0:5:25, label=false,legend=:top, xlabel="Frequency units")

freq_mags = vline!(freq_mags, [freqs[N]], legend=false)
fres_mags = hline!(freq_mags, [Fabs[N]], legend=false)
fres_mags = scatter!(freq_mags, [freqs[N]], [Fabs[N]], legend=false)


freq_phase = plot(freqs, Fphi, title = "Phase spectrum", xlim=(0, 25),
		  xticks=0:5:25, label=false,ylim=(-4,4), xlabel="Frequency units")
fres_phase = vline!(freq_phase, [freqs[N]], legend=false)
fres_phase = hline!(freq_phase, [Fphi[N]], legend=false)
fres_phase = scatter!(freq_phase, [freqs[N]], [Fphi[N]], legend=false)

plot(time_domain, freq_mags, freq_phase, layout=l, size=(1000, 500), bottom_margin=5mm)
savefig(joinpath(@__DIR__,"output/eeg"))
