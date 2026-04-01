/*
-------------------------------------------------------
errors1.s
-------------------------------------------------------
Author:  Mwilu Siakachoma
ID:      169107092
Email:   siak7092@mylaurier.ca
Date:    2026-02-06
-------------------------------------------------------
Assign to and add contents of registers.
-------------------------------------------------------
*/
.org 0x1000  // Start at memory location 1000
.text        // Code section
.global _start
_start:

// Copy data from memory to registers
ldr r3, =A; //error 1, synatx error
ldr r0, [r3]
ldr r3, =B //error 2, syntax error
ldr r1, [r3]
add r2, r1, r0 //error 3, syntax error
// Copy data to memory
ldr r3, =Result // Assign address of Result to r3
str r2, [r3] // Store contents of r2 to address in r3
// End program
_stop:
b _stop

.data      // Initialized data section
A:
.word 4
B:
.word 8
.bss     // Uninitialized data section
Result:
.space 4 // Set aside 4 bytes for result

.end
