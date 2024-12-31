; Counter_$0-$F.asm
#include C:\68HCS12\registers.inc

; Author:                               Neil Kingdom
; Course:                               CST8216 Processor Architecture
; Student Number:                       040-967-309
; Date:                                 11 Nov 2020

; Purpose:                              The purpose of this program is to blink
;                                       the approriate LEDs on the Dragon 12
;                                       simulator to represent the numbers $0-$F

; Program Constants
END_COUNT       equ     $F              ; Last value of Count
DELAY_VALUE     equ     250             ; Delay subroutine value (base 10) 0 - 255 ms
                                        ; 125 = 1/8 second, 250 = 1/4 second

                org     $2000           ; program code
Start           lds     #$2000          ; stack location

; Configure the Ports
                jsr     Config_SWs_and_LEDs

; Continually Count $0 - $F...$0 - $F
Reset           ldab    #0               ; Reset count to 0
Loop            stab    portb            ; display count
                ldaa    #DELAY_VALUE
                jsr     Delay_ms         ; delay for 250ms
                incb                     ; increment count
                cmpb    #END_COUNT       ; loop condition
                bhi     Reset            ; branch (count > 15)
                bra     Loop             ; loop infinitely

; Library Files
#include C:\68HCS12\Lib\Config_SWs_and_LEDs.asm
#include C:\68HCS12\Lib\Delay_ms.asm

                end