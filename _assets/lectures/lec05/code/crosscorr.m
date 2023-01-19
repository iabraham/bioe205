function [rxy lags] = crosscorr(x,y)
% Function to perform cross correlation similar to MATLABs xcorr
% This version assumes x and y are vectors of the same length
% Assumes maxlags = 2N -1 
% Inputs
%   x       signal for cross correlation
%   y       signal for cross correlation
% Outputs
%   rxy     cross correlation function
%   lags    shifts corresponding to rxy

lx = length(x);			% Get length of one signal (assume both the same length)
maxlags = 2*lx - 1;     	% Compute maxlags from data length
x = [zeros(lx-1,1); x(:); zeros(lx-1,1)]; % Zero pad signal x
for k = 1:maxlags
    x1 = x(k:k+lx-1);         	% Shift signal
    rxy(k) = mean(x1.*y(:));    % Correlation (Eq. 2.30) 
    lags(k) = k - lx;         	% Compute lags (useful for plotting)
end
