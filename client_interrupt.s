#include <xc.inc>
	
global DAC_Int_Hi, Interrupt_Setup
    
extrn	nurse_fall, nurse_alert, nurse_remote_disable
        
psect udata_acs
delay_counter1:	    ds 1
delay_counter2:	    ds 1
alert_code:	    ds 1

psect	dac_code, class=CODE
    
Client_Interrupt_Setup: ; used to be DAC_Setup
	; need to rewrite and set up based on how the client is wired up
	movlw	0xff
	movwf	TRISB, A
	movlw	0x00
	movwf	TRISE, A
	movwf	PORTE, A	; make it an output
	bsf	RBIE		; Enable RB interrupt
	bsf	GIE		; Enable all interrupts
	return
	
	; write interrupt subroutine that is called when fall 
	    ; RB0 which triggers
	    ; make RH0 high (stays high)
	    ; RH0 connects RB0 on nurse
	 
	; write interrupt subroutine this is called when alert button pressed
	    ; RB1 which triggers
	    ; make RH1 high (stays high)
	    ; RH1 connects RB1 on nurse
	
	; write interrupt subroutine this is called when disable button pressed
	    ; RB2 which triggers
	    ; make RH2 high (stays high)
	    ; RH2 connects RB2 on nurse



