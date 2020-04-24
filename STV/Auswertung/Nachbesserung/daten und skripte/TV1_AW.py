#!/usr/bin/env python3

import numpy as np

with open("TV2_100Messungen.utf8.dat") as f:
	A = np.loadtxt(f, dtype=int)
	kanale = A[:,0] # Erste Spalte
	anzahl = A[:,1] # Zweite Spalte

# Mittelwert
mit = np.dot(kanale, anzahl)/np.sum(anzahl)

# Standardabweichung
sab = np.sqrt((1/(np.sum(anzahl) - 1))*np.dot((kanale - mit)**2, anzahl))

print("Mittelwert: ", mit)
print("Standardabweichung: ", sab)