clear 
numerator = [1, 0, 15];
denominator = fold(@conv, {[1,0,-3],[1,3],[1, 3]}); 
[num, roots, const] = residue(numerator, denominator)
