/*
-------------------------------------------------------
count1.s
-------------------------------------------------------
Author:  Mwilu Siakachoma
ID:      169107092
Email:   siak7092@mylaurier.ca
Date:    2026-02-12
-------------------------------------------------------
A simple count down program (bgt)
-------------------------------------------------------
*/
.org 0x1000  // Start at memory location 1000
.text        // Code section
.global _start
_start:

.text // code section
// Store data in registers
mov r3, #5  // Initialize a countdown value

TOP:
sub r3, r3, #1 // Decrement the countdown value
cmp r3, #0  // Compare the countdown value to 0
bge TOP         // Branch to TOP if > 0 //changed to bge

_stop:
b _stop

.end