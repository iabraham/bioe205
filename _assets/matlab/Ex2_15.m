% Example 2.15 Find the correlation between the EEG signal 
%   and sinusoids ranging from 1 to 40 Hz in 1.0 Hz increments.  

clear all; close all;
load eeg_data1;		    % hide
N = length(eeg);            % Number of points
fs = 50;                    % Sampling frequency of data
f = (1:.5:25);              % Frequency of reference signals
t = (0:N-1)/fs;             % Time vector from 0 (approx.) to 2 sec.
for k = 1:length(f)
    x = cos(2*pi*f(k)*t); 	% Generate reference signal
    rxy = crosscorr(x,eeg);     % Compute crosscorreltion
    max_corr(k)= max(rxy);      % Find maximum correlation
    rxy_M = xcorr(x,eeg,'biased');     % Find crosscorrelation MATLAB
    max_corr_M(k) = max(rxy_M);    % MATLAB's max correlation 
end
plot(f,max_corr,'k'); hold on;
plot(f,max_corr_M,'*k');
xlabel('Reference Signal Frequency (Hz)','FontSize',14);
ylabel('Max Correlation','FontSize',14);

