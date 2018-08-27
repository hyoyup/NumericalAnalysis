# Sage Math
# Numerical Analysis - Fixed Point Method

PI = 3.141592654

def g(x):
    #define function below
    return cos(x)

def Fixedpoint(a, b, eps, p0):
    print "input : ", "a :",a,"b :", b, "eps :", eps,"\n"
    p1 = g(p0)
    error = b-a # initial: iter0
    n = 1
    while error > eps:
        p0 = p1
        p1 = g(p0)
        error = abs(p1-p0)
        print "iter",n," p0 :", p0," p1 :", p1, "  error :", error
        n = n + 1
    return p1

##############  Evaluate  ##############
#  define g(x) first for each problem  #
########################################

# PROBLEM 6 : g(x) = (3*x^2 + 3)^(1/4)
#Fixedpoint(1.0, 2.0, 0.01, 1.0)

# PROBLEM 7 : g(x) = PI + 0.5*sin(x/2)
#Fixedpoint(0.0, 2*PI, 0.01, 3.0)

# PROBLEM 8 : g(x) = 5/(x^2) + 2
#Fixedpoint(2.5, 3.0, 0.0001, 3.0)

# PROBLEM 9 : g(x) = cosx
Fixedpoint(0.0, 1.0, 0.0001, 1.0)