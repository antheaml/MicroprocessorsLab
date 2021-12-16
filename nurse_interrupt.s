#include <xc.inc>
    
global	Nurse_Interrupt_Setup, nurse_ledSetup, Nurse_Int_Hi, nurse_fall, nurse_alert, nurse_remote_disable

extrn	start_fall_lcd, start_alertButton_lcd, start_disable_lcd, setup_lcd

psect	nurse_int_code,class=CODE

Nurse_Interrupt_Setup: ; used to be DAC_Setup
       ; need to rewrite and set up based on how the nurse is wired up
;       movlw	0xFF
;       movwf	TRISB, A	; enable portB as inputs for interrupt
;       bsf	RBIE		; Enable RB interrupt
;       bsf	GIE		; Enable all interrupts
       return  

nurse_ledSetup: 
    ; ---- Subroutine to set up ports controlling LEDs ----
    movlw   0b11111100 ; RH0 and RH1 as output, RH0 = FALL LED, RH1 = ALERT BUTTON LED
    movwf   TRISH, A 
    movlw   0b00000000 ; all PORTH LEDs off
    movwf   PORTH, A
    return
    
	
Nurse_Int_Hi:	; used to be DAC_Int_Hi
	;btfss	RBIF		; check that this is RB interrupt
	;retfie	f		; if not then return
	; logic to figure out which subroutine to call depending on signal
	BTFSC	PORTB, 0, A ;bit test RB0, skip if clear
	call    nurse_fall
	BTFSC	PORTB, 1, A ;bit test RB1, skip if clear
	call	nurse_alert
	BTFSC	PORTB, 2, A ;bit test RB2, skip if clear
	call	nurse_remote_disable
	bcf	RBIF		; clear interrupt flag
	retfie	f		; fast return from interrupt		
	
nurse_fall:
    ; ---- Subroutine to control how nurse responds when client falls ----
    movlw   0b00000001 ; need RH0 high, rest low, triggers buzzer and fall LED
    movwf   PORTH, A
    bcf	    RBIE		; Disable RB interrupt for lcd
    bcf	    GIE
    call    setup_lcd
    call    start_fall_lcd
    bsf	    RBIE		; Enable RB interrupt
    bsf	    GIE
    return
    
nurse_alert:
    ; ---- Subroutine to control how nurse responds when client presses ----
    ; ----			  distress button		        ---- 
    movlw   0b00000010 ; 
    movwf   PORTH, A ; triggers buzzer and alert LED
    bcf	    RBIE		; Disable RB interrupt for lcd
    bcf	    GIE
    call    setup_lcd
    call    start_alertButton_lcd
    bsf	    RBIE		; Enable RB interrupt
    bsf	    GIE
    return
    
nurse_remote_disable:
    ; ---- Subroutine to control how nurse responds when client presses ----
    ; ----			  disable button		        ---- 
    movlw   0b00000100 ; all LEDs off, and buzzer off
    movwf   PORTH, A
    bcf	    RBIE		; Disable RB interrupt for lcd
    bcf	    GIE
    call    setup_lcd
    call    start_disable_lcd
    bsf	    RBIE		; Enable RB interrupt
    bsf	    GIE
    return

	


