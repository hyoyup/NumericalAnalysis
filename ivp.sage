# \ivp.sage
# Sage Math
# Numerical Analysis - Differential Equation
# Hyoyup Chung

# INPUT: 
#	problem function f, initial t_0, y_0, step size h, number of iter n
def Euler(f, t_0, y_0, h, n):
	print "Euler's method evaluating... step size:",h, "n =",n
	cur_t = t_0
	cur_y = y_0
	iterNum = 1;
	graph = plot([],title="Euler Method")
	graph += circle((cur_t,cur_y),0.01, color='blue')
	while(iterNum <= n):
		cur_t += h
		cur_y += h/2.0*f(cur_t,cur_y)
		print "iter",iterNum,"t:",cur_t,"y",cur_y
		graph += circle((cur_t,cur_y),0.01, color='blue')
		iterNum += 1

	show(graph)
	return f(cur_t,cur_y)

# INPUT: 
#	system function f_sys, initial t_0, z_0, step size h, number of iter n
# NOTE:
#	z_0: assumed vector([x_0, y_0]) for graph, but if no plotting required
#		 any system size will work
def Euler_System(f_sys, t_0, z_0, h, n):
	print "Euler's method for system evaluating... step size:",h, "n =",n
	cur_t = t_0
	cur_z = z_0
	iterNum = 1;
	graph = plot([],title="Euler Method For System")
	graph += circle((f_sys(cur_t,cur_z)[0],f_sys(cur_t,cur_z)[1]),0.01, color='blue')
	while(iterNum <= n):
		cur_t += h
		cur_z += h/2.0*f_sys(cur_t,cur_z)
		print "iter",iterNum,"t:",cur_t,"z",cur_z
		graph += circle((f_sys(cur_t,cur_z)[0],f_sys(cur_t,cur_z)[1]),0.01, color='blue')
		iterNum += 1

	show(graph)
	return f_sys(cur_t,cur_z)

# INPUT: 
#	second order function f_sec, initial t_0, z_0, step size h, number of iter n
# NOTE:
#	z_0: assumed vector([x_0, y_0]) for graph, but if no plotting required
#		 any system size will work
def Euler_Sec(f_sec, t_0, z_0, h, n):
	print "Euler's method for second order evaluating... step size:",h, "n =",n
	cur_t = t_0
	cur_z = z_0
	iterNum = 1;
	graph = plot([],title="Euler Method For Second Order")
	graph += circle((cur_t,f_sec(cur_t,cur_z)[1]),0.01, color='blue')
	while(iterNum <= n):
		cur_t += h
		cur_z += h/2.0*f_sec(cur_t,cur_z)
		print "iter",iterNum,"t:",cur_t,"z",cur_z
		graph += circle((cur_t,f_sec(cur_t,cur_z)[1]),0.01, color='blue')
		iterNum += 1

	show(graph)
	return f_sec(cur_t,cur_z)

# INPUT: 
#	problem function f, initial t_0, y_0, step size h, number of iter n
def Midpoint(f, t_0, y_0, h, n):
	print "Midpoint method evaluating... step size:",h, "n =",n
	cur_t = t_0
	cur_y = y_0
	iterNum = 1;
	graph = plot([],title="Midpoint Method")
	graph += circle((cur_t,cur_y),0.01, color='blue')
	while(iterNum <= n):
		K1 = f(cur_t,cur_y)
		cur_y = cur_y + h*f(cur_t+h/2.0, cur_y+h/2.0*K1)
		cur_t += h
		print "iter",iterNum,"t:",cur_t,"y",cur_y
		graph += circle((cur_t,cur_y),0.01, color='blue')
		iterNum += 1
	
	show(graph)
	return f(cur_t,cur_y)

# INPUT: 
#	sysyem function f_sys, initial t_0, z_0, step size h, number of iter n
# NOTE:
#	z_0: vector([x_0, y_0])
def Midpoint_System(f_sys, t_0, z_0, h, n):
	print "Midpoint method for system evaluating... step size:",h, "n =",n
	cur_t = t_0
	cur_z = z_0
	iterNum = 1;
	graph = plot([],title="Midpoint Method For System")
	graph += circle((f_sys(cur_t,cur_z)[0],f_sys(cur_t,cur_z)[1]),0.01, color='blue')
	while(iterNum <= n):
		K1 = f_sys(cur_t,cur_z)
		cur_z = cur_z + h*f_sys(cur_t+h/2.0, cur_z+h/2.0*K1)
		cur_t += h
		print "iter",iterNum,"t:",cur_t,"z",cur_z
		graph += circle((f_sys(cur_t,cur_z)[0],f_sys(cur_t,cur_z)[1]),0.01, color='blue')
		iterNum += 1
	
	show(graph)
	return f_sys(cur_t,cur_z)

