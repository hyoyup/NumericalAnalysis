# Sage Math
# Numerical Analysis - Bisection Method

def f(x):
    #define function below
    return x^3 + x - 4

def Bisection(lower, upper, eps):
    a = lower
    b = upper
    print "input : ", "a :",a,"b :", b, "eps :", eps,"\n"
    error = (upper-lower) # initial: iter0
    n = 1
    while error > eps:
        p = (a+b)/2.0
        error = (upper-lower)/2^n
        print "iter",n," p :", p, "  error :", error, "  a :", a, " b :", b
        if f(a)*f(p) < 0.0:
            b = p
        else:
            a = p
        n = n + 1
    return p

def nBisection(lower, upper, n):
    a = lower
    b = upper
    print "input : ", "a :",a,"b :", b, "n :", n,"\n"
    for i in range(0, n):
        err = (upper-lower)/2.0^(i+1)
        p = (a+b)/2.0
        print "iter",i+1," p :", p, "  error :", err, "  a :", a, " b :", b
        if f(a)*f(p) < 0.0:
            b = p
        else:
            a = p
    return p

##############  Evaluate  ##############
#  define f(x) first for each problem  #
########################################

# PROBLEM 1 : f(x) = x - cos(x)^2
#nBisection(0.0, 1.0, 3)

# PROBLEM 2 : f(x) = x^3 - 7*x^2 + 14*x - 6
#Bisection(0.0, 1.0, 0.01)

# PROBLEM 3 : f(x) = x - 2^(-x)
#Bisection(0.0, 1.0, 0.00001)

# PROBLEM 4 : f(x) = x^2-5
#Bisection(2.0, 3.0, 0.0001)

# PROBLEM 5 : f(x) = x^3 + x - 4
Bisection(1.0, 4.0, 0.001)