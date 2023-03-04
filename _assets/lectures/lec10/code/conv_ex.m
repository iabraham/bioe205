x=1:6
y=1:5

default = conv(x, y)
default_flip = conv(y, x)

valid = conv(x, y, 'valid')
valid_flip = conv(x, y, 'valid')

same = conv(x, y, 'same')
same_flip = conv(y, x, 'same')