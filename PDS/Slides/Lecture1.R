                                        # Getting onto the steep end of the R learning curve 
## Applied Statistical Programming (Spring 2018)
## Author: Jacob Montgomery

#################################################
## Day 1: What the ...?
#################################################

##1.1: Install R
 ## http://cran.r-project.org/bin/
 ## works on all platforms
 ## Unless you are compiling your own software, you will always want 'binary' distributions of software.

##1.2 Basics
 ## It is possible to do some things using the menus, but we will mostly use command line entry.
 ## We will also create scripts (such as this one) that can be run all at once, or using shortcut keys from the script editor.

 ## On a Mac:
  ##1) Start R
  ##2) File --> New Document
  ##3) Write the command

print("Hello world")

  ##4) Highlight the line and hit command-R

  ## A few features of R:
  	## Everything in R is object oriented. Data, functions, inputs and outputs will all be data objects.
  	## R is case sensitive. For that matter, it is also spelling sensitive.
  	## R is an open-source platform that comes with many basic functions.
  	## Additional functionality are available in user-contributed packages that can be downloaded, loaded, and used.
  	## Lots and lots of people use R, write handouts for class, write websites, etc.  Google is your friend (and your enemy).

## 1.3: R as a calculator

	## R can handle any basic arithmatic problem
5+4 # Addition
6-3 # Subtraction
34 / 6 # Division
5 * 3 # Multiplication
5^4 # Exponents
625^(1/4) # More exponents
11%% 2 # modular arithmatic (11 mod 2)
31 %/% 7 # The integer part of a fraction
7*4 +3 # 31 divided by 7 is four plus remainder 3

## R comes with a number of constants pre-stored that you can use
6.25 # numbers
pi # And a few others
NA # Missing value
NULL # Nothing.
0/0 # NaN means "Not a number"
1/0 # Inf means infinity

## Please Excuse My Dear Aunt Sally
2*(3-4)+2
2*(3-4)+2*(4 + 3)^(1/3)

## Use the up and down arrows to access previously typed commands

##1.4: Objects and named storage

# What if we wanted to calculate the % of eligible voters who turnout in the 06 elections in Alaska
# Data source: http://elections.gmu.edu/Turnout_2006G.html

turnout.ak<-238307/496387 # Turnout divided by voting age population
# the <- operator asigns a value to that object
turnout.ak # the command 'print(object)' will be called if you just type the name
turnout.ak=238307/496387 # You can also use an equal sign

## Named storage also lets you handle each piece separately
total.votes.ak <-  238307
voting.age.population.ak <- 496387
turnout.ak <-total.votes.ak/voting.age.population.ak

# Object names cannot start with numbers
06election<-50000 ## no

##  Named objects are stored in the "global environment", which means that they can be accessed at any time by any function you might run.
##They are "global" variables (which makes them different from "local" variables).

objects() # List the objects currently on your global
ls() # same thing

## you can also remove objects
Jacob<-100
ls()
rm(Jacob)
## The command remove(Jacob) does the same thing
ls()
Jacob1<-Jacob2<-100
ls()
rm(list=c("Jacob1", "Jacob2"))
objects()

## combine them to remove everything
rm(list=ls())

## in some text editors this command will let you look at the object
total.votes.ak <-  238307
voting.age.population.ak <- 496387
turnout.ak <-total.votes.ak/voting.age.population.ak
fix(turnout.ak)

## Some things are present in the working environment, but not shown
.x<-"Hide me"
print(.x)
ls()
## Anything that starts with a "." will be there, but are hidden

##1.5: Introduction to functions

## Functions are objects that contain a list of instructions
## We "call" a function to execute a command
q # q is a function with three inputs: save, status, runLast
log # log is a function that takes two command, an input of data and instructions on the correct base
      # the second argument has the default argument exp(1).

exp(1) # exp(1) is itself a function that produces euler's constant

log(2) # ln(2)
log(2, base=10) # log(2) base 10

## There are a *lot* of functions in R.  Finding the right ones is really almost half of the battle
apropos("norm") # finds all functions in your version of R with the string "norm" in the name

## you can call functions inside eachother.  The computer will evaluate the "inside" one first.
exp(log(1)) # e^ln(1) = 1


##1.6: Vectors

c(0,7,8) # the c() function is used to collect/concatenate things together into a vector
x<-c(0,7,8) # assign this to a named object
x # we can see x
print(x) #Same thing
show(x) #Same thing
## Note: print and show do not always produce the same result

numbers5to20 <- 5:20 # the : symbol creates sequences of increasing or decrasing numbers
numbers5to20

1.5:10 # always increments by 1, and may not get to top number

c(numbers5to20, x) #concatenate two vectors together


## 1.7: Functions for vectors

## Many functions have been "Vectorized" meaning that they work on each element in the vector
numbers5to20*2
sqrt(numbers5to20)


## But when you "Interact" two functions, they will work "elementwise"

numbers5to20^2
numbers5to20*numbers5to20
numbers5to20+numbers5to20
numbers5to20+rev(numbers5to20) # What just happened?

## Other functions operate on a functions work more directly
sum(numbers5to20)
mean(numbers5to20)

