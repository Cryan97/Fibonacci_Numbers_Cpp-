// Fibonaci function which produces first n terms of fibonaci sequence for any given n

// Include <R.h> to allow printing to R
#include <R.h>
extern "C" {

// Assume that input *vec is a vector of length n
// Assume that input *n is an integer equal to n
  
  void fibC(double *vec, int *n){
  	
  	// creating length variable equal to input *n
  	int length = *n;
  	
  	// initialise vector elements to be equal to 0
	vec[length] = {0};
	
	// if statement to check if n == 1
	if (length == 1){
		vec[0] = 0;
		
	// else if statement to check if n==2
	} else if (length == 2){
		vec[0] = 0;
		vec[1] = 1;

	// else for loop to produce fibonacci sequence equal in length to n
	} else {
		// setting first 2 values of sequence equal to 0 & 1 respectively
		vec[0] = 0;
		vec[1] = 1;
		
		// for loop for calculating the remaining values up to length n
		for (int i = 2; i < length; i++){
			vec[i] = vec[i-1] + vec[i-2];
		}
	}
  }
}
