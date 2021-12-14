;;; NURSE CODE
#include <xc.inc>

extrn	SPI_MasterInit, SPI_MasterTransmit, SPI_MasterRead, UART_Setup, UART_Transmit_Byte;, read_byte1
    
psect	code, abs
	
rst:	org	0x0000	; reset vector
	goto	setup

setup:
    bsf	    TRISB, 0, A
    bcf	    CFGS	; point to Flash program memory  
    bsf	    EEPGD 	; access Flash program memory
    call    nurse_ledSetup ; set up lEDs
    call    setup_lcd
    
    ; set up interrupts
    ; goto main
main:
    ;wait for interrupt to be called
    goto    $

   
test_read:
    ;################# CHIP_ID address 0x00 but MSB = 1 (Read)
    call    NOP_delay
    call    NOP_delay
    bcf	    PORTE, 0, A		; pull CSB low - start message
    call    NOP_delay
    call    NOP_delay
    ;bsf	    TRISC, 4, A ; set RC4 as input, since this will be recieving data from the slave ???????????
    movlw   0b10000000	; chip id register
    ;movlw   0xff
    ;movlw   0b10101010
    ;movlw   0b10000011	; pmu status
    call    SPI_MasterTransmit
    movlw   0b00000000 ; so we don't write anything while trying to read
    ;call    NOP_delay
    ;call    NOP_delay
    call    SPI_MasterRead
    bsf	    PORTE, 0, A		; pull CSB high - end message
    ;movff   read_byte1, WREG   
    call    UART_Transmit_Byte
    return


end	rst

    ;;; MAIN COPIED FROM led_buzzer
    
    
#include <xc.inc>

extrn	DAC_Setup, DAC_Int_Hi, ledSetup, nurse_alert, setup_lcd

psect	code, abs
	
rst:	org	0x0000	; reset vector
	goto	globalSetup

int_hi:	org	0x0008	; high vector, no low vector,
	;check whcih port is high
	; go to correct interrupt subroutine
	
	; skip if RB0 is 0
	; call rb0
	; skip if RB1 ...
	goto	DAC_Int_Hi
	
globalSetup:	
	call	DAC_Setup
	call	ledSetup
	call	nurse_alert ; for testing
	;call	nurse_fall ; for testing
	goto	$	; Sit in infinite loop

end	rst