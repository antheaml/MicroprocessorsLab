#include <xc.inc>
    
global	nurse_ledSetup, Nurse_Int_Hi, nurse_fall, nurse_alert, nurse_remote_disable

extrn	start_fall_lcd, start_alertButton_lcd, start_disable_lcd, setup_lcd

psect	nurse_int_code,class=CODE

nurse_ledSetup: 
    ; ---- Subroutine to set up ports controlling LEDs ----
    movlw   0b11111000 ; RH0:2 as output
    movwf   TRISH, A 
    movlw   0b00000000 ; all PORTH LEDs off
    movwf   PORTH, A
    return
    
	
Nurse_Int_Hi:	; used to be DAC_Int_Hi
	;btfss	RBIF		; check that this is RB interrupt
	;retfie	f		; if not then return
	; logic to figure out which subroutine to call depending on signal
	BTFSC	PORTB, 0, A ;bit test RB0, skip if clear
	call    nurse_fall
	BTFSC	PORTB, 1, A ;bit test RB1, skip if clear
	call	nurse_alert
	BTFSC	PORTB, 2, A ;bit test RB2, skip if clear
	call	nurse_remote_disable
	bcf	RBIF		; clear interrupt flag
	retfie	f		; fast return from interrupt		
	
nurse_fall:
    ; ---- Subroutine to control how nurse responds when client falls, so PORT D made high ----
    bsf	    PORTH, 0 , A ; turn on led
    call    setup_lcd
    call    start_fall_lcd
    bcf	    TRISD, 0, A ; enable as output
    bsf	    PORTD, 0, A ; stop communication on this line
    bsf	    TRISD, 0, A ; enable as input
    return
    
nurse_alert:
    ; ---- Subroutine to control how nurse responds when client presses ----
    ; ----			  distress button		        ---- 
    bsf	    PORTH, 1, A ; turn on LED
    call    setup_lcd
    call    start_alertButton_lcd
    bcf	    TRISD, 1, A ; enable as output
    bsf	    PORTD, 1, A ; stop communication on this line
    bsf	    TRISD, 1, A ; enable as input
    return
    
nurse_remote_disable:
    ; ---- Subroutine to control how nurse responds when client presses ----
    ; ----			  disable button		        ---- 
    ;turn off other leds
    ;turn on diable led
    call    setup_lcd
    call    start_disable_lcd
    bcf	    TRISD, 2, A ; enable as output
    bsf	    PORTD, 2, A ; stop communication on this line
    bsf	    TRISD, 2, A ; enable as input
    return

	


