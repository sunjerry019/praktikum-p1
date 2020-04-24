#!/usr/bin/env python3

import numpy as np

def rj(l1, l2, l3, l4, r1, r2, r3, r4, r5):
	return np.sqrt((0.5)*((l1*r1**4 + l2*(r2**4-r1**4) + l3*(r3**4-r2**4+r5**4-r4**4) + l4*(r4**4-r3**4))/(l1*r1**2 + l2*(r2**2-r1**2) + l3*(r3**2-r2**2+r5**2-r4**2) + l4*(r4**2-r3**2))))

def parameterize(*args):
	return args

maxWert = 0
minWert = 100
step = 0.01

maxParams = []
minParams = []

for i1 in range(-5,6,2):
	for i2 in range(-5,6,2):
		for i3 in range(-5,6,2):
			for i4 in range(-5,6,2):
				for i5 in range(-5,6,2):
					for i6 in range(-5,6,2):
						for i7 in range(-5,6,2):
							for i8 in range(-5,6,2):
								for i9 in range(-5,6,2):
									currWert = rj(141.675 + i1*step, 63.275 + i2*step, 6.575 + i3*step, 2.025 + i4*step, 4.05 + i5*step, 6.525 + i6*step, 10.25 + i7*step, 67.85 + i8*step, 87.05 + i9*step)
									params = parameterize(141.675 + i1*step, 63.275 + i2*step, 6.575 + i3*step, 2.025 + i4*step, 4.05 + i5*step, 6.525 + i6*step, 10.25 + i7*step, 67.85 + i8*step, 87.05 + i9*step)

									if currWert > maxWert:
										maxWert = currWert
										maxParams = params
									if currWert < minWert:
										minWert = currWert
										minParams = params

print("Max Value\t", maxWert)
print("Max Params\t", maxParams)
print("Min Value\t", minWert)
print("Min Params\t", minParams)