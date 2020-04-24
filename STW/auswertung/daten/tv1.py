#!/usr/bin/env python3

import numpy as np

x12 = np.array([95.25, 94.00, 95.50, 94.50])
x34 = np.array([230.00, 230.00, 230.26, 228.75, 229.75])

def sab(arr, mw):
	return np.sqrt((np.sum((arr - mw)**2))/(arr.size - 1))

x12mw = np.mean(x12)
x12ab = sab(x12, x12mw)
x34mw = np.mean(x34)
x34ab = sab(x34, x34mw)

print("x12 = ", x12mw, " +- ", x12ab)
print("x34 = ", x34mw, " +- ", x34ab)