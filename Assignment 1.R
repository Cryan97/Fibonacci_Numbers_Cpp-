#----- Setup -----

# Clearing workspace
rm(list=ls())

# setting the current working directory
setwd("C:\\Users\\conor\\OneDrive\\Documents\\Data Analytics Masters\\Stage 1\\Semester 3\\Data Programming with C\\Assignment\\Assignment 1")

# loading required packages using pacman
pacman::p_load(rbenchmark)

#----- Question 3 -----
# Wrapper function to call compiled fibC function

# loading the Fibonacci C++ file
dyn.load("fibC.dll")

# wrapper function that takes one input argument n
# (length of Fibonacci sequence to be generated)
fibC <- function(n){
  
  # Checking if n is a scalar
  if((length(n) != 1)){
    stop("Input argument n must be a scalar")
  }
  
  # Checking if the input n is an integer
  if(n %% 1 != 0){
    stop("Input argument n must be an integer")
  }
  
  # Checking if n is positive
  if(n < 1){
    stop("Input argument n must be positive")
  }
  
  # creating a variable called result and assigning it the value
  # of the C++ function with inputs vec and n
  # where vec is a numeric vector of length n containing the integers 1 to n
  # and n is a positive integer 
  result <- .C("fibC",vec = as.numeric(seq(1,n)),n = as.integer(n))$vec
  
  # returning the calculated Fibonacci sequence of length n
  return(result)
  
}

# call C++ function through the wrapper function to calculate a30
fib30 <- fibC(30)

# printing value of a30
a30 <- fib30[length(fib30)]
print(paste0("The 30th element of the Fibonacci sequence is ",a30))

#----- Question 5 -----
# Creating an R function called fibR that generates and returns a vector
# containing the first n numbers of the fibonacci sequence

fibR <- function(n){
  
  # Checking if n is a scalar
  if((length(n) != 1)){
    stop("Input argument n must be a scalar")
  }
  
  # Checking if the input n is an integer
  if(n %% 1 != 0){
    stop("Input argument n must be an integer")
  }
  
  # Checking if n is positive
  if(n < 1){
    stop("Input argument n must be positive")
  }
  
  # Creating an empty vector of length n to store values of Fibonacci sequence
  vec <- seq(1,n)
  
  # Checking if n == 1
  if (n == 1) {
    vec[1] <- 0
  
  # Checking if n == 2  
  } else if (n == 2){
    vec[1] <- 0
    vec[2] <- 1
    
  # else run for loop to calculate Fibonacci sequence of length n 
  } else {
    
    # setting first two values of sequence equal to 0 & 1 respectively
    vec[1] <- 0
    vec[2] <- 1
    
    # for loop to calculate remaining values up to length n
    for (i in 3:length(vec)) {
      vec[i] <- vec[i-1] + vec[i-2]
    }
  }
  
  # output the required Fibonacci sequence as a vector
  return(vec)
}

# call fibR function to calculate a30
fibR30 <- fibR(30)

# printing value of a30
aR30 <- fibR30[length(fibR30)]
print(paste0("The 30th element of the Fibonacci sequence is ",aR30))


#----- Question 6 - Which funciton is more efficient fibC vs fibR -----

# Clearing unused memory
gc(full = TRUE)

# Increasing amount of memory available to R
memory.limit(size = 15000)

# Profiling fibR function with 100 repetitions
Rprof("profileR.out")
for (i in 1:100) {
  fibR(10000)  
}
Rprof(NULL)
R_profile_sum <- summaryRprof("profileR.out")

# printing the fibR profiling summary 
R_profile_sum$by.total

# Profiling fibC function with 100 repetitions
Rprof("profileC.out")
for (i in 1:100) {
  fibC(10000)
}
Rprof(NULL)
C_profile_sum <- summaryRprof("profileC.out")

# printing the fibC profiling summary 
C_profile_sum$by.total

# unloading the Fibonacci C++ file
dyn.unload("fibC.dll")