# INPUT: 
#	second order function f_sec, initial t_0, z_0, step size h, number of iter n
# NOTE:
#	z_0: vector([x_0, y_0])
def Midpoint_Sec(f_sec, t_0, z_0, h, n):
	print "Midpoint method for second order evaluating... step size:",h, "n =",n
	cur_t = t_0
	cur_z = z_0
	iterNum = 1;
	graph = plot([],title="Midpoint Method For Second Order")
	graph += circle((cur_t,f_sec(cur_t,cur_z)[1]),0.01, color='blue')
	while(iterNum <= n):
		K1 = f_sec(cur_t,cur_z)
		cur_z = cur_z + h*f_sec(cur_t+h/2.0, cur_z+h/2.0*K1)
		cur_t += h
		print "iter",iterNum,"t:",cur_t,"z",cur_z
		graph += circle((cur_t,f_sec(cur_t,cur_z)[1]),0.01, color='blue')
		iterNum += 1
	
	show(graph)
	return f_sec(cur_t,cur_z)

# INPUT: 
#	problem function f, initial t_0, y_0, step size h, number of iter n
def ModifiedEuler(f, t_0, y_0, h, n):
	print "Modified Euler's method evaluating... step size:",h, "n =",n
	cur_t = t_0
	cur_y = y_0
	iterNum = 1;
	graph = plot([],title="Modified Euler Method")
	graph += circle((cur_t,cur_y),0.01, color='blue')
	while(iterNum <= n):
		K1 = f(cur_t,cur_y)
		K2 = f(cur_t+h, cur_y+h*K1)
		cur_t += h
		cur_y += h/2.0*(K1+K2)
		print "iter",iterNum,"t:",cur_t,"y",cur_y
		graph += circle((cur_t,cur_y),0.01, color='blue')
		iterNum += 1
	
	show(graph)
	return f(cur_t,cur_y)

# INPUT: 
#	system function f_sys, initial t_0, y_0, step size h, number of iter n
# NOTE:
#	z_0: vector([x_0, y_0])
def ModifiedEuler_Sytem(f_sys, t_0, z_0, h, n):
	print "Modified Euler's method for system evaluating... step size:",h, "n =",n
	cur_t = t_0
	cur_z = z_0
	iterNum = 1;
	graph = plot([],title="Modified Euler Method For System")
	graph += circle((f_sys(cur_t,cur_z)[0],f_sys(cur_t,cur_z)[1]),0.01, color='blue')
	while(iterNum <= n):
		K1 = f_sys(cur_t,cur_z)
		K2 = f_sys(cur_t+h, cur_z+h*K1)
		cur_t += h
		cur_z += h/2.0*(K1+K2)
		print "iter",iterNum,"t:",cur_t,"z",cur_z
		graph += circle((f_sys(cur_t,cur_z)[0],f_sys(cur_t,cur_z)[1]),0.01, color='blue')
		iterNum += 1
	
	show(graph)
	return f_sys(cur_t,cur_z)

# INPUT: 
#	second order function f_sec, initial t_0, y_0, step size h, number of iter n
# NOTE:
#	z_0: vector([x_0, y_0])
def ModifiedEuler_Sec(f_sec, t_0, z_0, h, n):
	print "Modified Euler's method for second order evaluating... step size:",h, "n =",n
	cur_t = t_0
	cur_z = z_0
	iterNum = 1;
	graph = plot([],title="Modified Euler Method For Second Order")
	graph += circle((cur_t,f_sec(cur_t,cur_z)[1]),0.01, color='blue')
	while(iterNum <= n):
		K1 = f_sec(cur_t,cur_z)
		K2 = f_sec(cur_t+h, cur_z+h*K1)
		cur_t += h
		cur_z += h/2.0*(K1+K2)
		print "iter",iterNum,"t:",cur_t,"z",cur_z
		graph += circle((cur_t,f_sec(cur_t,cur_z)[1]),0.01, color='blue')
		iterNum += 1
	
	show(graph)
	return f_sec(cur_t,cur_z)

# INPUT: 
#	problem function f, initial t_0, y_0, step size h, number of iter n
def RungeKutta(f, t_0, y_0, h, n):
	print "Runge-Kutta method evaluating... step size:",h, "n =",n
	cur_t = t_0
	cur_y = y_0
	iterNum = 1;
	graph = plot([],title="Runge-Kutta Method")
	graph += circle((cur_t,cur_y),0.01, color='blue')
	while(iterNum <= n):
		K1 = f(cur_t,cur_y)
		K2 = f(cur_t+h/2.0, cur_y+h/2.0*K1)
		K3 = f(cur_t+h/2.0, cur_y+h/2.0*K2)
		K4 = f(cur_t+h, cur_y+h*K3)
		cur_t += h
		cur_y = cur_y + h/6.0*(K1+2*K2+2*K3+K4)
		print "iter",iterNum,"t:",cur_t,"y",cur_y
		graph += circle((cur_t,cur_y),0.01, color='blue')
		iterNum += 1
	
	show(graph)
	return f(cur_t,cur_y)

