# proj3.py
# Numerical Analysis - Jacobi / Gauss-Seidel method

import re
import math
from copy import deepcopy

def norm(n,cur_B, next_B):
	newB = []
	res = 0.0
	for i in range(0,n):
		res += (cur_B[i]-next_B[i])**2.0
	return math.sqrt(res)

def PrintMatrix(n, mat_A):
	for i in range(0,n):
		print "\t",mat_A[i]

def Jacobi(n, mat_A, mat_B, x0, eps):
	print "Running Jacobi..."
	print "Matrix A: "
	PrintMatrix(n,mat_A)
	print "B = ",mat_B
	print "Initial x: ",x0
	print "epsilon: ",eps
	X_cur = x0[:]
	X_next = mat_B[:]
	iterNum = 1
	while(True):
		for i in range(0,n):
			for j in range(0,n):
				if (j!=i):
					X_next[i] -= mat_A[i][j]*X_cur[j]
			X_next[i] /= mat_A[i][i]
		error = norm(n,X_cur,X_next)
		print "iter ",iterNum," error:",error,"\n   x_k+1:",X_next 
		if (error<eps):
			return X_next
		X_cur = X_next[:]
		X_next = mat_B[:]
		iterNum+=1

def GaussSeidel(n, mat_A, mat_B, x0, eps):
	print "Running Gauss-Seidel..."
	print "Matrix A: "
	PrintMatrix(n,mat_A)
	print "B = ",mat_B
	print "Initial x: ",x0
	print "epsilon: ",eps
	X_cur = x0[:]
	X_next = mat_B[:]
	iterNum = 1
	while(True):
		for i in range(0,n):
			for j in range(0,n):
				if (j<i):
					X_next[i] -= mat_A[i][j]*X_next[j]
				if (j>i):
					X_next[i] -= mat_A[i][j]*X_cur[j]
			X_next[i] /= mat_A[i][i]
		error = norm(n,X_cur,X_next)
		print "iter ",iterNum," error:",error,"\n   x_k+1:",X_next 
		if (error<eps):
			return X_next
		X_cur = X_next[:]
		X_next = mat_B[:]
		iterNum+=1


# main:
if __name__ == "__main__":
	file = open('input.txt', 'r')
	n = int(file.readline()) # dimension of matrix(n x n) system
	# Ax = B
	A = [] # n x n matrix A
	B = [] # B
	for i in range(0,n):
		line = file.readline()
		splittedLine = re.split(' ; |',line)
		a_row = re.split(' ',splittedLine[0])
		a_row = [float(j) for j in a_row]
		A.append(a_row)
		b = float(splittedLine[1])
		B.append(b)

	#EVALUATE
	eps = 0.0001
	x_0 = [0]*n
	
	#Jacobi Method
	Jacobi(n,A,B,x_0,eps)

	print "\n\n\n"

	#Gauss-Seidel Method
	GaussSeidel(n,A,B,x_0,eps)