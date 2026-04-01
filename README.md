# CP216 – Introduction to Microprocessors

**Wilfrid Laurier University**  
**Language:** ARM Assembly (ARMv7) | **Tools:** CPUlator Computer System Simulator (DE1-SoC)

---

## About This Course

CP216 is a comprehensive study of microprocessor architecture and ARM assembly language programming. Topics covered include:

- Introduction to microprocessor architecture and organization
- Number systems (binary, hexadecimal, decimal conversion)
- ARM registers, addressing modes, and memory
- ARM Instruction Set Architecture (ISA)
- Arithmetic and logical operations in ARM assembly
- Conditional statements and loops in ARM assembly
- Subroutines and the call stack
- ARM interrupts, exceptions, and system calls
- I/O peripheral programming (LEDs, seven-segment displays, UART)
- ARM memory hierarchy
- Relationship between assembly language and high-level languages

All programs are written in ARMv7 assembly and run on the CPUlator DE1-SoC simulator.

---

## Repository Structure

```
CP216-Introduction-to-Microprocessors/
├── README.md
└── Labs/
    ├── lab_01/
    │   ├── task01.s
    │   ├── task02.s
    │   └── ...
    ├── lab_02/
    └── ... (lab_01 through lab_09)
```

### Labs (`Labs/`)
9 labs completed throughout the course. Each lab contains multiple ARM assembly tasks covering the weekly topic, run and tested using the CPUlator simulator.

---

## Code Style

All ARM assembly files follow the CP216 documentation standard:

```asm
@ ----------------------------------------------------
@ File:    filename.s
@ Lab:     lXX
@ Task:    tXX
@ Author:  [Name]
@ ID:      [Student ID]
@ Email:   [Email]
@ ----------------------------------------------------

.global _start
_start:
    @ your code here
```

---

## Topics by Week (General Outline)

| Week | Topic |
|------|-------|
| 1 | Introduction to CPUlator, ARM basics |
| 2 | Number systems, binary and hex |
| 3 | Registers, memory, addressing modes |
| 4 | Arithmetic and logical operations |
| 5 | Conditional statements and branching |
| 6 | Loops in ARM assembly |
| 7 | Subroutines and the stack |
| 8 | Interrupts and exceptions |
| 9 | I/O programming — UART, LEDs, displays |

---

## Tools

- **CPUlator**: A browser-based ARM simulator — [cpulator.01xz.net](https://cpulator.01xz.net/)
- **Architecture**: ARMv7 on the DE1-SoC computer system

---

*Course offered at Wilfrid Laurier University, Department of Physics and Computer Science.*
