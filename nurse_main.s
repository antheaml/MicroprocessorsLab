;;; NURSE CODE
#include <xc.inc>

extrn	nurse_ledSetup, setup_lcd, Nurse_Interrupt_Setup, Nurse_Int_Hi
    
psect	code, abs
	
rst:	org	0x0000	; reset vector
	goto	nurse_setup

int_hi:	org	0x0008	; high priority interrupt
	goto	Nurse_Int_Hi
	
nurse_setup:
    bsf	    TRISB, 0, A		    ; why?
    bcf	    CFGS		    ; point to Flash program memory  
    bsf	    EEPGD		    ; access Flash program memory
    call    nurse_ledSetup	    ; set up lEDs
    call    setup_lcd		    ; set up lcd including uart for lcd
    call    Nurse_Interrupt_Setup   ; set up interrupt pins for nurse
    goto    main

main:
    ; wait in infinite loop for interrupt to be called
    goto    $

end	rst

    
    
