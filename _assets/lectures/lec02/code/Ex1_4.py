import numpy as np  # hide
import matplotlib.pyplot as plt # hide

N = 20000                   # Number of data points
nu_bins = 40                # Number of bins

y = np.random.randn(1,N)                # Generate random Gaussian noise
ht, xout = np.histogram(y,nu_bins)      # Calculate histogram
ht = ht/max(ht)                         # Normalize histogram to 1.0

# Setup figure & subplots
fig, (top, bot) = plt.subplots(2,1, figsize=(8,6), constrained_layout=True)

# Plot as bar graph (use color)
top.bar(xout[:-1], ht, width=0.1, edgecolor='black', align='edge')
top.set_xlabel('x')
top.set_ylabel('P(x)')
top.set_ylim(0, 1.2)
top.set_title('Gaussian noise (randn)')

y = np.random.rand(1,N)                 # Generate uniform random samples
ht, xout = np.histogram(y,nu_bins)      # Calculate histogram
ht = ht/max(ht)                         # Normalize histogram to 1.0

# Plot as bar graph (use color)
# bot.hist(xout[:-1], xout, weights=ht, width=0.01, edgecolor='black')
bot.bar(xout[:-1], ht, width=0.01, edgecolor='black', align='edge')
bot.set_xlabel('x')
bot.set_ylabel('P(x)')
bot.set_ylim(0, 1.2)
bot.set_title('Uniform noise (rand)')

fig.savefig("output/Ex1_4.png")  # hide
