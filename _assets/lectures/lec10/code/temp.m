% Pulse widths 
pws = [20, 10, 2, 1];

% Sampling frequency 
fs = 1000;

% Number of samples (power of 2 faster for DFT)
N_samples = 1024;

% The time vector 
t = (0:(N_samples-1))/fs;

% DFT for N_samples gives frequencies as ... 
freqs = fftfreqs(N_samples, fs);

% A function to take fft, shift it to zero freq at the center
% take absolute value 
dft_mag = @(x) abs(fftshift(fft(x)));

% A function to normalize a vector so max is 1
normalize = @(x) x/max(x); 

% A function to generate a pulse of width w that is
% N_samples long 
pulse = @(w) [ones(1, w), ...
    zeros(1, N_samples - w)];

for i=1:length(pws)
    current_pulse = pulse(pws(i));
    mag = dft_mag(current_pulse);
    n_mag = normalize(mag);
    plot(fftshift(freqs), n_mag);
    hold on;
end

title("DFT of different pulses")
xlabel("Frequency (Hz)")
ylabel("Normalized DFT")
ylim([0, 1.1])
xlim([0, Inf])
legend(arrayfun(@num2str, pws, UniformOutput=false));


function [freqs] = fftfreqs(n, fs)
if mod(n, 2) == 0
    freqs = [0:floor(n/2)-1, -floor(n/2):-1]  * fs/n;
else
    freqs = [0:floor((n-1)/2), floor(-(n-1)/2):-1]  * fs/n;
end
end

