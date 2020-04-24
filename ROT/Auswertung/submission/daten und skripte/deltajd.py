#!/usr/bin/env python3
import numpy as np

# x. y, z
L      = np.array([5.115e-2, 7.315e-2, 10.250e-2])
deltaL = 0.005e-2
J 	   = np.array([3.95523e-3, 3.29182e-3, 2.04429e-3])
deltaJ = np.array([3.177e-5, 4.851e-5, 5.736e-5])

r = np.dot(L, L)

vecL2 = np.multiply(L, L)
vec1 = np.multiply(J, r - vecL2)

def Jd():
	return (1/r)*(np.dot(J, vecL2))

def deltaJd():
	return (1/r)*np.sqrt(((4*deltaL**2)/(r**2))*(np.dot(vec1, L))**2 + (np.dot(vecL2, deltaJ))**2)

print("J_d Wert\t", Jd())
print("Delta J_d\t", deltaJd())