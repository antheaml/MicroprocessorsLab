; THINK THIS IS ALL OBSOLETE, moved to nurse_interrupt.s and client_interrupt.s
    
    
    
    ;#include <xc.inc>
;	
;global Nurse_Int_Hi
;    
;extrn	nurse_fall, nurse_alert, nurse_remote_disable
;        
;;psect udata_acs
;;delay_counter1:	    ds 1
;;delay_counter2:	    ds 1
;
;psect	dac_code, class=CODE
;
;
;	
;	
;	
;;delay:
;;    movlw	0xff
;;    movwf	delay_counter2, A
;;    call	delay2
;;    decfsz	delay_counter1, A
;;    bra		delay
;;    return
;;    
;;delay2:
;;    decfsz	delay_counter2, A
;;    bra		delay2
;;    return
;
;
;
;
;
