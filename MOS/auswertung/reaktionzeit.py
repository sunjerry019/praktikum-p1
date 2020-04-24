#!/usr/bin/env python3

import numpy as np

werte = np.loadtxt("reaktionzeit.dat",dtype=np.float64)

mw = np.mean(werte)
sa = np.sqrt((np.sum((werte - mw)**2))/(werte.size - 1))

print("Mittelwert:\t\t", mw)
print("Standardabweichung\t", sa)