**************************************
*
* Name: Shaowei Zhou
* ID: 14215493
* Date: 2/20/2017
* Lab2
*
* Program description:
* The program takes two input, one is divisor
* the other one is dividend.
* Using dividend divided by divisor to calculate how many times
* the dividend can be divided, and calculate the number reamains.
* To do this, the divisor cannot be zero, so there is a if statement
* to check this condition, if divisor is not equal zero, the program
* will continue, otherwise, the quotient and remainder will equal to 
* $FF.
* The else loop contains a while loop, when the divisor is smaller or
* equal to dividend, which means the dividend can still be divided, 
* then the loop will continue, until the dividend cannot be divided 
* anymore, and the remainder will be calculated out at the same time.
*
* BNE branch to chekc for the divisor is equal zero or not,
* BGT branch to chekc for termination the loop.
*
* if the divisor is greater than dividend, the program will not be exacuted
* since there is no answer for that
*
* Pseudocode:
*
* C program:
* 	unsigned int dividend = 13;
* 	unsigned int divisor = 3;
* 	unsigned int quotient = 0;
* 	unsigned int remainder = 0;
* 	if(divisor == 0) {
*		quotient = remainder = $FF;
*	}
*	else {
*   		while(divisor <= dividend) {
*  	   		remainder = dividend - divisor;
*    	   		dividend = remainder;
*    	   		++quotient;
*    		}
*	}
*    	
* 
**************************************

* start of data section

	ORG $B000
DIVIDEND	FCB     101         The dividend.
DIVISOR		FCB       6         The divisor.

	ORG $B010
QUOTIENT	RMB       1         The quotient.
REMAINDER	RMB       1         The remainder.
RESULT 		EQU 	  255	    The result for both numbers when divisor is equal 0.

* define any other variables that you might need here using RMB (not FCB or FDB)


	ORG $C000
* start of your program
	LDAA	#0
	STAA	QUOTIENT	* initialize QUOTIENT to zero
IF	LDAA	DIVISOR		* checking if DIVISOR is 0
	CMPA	#0
	BNE	ELSE		* if DIVISOR is not 0, do the else part
THEN	LDAA	#RESULT		* if DIVISOR is 0, store $FF to both numbers
	STAA	QUOTIENT
	STAA	REMAINDER
	BRA	ENDIF		* terminate if/else loop
ELSE	
WHILE	LDAA	DIVISOR		* WHILE loop starts, comparing DIVISOR and DIVIDEND
	CMPA	DIVIDEND	
	BHI	ENDWHILE	* checking the DIVISOR is greater than DIVISOR
	LDAA	DIVIDEND
	SUBA	DIVISOR		* subtracting DIVISOR from DIVIDEND to register A
	STAA	REMAINDER	* storing A the result from above step to DIVIDEND and QUOTIENT
	STAA	DIVIDEND
	INC	QUOTIENT	* increment the loop counter which is also the QUOTIENT
	BRA	WHILE		* repeat loop always
ENDWHILE
ENDIF
DONE	BRA	DONE
	END
	