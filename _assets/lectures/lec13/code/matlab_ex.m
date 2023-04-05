clear 
numerator = [3, 1];
denominator1 = fold(@conv, {[2,-1],[1,2],[1, 2]}); 
[num, roots, const] = residue(numerator, denominator1)

% If the fold function does not work then that single line above 
% is equivalent to the following:

den_factors = {[2,-1],[1,2],[1, 2]};
denominator2 = [1];
for i=1:length(den_factors)
    denominator2 = conv(denominator2, den_factors{i});
end