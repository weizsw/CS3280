**************************************
*
* Name:	
* ID:	
* Date:
* Lab3
*
* Program description:
* Pseudocode:
**************************************

* start of data section

	ORG $B000
NUM1	FCB	248
NUM2	FCB	186

	ORG $B010
GCD	RMB	1

* define any other variables that you might need here using RMB (not FCB or FDB)
R 	EQU 	0

	ORG $C000
* start of your program
WHILEA	LDAA	NUM2	
	CMPA	#0		
	BLS	ENDWHLA			
	LDAA	NUM1
	STAA	R			
WHILEB	LDAA	R
	CMPA	NUM2			
	BLO	ENDWHLB			
	SUBA	NUM2			
	STAA	R				
	BRA	WHILEB
ENDWHLB					
	LDAA	NUM2	
	STAA	NUM1			
	LDAA	R
	STAA	NUM2			
	LDAA	NUM1
	STAA	GCD			
	BRA	WHILEA
ENDWHLA				
DONE	BRA	DONE		*For the simulator to know you're done.
	END			*End of program!!!!!
	

	