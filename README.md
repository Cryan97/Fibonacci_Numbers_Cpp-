This repository contains code used for an assignment I completed as part of the MSc Data Analytics from UCD for the module "Data Programming with C". I received a grade of 90% for this assignment. 

In this assignment I was tasked with creating a function to produce the first n elements of the Fibonacci sequence using C++. I then had to create a similar function in R and compare the performance and efficiency of the two functions using the "Benchmark" package in R.

The repository contains 3 files; Main .R file, .Cpp file containing the Fibonacci function written in C++ and .dll file containing the compiled C++ function which the R script reads in. 

To run the project code yourself download the .R and .dll files and save them in a known location. Open the .R file and change the path in the 7th line to correspond to the location where the project files are saved. Finally run the .R file. 

I found a significantly better performance (x6 times quicker) using the .Cpp function over the .R function for producing the first n elements of the Fibonacci sequence.

Aside: If you are interested in running and compiling the .Cpp file yourself follow the below steps.

1. The fibC.cpp file is completed with the required extern “C” wrapper surrounding the Fibonacci (fibC) function.
2. The fibC.cpp file is saved down to a known location (path).
3. The command prompt is opened, and the following command is typed in order to navigate to the correct file directory containing the fibC.cpp file.
   **cd C:_Insert_Path_Here_**
   **cd C:\Users\conor\OneDrive\Documents\Data Analytics Masters\Stage 1\Semester 3\Data Programming with C\Assignment\Assignment 1**     
4. The following command is then entered in the command prompt in order to compile the fibC.cpp file.
   **R CMD SHLIB fibC.cpp**
6. Provided there were no errors in the fibC.cpp file during compiling, a new .dll file will be created in the directory mentioned above. This is the file that is loaded        into R using the dyn.load function. 
