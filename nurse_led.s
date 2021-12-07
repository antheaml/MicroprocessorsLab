#include <xc.inc>
    
global	ledSetup, nurse_fall, nurse_alert, nurse_remote_disable

extrn	start_fall_lcd, start_alertButton_lcd, start_disable_lcd

psect	nurse_led_code,class=CODE

ledSetup: 
    ; ---- Subroutine to set up ports controlling LEDs ----
    movlw   0b11111100 ; RD0 and RD1 as output
    movwf   TRISD, A 
    movlw   0b00000000 ; all portD LEDs off
    movwf   PORTD, A
    return
	
nurse_fall:
    ; ---- Subroutine to control how nurse responds when client falls ----
    movlw   0b00000010 ; need RD1 high, rest low, triggers buzzer and red LED
    movwf   PORTD, A
    call    start_fall_lcd
    return
    
nurse_alert:
    ; ---- Subroutine to control how nurse responds when client presses ----
    ; ----			  distress button		        ---- 
    movlw   0b00000001 ; 
    movwf   PORTD, A ; triggers buzzer and yellow LED
    call    start_alertButton_lcd
    return
    
nurse_remote_disable:
    ; ---- Subroutine to control how nurse responds when client presses ----
    ; ----			  disable button		        ---- 
    movlw   0b00000000 ; all LEDs off, and buzzer off
    movwf   PORTD, A
    call    start_disable_lcd
    return

	