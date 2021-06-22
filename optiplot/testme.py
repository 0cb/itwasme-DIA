#!/usr/bin/python3
#===========================================================================#
#=									   =#
#   Filename:	    boxopt.py
#   Version:	    1.0
#=									   =#
#   Description:    number of squares of max area in rectangle
#                   https://www.geeksforgeeks.org/number-of-squares-of-maximum-area-in-a-rectangle/
#
#=  Author:	    0cb - Christian Bowman				   =#
#   Creation:	    2019-08-01 16:41
#   Updated:	    
#=									   =#
#===========================================================================#


# Python3 code for calculating  
# the number of squares 

# Recursive function to 
# return gcd of a and b 
def __gcd(a, b):

    # Everything divides 0  
    if (a == 0 or b == 0):
        return 0;

    # base case 
    if (a == b):
        return a;

    # a is greater 
    if (a > b):
        return __gcd(a - b, b);
    return __gcd(a, b - a);

# Function to find  
# number of squares 
def NumberOfSquares(x, y):

    # Here in built PHP 
    # gcd function is used 
    s = __gcd(x, y);

    ans = (x * y) / (s * s);

    return int(ans);

# Driver Code 

#  __(2019-08-01 16:41)__ make this take user input
m = 60;
n = 90;
#--------------- skeleton ---------------#

#m1=arg1+1.5
#m2=arg1+2.0
#n1=arg2+1.5
#n2=arg2+2.0

# Call the function 
# NumberOfSquares 
print(NumberOfSquares(m, n));

# This code is contributed  
# by mit 


#  TODO: spit out diff values <19-08-01, cb> # 
#  run opt using m|n +1.5(ft); m|n +2.0(ft)
#  output max num plots
