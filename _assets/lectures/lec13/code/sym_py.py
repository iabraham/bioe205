from sympy import symbols, apart

s = symbols('s')
numerator = s**2+15
denominator = ((s+3)**2)*(s**2-3)
frac = numerator / denominator
print(apart(frac))
