/*
-------------------------------------------------------
l04_t03.s
-------------------------------------------------------
Author:  Mwilu Siakachoma
ID:      169107092
Email:   siak7092@mylaurier.ca
Date:    2026-02-27
-------------------------------------------------------
A simple list demo program. Traverses all elements of an integer list.
r0: temp storage of value in list
r2: address of start of list
r3: address of end of list
-------------------------------------------------------
*/
.org 0x1000  // Start at memory location 1000
.text        // Code section
.global _start
_start:

ldr    r2, =Data    // Store address of start of list
ldr    r3, =_Data   // Store address of end of list

mov r4, #0          //Task 2 -- Initialise the sum of r4 to 0
sub r5, r3, r2       //Task 2 -- The number of bytes that are in the list.

mov r4, #1          //Task 3
ldr r6, [r2], #4    //Task 3 -- r6 = min which is the first value
mov r7, r6          //Task 3 -- r7 = max which is the first value, too


Loop:
cmp    r2, r3      // Task 3, Compare current address with end of list
beq _stop
ldr    r0, [r2], #4 // Read address with post-increment (r0 = *r2, r2 += 4)
add r4, r4, #1      // Task 2 -- We will increment the count

cmp r0, r6          //Task 3 -- checks for min
movlt r6, r0        //Task 3 -- checks for min
cmp r0, r7          //Task 3 -- checks for max
movgt r7, r0        //Task 3 -- checks for max

b   Loop         // Task 3, If not at end, continue

_stop:
b _stop

.data
.align
Data:
.word   4,5,-9,0,3,0,8,-7,12    // The list of data
_Data: // End of list address

.end