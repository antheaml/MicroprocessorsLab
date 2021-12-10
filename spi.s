#include <xc.inc>
    
global	SPI_MasterInit, SPI_MasterTransmit, SPI_MasterRead;, read_byte1

;psect	spi_data
;read_byte1: ds	1
    
psect	spi_code, class=CODE
    
SPI_MasterInit:	; Set Clock edge to negative
	bcf	CKE2	; CKE bit in SSP2STAT, 
	; MSSP enable; CKP=1; SPI master, clock=Fosc/64 (1MHz)
	movlw 	(SSP2CON1_SSPEN_MASK)|(SSP2CON1_CKP_MASK)|(SSP2CON1_SSPM1_MASK)
	movwf 	SSP2CON1, A
	; SDO2 output; SCK2 output
	bcf	TRISD, PORTD_SDO2_POSN, A	; SDO2 output #### can just wire up port e pins to port c 
	bcf	TRISD, PORTD_SCK2_POSN, A	; SCK2 output
	;######### added by us
	bcf	TRISE, 0, A
	bsf	PORTE, 0, A
	;######### added by us
	return

SPI_MasterTransmit:  ; Start transmission of data (held in W)
	movwf 	SSP2BUF, A 	; write data to output buffer
Wait_Transmit:	; Wait for transmission to complete 
	btfss 	SSP2IF		; check interrupt flag to see if data has been sent
	bra 	Wait_Transmit
	bcf 	SSP2IF		; clear interrupt flag
	return

SPI_MasterRead:
	movwf	SSP2BUF, A
Wait_Read:	; Wait for transmission + read to complete 
	btfss 	SSP2IF		; check interrupt flag to see if data has been sent
	bra 	Wait_Read
	;movff	SSP2BUF, read_byte1, A	    ; load SSP2BUF to read_byte1
	movff	SSP2BUF, WREG, A
	bcf 	SSP2IF		; clear interrupt flag
	;send read_byte1 to uart
	return