# INPUT: 
#	sysyem function f_sys, initial t_0, y_0, step size h, number of iter n
# NOTE:
#	z_0: vector([x_0, y_0])
def RungeKutta_System(f_sys, t_0, z_0, h, n):
	print "Runge-Kutta method for system evaluating... step size:",h, "n =",n
	cur_t = t_0
	cur_z = z_0
	iterNum = 1;
	graph = plot([],title="Runge-Kutta Method For System")
	graph += circle((f_sys(cur_t,cur_z)[0],f_sys(cur_t,cur_z)[1]),0.01, color='blue')
	while(iterNum <= n):
		K1 = f_sys(cur_t,cur_z)
		K2 = f_sys(cur_t+h/2.0, cur_z+h/2.0*K1)
		K3 = f_sys(cur_t+h/2.0, cur_z+h/2.0*K2)
		K4 = f_sys(cur_t+h, cur_z+h*K3)
		cur_t += h
		cur_z = cur_z + h/6.0*(K1+2*K2+2*K3+K4)
		print "iter",iterNum,"t:",cur_t,"z",cur_z
		graph += circle((f_sys(cur_t,cur_z)[0],f_sys(cur_t,cur_z)[1]),0.01, color='blue')
		iterNum += 1
	
	show(graph)
	return f_sys(cur_t,cur_z)

# INPUT: 
#	second order function f_sec, initial t_0, y_0, step size h, number of iter n
# NOTE:
#	z_0: vector([x_0, y_0])
def RungeKutta_Sec(f_sec, t_0, z_0, h, n):
	print "Runge-Kutta method for second order evaluating... step size:",h, "n =",n
	cur_t = t_0
	cur_z = z_0
	iterNum = 1;
	graph = plot([],title="Runge-Kutta Method For Second Order")
	graph += circle((cur_t,f_sec(cur_t,cur_z)[1]),0.01, color='blue')
	while(iterNum <= n):
		K1 = f_sec(cur_t,cur_z)
		K2 = f_sec(cur_t+h/2.0, cur_z+h/2.0*K1)
		K3 = f_sec(cur_t+h/2.0, cur_z+h/2.0*K2)
		K4 = f_sec(cur_t+h, cur_z+h*K3)
		cur_t += h
		cur_z = cur_z + h/6.0*(K1+2*K2+2*K3+K4)
		print "iter",iterNum,"t:",cur_t,"z",cur_z
		graph += circle((cur_t,f_sec(cur_t,cur_z)[1]),0.01, color='blue')
		iterNum += 1
	
	show(graph)
	return f_sec(cur_t,cur_z)


#######################
# One-Dimensional ODE #
#######################
def func_1D(t, y):
	# define equation below
	return (5*t^2-y)/(e^(t+y))

def OneDim_ODE(f, t_0, y_0, h, n):
	Euler(f,t_0, y_0, h, n)
	Midpoint(f,t_0, y_0, h, n)
	ModifiedEuler(f,t_0, y_0, h, n)
	RungeKutta(f,t_0, y_0, h, n)
	return 0

##################
#	System ODE	 #
##################
# z = [x, y]
def func_2D(t, z):
	# define system below
	xp = t - z[0] + z[1]	 # x' = t - x + y
	yp = 2*t - 2*z[0] - z[1] # y' = 2t - 2x - y
	return vector([xp,yp])

def TwoDim_ODE(f_sys, t_0, z_0, h, n):
	Euler_System(f_sys,t_0, z_0, h, n)
	Midpoint_System(f_sys,t_0, z_0, h, n)
	ModifiedEuler_Sytem(f_sys,t_0, z_0, h, n)
	RungeKutta_System(f_sys,t_0, z_0, h, n)
	return 0

#########################
# 	Second Order ODE	#
#########################
# z = [y, v]
def func_Sec(t, z):
	# define second order below
	yp = z[1]			   # y' = v
	ypp = cos(t)-z[0]-z[1] # v' = cos(t)-y-v
	return vector([yp,ypp])

def SecOrder_ODE(f_sec, t_0, z_0, h, n):
	Euler_Sec(f_sec,t_0, z_0, h, n)
	Midpoint_Sec(f_sec,t_0, z_0, h, n)
	ModifiedEuler_Sec(f_sec,t_0, z_0, h, n)
	RungeKutta_Sec(f_sec,t_0, z_0, h, n)
	return 0

# EVALUATE
OneDim_ODE(func_1D, 0.0, 1.0, 0.1, 50)
print "\n\n"
TwoDim_ODE(func_2D, 0.0, vector([1.0,2.0]), 0.1, 50)
print "\n\n"
SecOrder_ODE(func_Sec, 0.0, vector([1.0,0.0]), 0.1, 50)