function [rxy lags] = crosscorr(x,y)
	lx = length(x);		% Assume both the same length
	maxlags = 2*lx - 1;     % Compute maxlags from data length
	x = [zeros(1,lx-1) x zeros(1,lx-1)]; % Zero pad signal x
	for k = 1:maxlags
    		x1 = x(k:k+lx-1);         % Shift signal
    		rxy(k) = mean(x1.*y);     % Correlation (Eq. 2.30) 
    		lags(k) = k - lx;         % Compute lags
	end
end
