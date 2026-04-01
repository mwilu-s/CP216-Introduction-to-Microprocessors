/*
-------------------------------------------------------
l05_t01.s
-------------------------------------------------------
Author:  Mwilu Siakachoma
ID:      169107092
Email:   siak7092@mylaurier.ca
Date:    2026-03-06
-------------------------------------------------------
Does a running total of an integer list.
-------------------------------------------------------
*/
.org 0x1000  // Start at memory location 1000
.text        // Code section
.global _start
_start:

ldr    r1, =Data    // Store address of start of list
ldr    r2, =_Data   // Store address of end of list
bl     list_total   // Call subroutine - total returned in r0

_stop:
b      _stop

//-------------------------------------------------------
list_total:
/*
-------------------------------------------------------
Totals values in a list.
Equivalent of: int total(*start, *end)
-------------------------------------------------------
Parameters:
  r1 - start address of list
  r2 - end address of list
Uses:
  r3 - temporary value
Returns:
  r0 - total of values in list
-------------------------------------------------------
*/

// your code here

mov r0, #0  //Initialise the r0 to 0

loop:
cmp r1, r2     //comparing if the start is the same as the end
beq finished   //branch to "finished" if the above is indeed true (z=1)

ldr r3, [r1], #4  //loading the value in r1 into r3
add r0, r0, r3 //add r3 to the sum of r0

b loop      //branch to loop

finished:
mov pc, lr    //return from subroutine which is to branch to linking register

.data
.align
Data:
.word   4,5,-9,0,3,0,8,-7,12    // The list of data
_Data: // End of list address

.end
