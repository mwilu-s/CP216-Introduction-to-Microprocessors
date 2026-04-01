/*
-------------------------------------------------------
count2.s
-------------------------------------------------------
Author:  Mwilu Siakachoma
ID:      169107092
Email:   siak7092@mylaurier.ca
Date:    2026-02-12
-------------------------------------------------------
A simple count down program (bge)
-------------------------------------------------------
*/
.org 0x1000  // Start at memory location 1000
.text        // Code section
.global _start
_start:

// Store data in registers
LDR r3, =COUNTER //Initialised the value

TOP:
sub r3, r3, #1 // Decrement the countdown value
cmp r3, #0  // Compare the countdown value to 0
bge TOP   // Branch to top under certain conditions

_stop:
b _stop

COUNTER: //stored in memory now
.word 5

.end