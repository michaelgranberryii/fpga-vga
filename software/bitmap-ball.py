from math import pi, sqrt, ceil

radius = 10

for i in range(-radius, radius+1):
    x_cord = ceil(sqrt(radius**2 - i**2))
    print("{:^{}}".format("".join("1" for _ in range (2*x_cord)), 2*radius))