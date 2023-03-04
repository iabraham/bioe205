N = 20
t = 0:0.01:5
y = zeros(size(t))
sum_indices = [[-1:-2:-N], [1:2:N]]

for i=1:length(sum_indices)
	k = sum_indices(i)
	y = y + kth_term(k, t);
end

plot(t, real(y));

function y = kth_term(k, t)
	y = 2/(k*pi*1i)* exp(2*pi*k*1i.*t);
end
