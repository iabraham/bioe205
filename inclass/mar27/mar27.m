% This file only shows the very last exercise
% Solving Problem 2 from Homework 7

top = tf([1], [1, 0]);
forward = parallel(top, 5);
lower = tf([1, 0], [1]);

sys = feedback(forward, lower);
t = linspace(0, 2*pi, 100);
x = 5*cos(5*t-pi/6);
out = lsim(sys, x, t)

% syms s;
% ssym_num = poly2sym(cell2mat(sys.Numerator), s);
% ssym_den = poly2sym(cell2mat(sys.Denominator), s);
% 
% sys_sym = ssym_num / ssym_den;
% sys_at5 = subs(sys_sym, 's', 1j*5);
% 
% M = abs(sys_at5);
% phi = angle(sys_at5);
