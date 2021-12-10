#include <xc.inc>

extrn	SPI_MasterInit, SPI_MasterTransmit, SPI_MasterRead, UART_Setup, UART_Transmit_Byte;, read_byte1
    
psect	code, abs
	
rst:	org	0x0000	; reset vector
	goto	setup

setup:
    bsf	    TRISB, 0, A
    bcf	    CFGS	; point to Flash program memory  
    bsf	    EEPGD 	; access Flash program memory
    call    UART_Setup	; setup UART
main:
    call    SPI_MasterInit
    ;call    sending_data
    call    test_read
    goto    $

   
test_read:
    ;################# CHIP_ID address 0x00 but MSB = 1 (Read)
    bcf	    PORTE, 0, A		; pull CSB low - start message
;    movlw   0b10000000	; chip id
    movlw   0b10000011	; pmu status
    call    SPI_MasterRead
    ;movff   read_byte1, WREG   
    call    UART_Transmit_Byte
    bsf	    PORTE, 0, A		; pull CSB high - stop message
    return
    
sending_data:
    call    INT_EN
    call    INT_OUT_CTRL
    call    INT_MAP
    ;call   INT_LOW_HIGH
    return

INT_EN:
    ;################# INT_EN[0]
    bcf	    PORTE, 0, A		; pull CSB low - start message
    movlw   0x50 ; IF WE EVER WANT TO READ, CHANGE MSB TO 1 
    call    SPI_MasterTransmit
    movlw   0b00000000
    call    SPI_MasterTransmit
    bsf	    PORTE, 0, A		; pull CSB high - stop message
    ;################# INT_EN[1]
    bcf	    PORTE, 0, A		; pull CSB low - start message
    movlw   0x51
    call    SPI_MasterTransmit
    movlw   0b00001111
    call    SPI_MasterTransmit
    bsf	    PORTE, 0, A		; pull CSB high - stop message
    ;################# INT_EN[2]
    bcf	    PORTE, 0, A		; pull CSB low - start message
    movlw   0x52
    call    SPI_MasterTransmit
    movlw   0b00000000
    call    SPI_MasterTransmit
    bsf	    PORTE, 0, A		; pull CSB high - stop message
    return

INT_OUT_CTRL:
    ;################# INT_OUT_CTRL
    bcf	    PORTE, 0, A		; pull CSB low - start message
    movlw   0x53
    call    SPI_MasterTransmit
    movlw   0b00001010
    call    SPI_MasterTransmit
    bsf	    PORTE, 0, A		; pull CSB high - stop message
    return
    
    
INT_MAP:
    ;################# INT_MAP[0]
    bcf	    PORTE, 0, A		; pull CSB low - start message
    movlw   0x55 ; IF WE EVER WANT TO READ, CHANGE MSB TO 1 
    call    SPI_MasterTransmit
    movlw   0b11111111
    call    SPI_MasterTransmit
    bsf	    PORTE, 0, A		; pull CSB high - stop message
    ;################# INT_MAP[1]
    bcf	    PORTE, 0, A		; pull CSB low - start message
    movlw   0x56
    call    SPI_MasterTransmit
    movlw   0b11110000
    call    SPI_MasterTransmit
    bsf	    PORTE, 0, A		; pull CSB high - stop message
    ;################# INT_MAP[2]
    bcf	    PORTE, 0, A		; pull CSB low - start message
    movlw   0x57
    call    SPI_MasterTransmit
    movlw   0b00000000
    call    SPI_MasterTransmit
    bsf	    PORTE, 0, A		; pull CSB high - stop message
    return
    
	


end	rst
