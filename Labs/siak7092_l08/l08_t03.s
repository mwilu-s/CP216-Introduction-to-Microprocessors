/*
-------------------------------------------------------
l08_t03.s
-------------------------------------------------------
Author:  Mwilu Siakachoma
ID:      169107092
Email:   siak7092@mylaurier.ca
Date:    2026-03-27
-------------------------------------------------------
Uses a subroutine to read strings from the UART into memory.
-------------------------------------------------------
*/
.org 0x1000   // Start at memory location 1000
.text         // Code section
.global _start
_start:

bl    EchoString

_stop:
b _stop

// Subroutine constants
.equ UART_BASE, 0xff201000  // UART base address
.equ VALID, 0x8000          // Valid data in UART mask
.equ ENTER, 0x0A            // The enter key code

EchoString:
/*
-------------------------------------------------------
Echoes a string from the UART to the UART.
-------------------------------------------------------
Uses:
  r0 - holds character to print
  r1 - address of UART
-------------------------------------------------------
*/

//=======================================================

// your code here

stmfd sp!, {r0, r1, lr}   //save registers

ldr   r1, =UART_BASE      //load UART

Loop:
ldr   r0, [r1]            //read UART
tst   r0, #VALID          //check UART is valid
beq   Loop                

and   r0, r0, #0xFF       //get char from UART
cmp   r0, #ENTER          //check if Enter pressed
beq   Finish              

strb  r0, [r1]            //write char back to UART
b     Loop                

Finish:
ldmfd sp!, {r0, r1, lr}   //restore registers

//=======================================================


bx    lr               // return from subroutine

.end
