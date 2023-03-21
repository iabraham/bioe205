num=[1, 3];         % Numerator coefficients
den=[1, 2, 4, 0];   % Denominator coefficients
sys = tf(num, den); % Transfer function model
bodeplot(sys);      % Generate bodeplot
title("Final Bode Plot - Example 1")
grid on;