/*
-------------------------------------------------------
intro.s
-------------------------------------------------------
Author: Mwilu Siakachoma
ID:     169107092
Email:  siak7092@mylaurier.ca
Date:   2026-01-23
-------------------------------------------------------
Assign to and add contents of registers.
-------------------------------------------------------
*/
.org 0x1000  // Start at memory location 1000
.text        // Code section
.global _start
_start:

mov r0, #9       // Store decimal 9 in register r0
mov r1, #14     // Store hex E (decimal 14) in register r1 -- task 1
add r2, r1, r0  // Add the contents of r0 and r1 and put result in r2

mov r3, #8      //task 2
add r3, r3, r3  //task 2

//add r4, #4, #5  //task 3
add r4, r2, #5  //task 3 -- second part

// End program
_stop:
b _stop