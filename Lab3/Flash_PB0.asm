; Flash_PB0.asm
#include C:\68HCS12\registers.inc

; Author:                               D. Haley
; Course:                               CST8216 Fall 2020
; S/N:                                  Faculty
; Date:                                 30 Oct 2020

; Modified by:                          Neil Kingdom
; Student Number:                       040-967-309
; Date:                                 11 Nov 2020

; Purpose:                              To Flash PB0 LED on Dragon 12+ Trainer

; Program Constants
STACK   equ     $2000
PB0ON   equ     %00000001               ; 1 turns on LED, 0 turns off LED
PB0OFF  equ     %00000000               ; 1 turns on LED, 0 turns off LED

        org     $2000                   ; program code
Start   lds     #STACK                  ; stack location

; Configure the Ports
        jsr     Config_SWs_and_LEDs

; Continually Flash LED
Back    ldaa    #PB0ON
        staa    portb                   ; PB0 ON
        ldaa    #250                    ; 250 ms delay
        jsr     Delay_ms
        ldaa    #PB0OFF
        staa    portb                   ; PB0 OFF
        ldaa    #250                    ; 250 ms delay
        jsr     Delay_ms                ; call 250ms delay routine
        bra     Back                    ; endless loop

; Library Files
#include C:\68HCS12\Lib\Config_SWs_and_LEDs.asm
#include C:\68HCS12\Lib\Delay_ms.asm

        end