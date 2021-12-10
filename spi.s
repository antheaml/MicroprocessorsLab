#include <xc.inc>
    
global	spi_setup

; CSB = RE0
; SCK = RC3
; SDO = RC4
; SDI = RC5

psect   spi_code, class=CODE

spi_setup:
    movlw   0x00
    movwf   TRISE, A	    ; set PORTE as outputs (for CSB)
    movwf   TRISC, A	    ; set PORTC as outputs (SCK, SDO, SDI) WHEN WE WANT TO READ CHANGE SDO TO INPUT
    movlw   0b00000001
    movwf   PORTE, A	    ; pull CSB high, selects SPI for IMU
    movlw   0b00001000
    movwf   PORTC, A	    ; clock starts high
    call    INT_EN
    call    INT_OUT_CTRL
    call    INT_MAP
    ; call INT_LOWHIGH
    return

INT_EN:
    movlw   0b00000000
    movwf   PORTE, A	    ; pull CSB low, SPI communication starts
    NOP
    ;	FROM THIS POINT: CLOCK CYCLES SHOULD BE 4 instr. HIGH, 4 instr. LOW
    ;   address 0x50, 0x51, 0x52
    ;###### R/W bit = 0 (write)
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit6 = 1
    movlw   0b00100000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00101000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit5 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit4 = 1
    movlw   0b00100000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00101000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit3 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit2 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit1 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit0 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;################################ REGISTER ADDRESS SENT
    ;############# INT_EN[0]
    ;###### bit7 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit6 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit5 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit4 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit3 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit2 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit1 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit0 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;########################## INT_EN[0] SENT
    ;########################## INT_EN[1]
    ;###### bit7 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit6 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit5 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit4 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit3 = 1
    movlw   0b00100000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00101000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit2 = 1
    movlw   0b00100000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00101000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit1 = 1
    movlw   0b00100000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00101000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit0 = 1
    movlw   0b00100000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00101000
    NOP
    NOP
    movwf   PORTC, A
    ;########################## INT_EN[1] SENT
    ;########################## INT_EN[2]
    ;###### bit7 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit6 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit5 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit4 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit3 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit2 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit1 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit0 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;########################## INT_EN[2] SENT
    NOP
    NOP
    movlw   0b00000001
    movwf   PORTE, A        ; pull CSB high, communication stopped.
    return

INT_OUT_CTRL:
    movlw   0b00000000
    movwf   PORTE, A	    ; pull CSB low, SPI communication starts
    NOP
    ;	FROM THIS POINT: CLOCK CYCLES SHOULD BE 4 instr. HIGH, 4 instr. LOW
    ;   Address 0x53
    ;###### R/W bit = 0 (write)
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit6 = 1
    movlw   0b00100000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00101000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit5 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit4 = 1
    movlw   0b00100000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00101000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit3 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit2 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit1 = 1
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit0 = 1
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;################################ REGISTER ADDRESS SENT
    ;############# INT_OUT_CTRL
    ;###### bit7 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit6 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit5 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit4 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit3 = 1
    movlw   0b00100000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00101000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit2 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit1 = 1
    movlw   0b00100000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00101000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit0 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;########################## INT_OUT_CTRL[0] SENT
    NOP
    NOP
    movlw   0b00000001
    movwf   PORTE, A        ; pull CSB high, communication stopped.
    return


INT_MAP:
    movlw   0b00000000
    movwf   PORTE, A	    ; pull CSB low, SPI communication starts
    NOP
    ;	FROM THIS POINT: CLOCK CYCLES SHOULD BE 4 instr. HIGH, 4 instr. LOW
    ;   address 0x55
    ;###### R/W bit = 0 (write)
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit6 = 1
    movlw   0b00100000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00101000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit5 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit4 = 1
    movlw   0b00100000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00101000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit3 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit2 = 1
    movlw   0b00100000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00101000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit1 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit0 = 1
    movlw   0b00100000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00101000
    NOP
    NOP
    movwf   PORTC, A
    ;################################ REGISTER ADDRESS SENT
    ;############# INT_MAP[0]
    ;###### bit7 = 1
    movlw   0b00100000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00101000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit6 = 1
    movlw   0b00100000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00101000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit5 = 1
    movlw   0b00100000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00101000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit4 = 1
    movlw   0b00100000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00101000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit3 = 1
    movlw   0b00100000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00101000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit2 = 1
    movlw   0b00100000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00101000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit1 = 1
    movlw   0b00100000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00101000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit0 = 1
    movlw   0b00100000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00101000
    NOP
    NOP
    movwf   PORTC, A
    ;########################## INT_MAP[0] SENT
    ;########################## INT_MAP[1]
    ;###### bit7 = 1
    movlw   0b00100000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00101000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit6 = 1
    movlw   0b00100000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00101000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit5 = 1
    movlw   0b00100000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00101000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit4 = 1
    movlw   0b00100000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00101000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit3 = 0
    movlw   0b00100000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00101000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit2 = 0
    movlw   0b00100000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00101000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit1 = 0
    movlw   0b00100000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00101000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit0 = 0
    movlw   0b00100000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00101000
    NOP
    NOP
    movwf   PORTC, A
    ;########################## INT_MAP[1] SENT
    ;########################## INT_MAP[2]
    ;###### bit7 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit6 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit5 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit4 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit3 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit2 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit1 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;###### bit0 = 0
    movlw   0b00000000
    NOP
    NOP
    movwf   PORTC, A
    ;######
    movlw   0b00001000
    NOP
    NOP
    movwf   PORTC, A
    ;########################## INT_MAP[2] SENT
    NOP
    NOP
    movlw   0b00000001
    movwf   PORTE, A        ; pull CSB high, communication stopped.
    return
