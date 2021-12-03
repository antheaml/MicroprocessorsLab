#include <xc.inc>

extrn	DAC_Setup, DAC_Int_Hi, delay, delay2

psect	code, abs
rst:	org	0x0000	; reset vector
	goto	setup

int_hi:	org	0x0008	; high vector, no low vector
	goto	DAC_Int_Hi
	
setup:	call	DAC_Setup
	goto	$	; Sit in infinite loop

	end	rst

	
; creating FallInterrupt subroutine in Nurse - but for the moment, triggered by a button press bc imu not interfaced

;	uart sends message to nurse (stored somewhere)
;	nurse sees that there's data
;	trigger interrupt
;	read (somewhere)
;	if statetements -> the right subroutine called
	

; Nurse_fall subroutine - called on the nurse device when the client falls
	; nurse buzzer and yellow led triggered
	; nurse lcd lights up
	
; Nurse_alert subroutine - called on the nurse device when the client falls
	; nurse buzzer and yellow led triggered
	; nurse lcd lights up
	
; Nurse_disable subroutine - called on the nurse device when the client falls
	; nurse buzzer and yellow led triggered
	; nurse lcd lights up
; Nurse_
	
	
; buzzer, orange led light up
	
; nurse lcd displays message