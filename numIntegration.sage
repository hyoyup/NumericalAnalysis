# Sage Math
# Numerical Analysis - Numerical Integration
# Hyoyup Chung Math557

import numpy # uniform sampling

def prob1(x):
	return ln(cos(x^2))+2

def prob2(x):
	return cos(ln(x)/(x^2+x))

def prob3(x):
	return sqrt(x+sqrt(ln(x))/(x-3))

def N_Midpoint(f,lower,upper,n):
	result = 0.0
	prevResult = 0.0
	h = (upper - lower)/ n
	for i in range(0,n):
		midpoint = lower + h/2.0 + h*i
		result += f(midpoint)*h
		prevResult = result
	return result

def Midpoint(f,lower,upper,eps):
	print "\nMidpoint Method Input : ", "a =",lower,"b =", upper, "eps =", eps
	curResult = 0.0
	prevResult = 0.0
	n = 1
	error = float("inf")
	while (error > eps):
		curResult = N_Midpoint(f,lower,upper,n)
		error = abs(curResult - prevResult)
		print "n:", n, "  error :", error
		prevResult = curResult
		n += 1
	print "Result: ",curResult
	return curResult

def N_Trapezoid(f,lower,upper,n):
	result = 0.0
	prevResult = 0.0
	h = (upper - lower)/ n
	a = lower
	b = a+h
	for i in range(0,n):
		result += (f(a)+f(b))*h/2.0
		prevResult = result
		a = b
		b = b + h
	return result

def Trapezoid(f,lower,upper,eps):
	print "\nTrapezoid Method Input : ", "a =",lower,"b =", upper, "eps =", eps
	curResult = 0.0
	prevResult = 0.0
	n = 1
	error = float("inf")
	while (error > eps):
		curResult = N_Trapezoid(f,lower,upper,n)
		error = abs(curResult - prevResult)
		print "n:", n, "  error :", error
		prevResult = curResult
		n += 1
	print "Result: ",curResult
	return curResult

def N_Simpsons(f,lower,upper,n):
	result = 0.0
	prevResult = 0.0
	h = (upper - lower)/ n
	a = lower
	b = a+h
	for i in range(0,n):
		midpoint = lower + h/2.0 + h*i
		result += (f(a)+4.0*f(midpoint)+f(b))*h/6.0
		prevResult = result
		a = b
		b = b + h
	return result

def Simpsons(f,lower,upper,eps):
	print "\nSimpson's Method Input : ", "a =",lower,"b =", upper, "eps =", eps
	curResult = 0.0
	prevResult = 0.0
	n = 1
	error = float("inf")
	while (error > eps):
		curResult = N_Simpsons(f,lower,upper,n)
		error = abs(curResult - prevResult)
		print "n:", n, "  error :", error
		prevResult = curResult
		n += 1
	print "Result: ",curResult
	return curResult

def MonteCarlo(f,a,b,c,d,eps,initialN,stepsize):
	print "\nMonteCarlo Method Input : ", "a =",a, "b =",b, "c =",c,"d =",d,"eps =", eps
	print "initial N =",initialN, "stepsize =", stepsize
	numTotalPoints = 0.0
	numPointsIn = 0.0
	#Initialize
	for i in range(0,initialN):
		numTotalPoints+=1.0
		x = numpy.random.uniform(a,b)
		y = numpy.random.uniform(c,d)
		if (y>0.0 and f(x)>=y):
			numPointsIn+=1.0

	curResult = (b-a)*(d-c)*numPointsIn/numTotalPoints
	prevResult = 0.0
	n = 1
	error = float("inf")
	while(error > eps):
		for i in range(0,stepsize):
			numTotalPoints+=1.0
			x = numpy.random.uniform(a,b)
			y = numpy.random.uniform(c,d)
			if (y>0.0 and f(x)>=y):
				numPointsIn+=1.0
		curResult = (b-a)*(d-c)*numPointsIn/numTotalPoints
		error = abs(curResult-prevResult)
		print "N :",numTotalPoints , "  error :", error
		prevResult = curResult
		n += 1
	print curResult
	return curResult

##############  Evaluate  ##############

# PROBLEM 1
# a = 0, b = 1, eps = 0.0001
print "###############################"
print "Problem1: f(x) = ln(cos(x^2))+2"
print "###############################"
Midpoint(prob1,0.0,1.0,0.0001)
Trapezoid(prob1,0.0,1.0,0.0001)
Simpsons(prob1,0.0,1.0,0.0001)
MonteCarlo(prob1,0.0,1.0,-1.0,3.0,0.0001,1000,100)

# PROBLEM 2
# a = 1, b = 2, eps = 0.0001
print "\n###############################"
print "Problem2: f(x) = cos(ln(x)/(x^2+x))"
print "###############################"
Midpoint(prob2,1.0,2.0,0.0001)
Trapezoid(prob2,1.0,2.0,0.0001)
Simpsons(prob2,1.0,2.0,0.0001)
MonteCarlo(prob2,1.0,2.0,-1.5,1.5,0.0001,1000,100)

# PROBLEM 3
# a = 1, b = 2, eps = 0.0001
print "\n###############################"
print "Problem2: f(x) = sqrt(x+sqrt(ln(x))/(x-3))"
print "###############################"
Midpoint(prob3,1.0,2.0,0.0001)
Trapezoid(prob3,1.0,2.0,0.0001)
Simpsons(prob3,1.0,2.0,0.0001)
MonteCarlo(prob3,1.0,2.0,-1.5,1.5,0.0001,1000,100)

print "Complete!"