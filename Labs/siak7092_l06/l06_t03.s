/*
-------------------------------------------------------
l06_t03.s
-------------------------------------------------------
Author:  Mwilu Siakachoma
ID:      169107092
Email:   siak7092@mylaurier.ca
Date:    2026-03-13
-------------------------------------------------------
Working with stack frames.
Finds the common prefix of two null-terminate strings.
-------------------------------------------------------
*/
// Constants
.equ SIZE, 80

.org 0x1000  // Start at memory location 1000
.text        // Code section
.global _start
_start:

//=======================================================

// push parameters onto the stack

mov    r3, #SIZE
stmfd  sp!, {r3}        //push max size

ldr    r3, =Common
stmfd  sp!, {r3}        //push common string address

ldr    r3, =Second
stmfd  sp!, {r3}        //push second string address

ldr    r3, =First
stmfd  sp!, {r3}        //push first string address

//=======================================================

bl     FindCommon

//=======================================================

// clean up stack
add    sp, sp, #16      //removing 4 parameters from stack

//=======================================================

_stop:
b      _stop

//-------------------------------------------------------
FindCommon:
/*
-------------------------------------------------------
Equivalent of: FindCommon(*first, *second, *common, size)
Finds the common parts of two null-terminated strings from the beginning of the
strings. Example:
first: "pandemic"
second: "pandemonium"
common: "pandem", length 6
-------------------------------------------------------
Parameters:
  first - pointer to start of first string
  second - pointer to start of second string
  common - pointer to storage of common string
  size - maximum size of common
Uses:
  r0 - address of first
  r1 - address of second
  r2 - address of common
  r3 - value of max length of common
  r4 - character in first
  r5 - character in second
-------------------------------------------------------
*/

//=======================================================

// prologue: save registers and get parameters from stack

stmfd  sp!, {fp, lr}    //save fp and return address
mov    fp, sp           //set up stack frame
stmfd  sp!, {r0-r5}    //save working registers

ldr    r0, [fp, #8]    //first string address
ldr    r1, [fp, #12]    //second string address
ldr    r2, [fp, #16]    //common string address
ldr    r3, [fp, #20]    //max size

//=======================================================


FCLoop:
cmp    r3, #1          // is there room left in common?
beq    _FindCommon     // no, leave subroutine
ldrb   r4, [r0], #1    // get next character in first
ldrb   r5, [r1], #1    // get next character in second
cmp    r4, r5
bne    _FindCommon     // if characters don't match, leave subroutine
cmp    r5, #0          // reached end of first/second?
beq    _FindCommon
strb   r4, [r2], #1    // copy character to common
sub    r3, r3, #1      // decrement space left in common
b      FCLoop

_FindCommon:
mov    r4, #0
strb   r4, [r2]        // terminate common with null character

//=======================================================

// epilogue: clean up stack and return from subroutine

ldmfd  sp!, {r0-r5}     //restore registers
ldmfd  sp!, {fp, pc}    //restore fp and return

//=======================================================

//-------------------------------------------------------
.data
First:
.asciz "pandemic"
Second:
.asciz "pandemonium"
Common:
.space SIZE

.end
