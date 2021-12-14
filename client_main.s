;;; CLIENT CODE
#include <xc.inc>

extrn	SPI_MasterInit, SPI_MasterTransmit, SPI_MasterRead, UART_Setup, UART_Transmit_Byte;, read_byte1
    
psect	code, abs
	
rst:	org	0x0000	; reset vector
	goto	clientSetup
	
int_hi:	org	0x0008	; High priority interrupt
	goto	DAC_Int_Hi
	
clientSetup:	
	call	Client_Interrupt_Setup ; Set up interrupt
	;call	Client_Led_Setup ; Set up LEDs NEED TO WRITE
	call	client_imuSetup
	goto	$	; Sit in infinite loop

main:
    goto    $

 

end	rst

   
