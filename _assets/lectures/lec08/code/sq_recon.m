N = 20
t = 0:0.01:5
y = zeros(size(t))
sum_indices = [[-1:-2:-N], [1:2:N]]

function y = kth_term(k, t)
	y = 2/(k*pi*1i)* exp(2*pi*k*1i.*t);
end

for i=1:length(sum_indices)
	k = sum_indices(i)
	y+= kth_term(k, t);
end

fig = plot(t, real(y));
