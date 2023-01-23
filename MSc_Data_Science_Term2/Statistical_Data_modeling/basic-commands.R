###############################################################################
#
# Some basic R commands to get you used to what the R language can do.
# 
# Try and understand what each command is doing. If you don't
# understand a command then get used to checking its help page by
# typing help(command) or ?command, replacing 'command' with the
# name of the command you're unsure about. Be adventurous and try
# variations on the commands to see how they work.
#

###############################################################################

# 1. Some fundamentals

# Everything in a line that follows a hash symbol (#) is interpreted
# by R as a comment and is not run as a command. This provides a way
# of annotating commands to remind us what they are intended to do.

date()       # Gives the current date and time

help.start() # Start up R help in your browser

# Don't do the next one unless you want to quit...

q()          # Quit R - saving the workspace saves any objects you have created

###############################################################################

# 2. Basic arithmetic

# These values aren't stored in an object so just print out...

23+7
6^2
exp(1)

# Store data in named scalar objects so that you can use them...

e=exp(1)     # Puts 2.718282 in a "numeric" object called e
e	     # Print out e to see what it looks like
y=log(e)     # Using the object to calculate a new object
y	     # Print out y
y=y^2	     # Overwrite y with the square of y
y	     # See what value y has now

ls()	     # Lists all objects that you have created
rm(e,y)	     # Removes objects e and y

# Making named vector objects

fib=c(1,1,2,3,5,8,13)	# The first 7 Fibonacci numbers: the concatenate
			# function 'c' just puts things together in a vector
fib			# See what fib looks like (useful reality check!)
fib=c(fib,21)		# Adding another element to the end of a vector

x=1:10			# Make the vector x=(1,2,3,4,...,10)
y=seq(1,10,by=1)	# Another way to do the same thing
z=seq(1,6,by=2)		# Make vector z=(1,3,5) (Check by typing z in console!)

xy=x*y-y   		# Vector arithmetic (on each element separately)
xy			# Is it what you think it should be? 

# Note: you can have whatever names you like but R is case sensitive
# so yY, Yy, and yy can all be different! This also applies to names
# for functions so, for example, exp(1) will work but Exp(1) won't be
# recognised.

###############################################################################

# 3. Some basic functions on vectors

length(fib)	# Length of the vector, i.e. sample size
summary(fib)	# Statistical summary of the sample

min(fib)	# Smallest value in fib
max(fib)	# Largest value in fib
which.max(fib)	# Which element of fib is the largest value?
range(fib)	# Give min and max of fib as a 2-vector
?range		# Look at help on range command
sum(fib)	# Sum of all the elements in fib
prod(fib)	# Product of all the elements in fib
mean(fib)	# Mean of fib elements, i.e. sum(fib)/length(fib)
median(fib)	# Median (middle value) of fib
IQR(fib)	# Interquartile range of fib
sd(fib)		# Standard deviation of fib
var(fib)	# Variance of fib

# Look at the help for some more of the last few commands (e.g. ?mean)
# to get used to R help pages. Some of the content of the pages will
# mean little to you at the moment, but you should be able to pick out
# some helpful pieces of information about what the functions do and
# how to use them.

# Extraction of elements from an object (R is very good at this!)

fib[3]		# Extract 3rd element of fib
fibs=fib[2:5]	# Extract elements 2-5 of fib and put in fibs
fib[c(1,5)]	# Extract elements 1 and 5 from fib
fib>5		# Make a logical vector based on this inequality
fib[fib>5]	# Extract elements of fib that are greater than 5
fib[-2]		# Extract all elements of fib except the 2nd one
fib[6]=NA	# Replace the 6th element of fib with a missing value, NA

# Note: NA is a special constant in R that means 'Not Available' and
# is typically used to indicate when some values in a data set are
# missing. Some R commands still work when there are missing data, but
# you should check the help page of the command if you are unsure
# exactly how the missing data have been treated.

###############################################################################

# 4. Some basic exploratory data analysis

randy=runif(30)     # Simulate 30 random numbers from the uniform distribution Uni(0,1)

randy		    # Look at the data object (always a good idea!)
plot(randy)	    # Plot the elements of randy in sequence

# Robust summary

boxplot(randy)	    # Boxplot of the data
summary(randy)	    # Statistical summary of the data
n=length(randy)	    # Sample size (always a useful statistic to report!)

# Histograms

hist(randy)			# Histogram of the data
hist(randy,breaks=10)		# More detail but more sampling variation
hist(randy,breaks=seq(0,1,0.1))	# Bin breaks every 0.1

# Cumulative distribution function

ord=sort(randy)	     # Order statistics (randy sorted into increasing value)
plot(1:n,ord)	     # Plot of the order statistics
ran=rank(randy)	     # Ranks of data (i.e. where the values come once sorted)
plot(1:n,ran)	     # Plot of the ranks
plot(randy,ran/n)    # Plot of the empirical cumulative distribution
plot(ord,(1:n)/n)    # Same! (Think about why!)
