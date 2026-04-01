/*
-------------------------------------------------------
l05_t02.s
-------------------------------------------------------
Author:  Mwilu Siakachoma
ID:      169107092
Email:   siak7092@mylaurier.ca
Date:    2026-03-06
-------------------------------------------------------
Calculates stats on an integer list.
-------------------------------------------------------
*/
.org 0x1000  // Start at memory location 1000
.text        // Code section
.global _start
_start:

mov    r1, #0       // Initialize counters
mov    r2, #0
mov    r3, #0
ldr    r4, =Data    // Store address of start of list
ldr    r5, =_Data   // Store address of end of list
bl     list_stats   // Call subroutine - total returned in r0

_stop:
b      _stop

//-------------------------------------------------------
list_stats:
/*
-------------------------------------------------------
Counts number of positive, negative, and 0 values in a list.
Equivalent of: void stats(*start, *end, *zero, *positive, *negatives)
-------------------------------------------------------
Parameters:
  r1 - number of zero values
  r2 - number of positive values
  r3 - number of negative values
  r4 - start address of list
  r5 - end address of list
Uses:
  r0 - temporary value
-------------------------------------------------------
*/

// your code here

stmfd sp!, {r4, r5}   // preserve r4 and r5

loop:
cmp   r4, r5  // compare the start and the end of the list to see if they are the same
beq   finished // if they are the same that means its the end of the list and we branch

ldr   r0, [r4], #4 // load the current value in address of r4 into r0

cmp   r0, #0    //comparing to see if the current value is 0
beq   zero_value //if it is zero then branch to increment zero value counter
bgt   positive_value //if it is a positive value then branch to increment the positive number counter

add   r3, r3, #1  //negative values count is incremented
b     loop 

zero_value:
add   r1, r1, #1  //if the value is indeed zero then the zero_count is incremented
b     loop

positive_value:
add   r2, r2, #1 //if the value is positive then positive number count is incremented
b     loop

finished:
ldmfd sp!, {r4, r5}  // restore r4 and r5 from stack
mov   pc, lr  // return from subroutine

.data
.align
Data:
.word   4,5,-9,0,3,0,8,-7,12    // The list of data
_Data: // End of list address

.end
