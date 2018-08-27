# Sage Math
# Numerical Analysis - Newton's Method

PI = 3.141592654

def f(x):
    #define function below
    return ln(x-1) + cos(x-1)

def f_der(x):
    #define f'(x) below
    return 1/(x-1) - sin(x-1)

def Newton(n, eps, p0):
    print "input : ", "n :",n, "eps :", eps,"\n"
    #p1 = g(p0)
    i = 1
    #error = b-a # initial: iter0
    while i <= n:
        p1 = p0 - f(p0)/f_der(p0)
        error = abs(p1-p0)
        print "iter",i," p0 :", p0," p1 :", p1, "  error :", error
        if (error < eps):
            return p1
        i = i + 1
        p0 = p1
    return p1

##############  Evaluate  ##############
#  define f(x) first for each problem  #
########################################

# PROBLEM 1 : f(x) = -x^3 - cos(x), f'(x) = -3*x^2 + sin(x)
#Newton(100, 0.0001, -1.0)

# PROBELM 2 : f(x) = x^3 - 2*x^2 - 5, f'(x) = 3*x^2 - 4*x
#Newton(100, 0.0001, 3.0)

# PROBLEM 3 : f(x) = x - cos(x), f'(x) = 1 + sin(x)
#Newton(100, 0.0001, 0.5)

# PROBLEM 4 : f(x) = ln(x-1) + cos(x-1), f'(x) = 1/(x-1) - sin(x-1)
Newton(100, 0.00001,1.3)