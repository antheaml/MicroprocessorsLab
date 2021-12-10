#include <xc.inc>

extrn	spi_setup

psect	code, abs
	
rst:	org	0x0000	; reset vector
	goto	globalSetup


;int_hi:	org	0x0008	; high vector, no low vector,
;	goto	DAC_Int_Hi
;	
globalSetup:
;	movlw	0b11111111
;	movwf	TRISB
;	movlw	0b00000000
;	movwf	PORTB
	call	spi_setup
	goto	$	; Sit in infinite loop

end	rst
