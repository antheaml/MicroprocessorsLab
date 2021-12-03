#include <xc.inc>

extrn	DAC_Setup, DAC_Int_Hi, delay, delay2

psect	code, abs
rst:	org	0x0000	; reset vector
	goto	setup

int_hi:	org	0x0008	; high vector, no low vector
	goto	DAC_Int_Hi
	
setup:	call	DAC_Setup
	call	led_setup
	call	nurse_alert ; for testing
	;call	nurse_fall ; for testing
	goto	$	; Sit in infinite loop

	

	
; creating FallInterrupt subroutine in Nurse - but for the moment, triggered by a button press bc imu not interfaced

;	uart sends message to nurse (stored somewhere)
;	nurse sees that there's data
;	trigger interrupt
;	read (somewhere)
;	if statetements -> the right subroutine called
	

; Nurse_fall subroutine - called on the nurse device when the client falls
	; nurse buzzer and red led triggered
	; nurse lcd lights up
	
led_setup:
    movlw   0b11111100 ; RD0 and RD1 as output
    movwf   TRISD, A 
    movlw   0b00000000 ; all portD LEDs off
    movwf   PORTD, A
    return
    ; set all pins to 0
	
nurse_fall:
    ; need rd1 high rest low
    movlw   0b00000010
    movwf   PORTD, A
    return
    
nurse_alert:
    ; need rd0 high rest low
    movlw   0b11111100 ; RD0 and RD1 as output
    movwf   TRISD, A 
    movlw   0b00000001
    movwf   PORTD, A
    return
    
nurse_remote_disable:
    ; need all low
    movlw   0b00000000
    movwf   PORTD, A
    return
    
	
; Nurse_alert subroutine - called on the nurse device when the client falls
	; nurse buzzer and yellow led triggered
	; nurse lcd lights up
	
; Nurse_disable subroutine - called on the nurse device when the client falls
	; nurse buzzer and yellow led turned off
	; nurse lcd turns off
; Nurse_
	
	
; buzzer, orange led light up
	
; nurse lcd displays message
	
	    end	rst
