#include <xc.inc>

extrn	SPI_MasterInit

psect	code, abs
	
rst:	org	0x0000	; reset vector
	goto	sending_data

main:
    call    SPI_MasterInit
    call    sending_data
    
    
sending_data:
    ; INT_EN register
    ;pull csb low - start
    movlw   0x50
    call    SPI_MasterTransmit
    movlw   0b00000000
    call    SPI_MasterTransmit
    ;pull csb high - stop
    movlw   0b00001111
    call    SPI_MasterTransmit
    
    
    call    SPI_MasterInit
    call    SPI_MasterTransmit
    
	


end	rst
