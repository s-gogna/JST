.macro SAVE_T_REGISTERS
# brace yourself for a long, unrolled loop...
sw           $t0,    ($sp)
subiu        $sp,      $sp,        4
sw           $t1,    ($sp)
subiu        $sp,      $sp,        4
sw           $t2,    ($sp)
subiu        $sp,      $sp,        4
sw           $t3,    ($sp)
subiu        $sp,      $sp,        4
sw           $t4,    ($sp)
subiu        $sp,      $sp,        4
sw           $t5,    ($sp)
subiu        $sp,      $sp,        4
sw           $t6,    ($sp)
subiu        $sp,      $sp,        4
sw           $t7,    ($sp)
subiu        $sp,      $sp,        4
sw           $t8,    ($sp)
subiu        $sp,      $sp,        4
sw           $t9,    ($sp)
subiu        $sp,      $sp,        4
.end_macro

.macro RESTORE_T_REGISTERS
# brace yourself for a long, unrolled loop...
addiu        $sp,      $sp,        4
lw           $t9,    ($sp)
addiu        $sp,      $sp,        4
lw           $t8,    ($sp)
addiu        $sp,      $sp,        4
lw           $t7,    ($sp)
addiu        $sp,      $sp,        4
lw           $t6,    ($sp)
addiu        $sp,      $sp,        4
lw           $t5,    ($sp)
addiu        $sp,      $sp,        4
lw           $t4,    ($sp)
addiu        $sp,      $sp,        4
lw           $t3,    ($sp)
addiu        $sp,      $sp,        4
lw           $t2,    ($sp)
addiu        $sp,      $sp,        4
lw           $t1,    ($sp)
addiu        $sp,      $sp,        4
lw           $t0,    ($sp)
.end_macro

.macro SAVE_SPILL_MEM
# brace yourself for a long, unrolled loop...
lw           $a3, SPILL_MEMORY
sw           $a3,    ($sp)
subiu        $sp,      $sp,        4
lw           $a3, SPILL_MEMORY + 4
sw           $a3,    ($sp)
subiu        $sp,      $sp,        4
lw           $a3, SPILL_MEMORY + 8
sw           $a3,    ($sp)
subiu        $sp,      $sp,        4
lw           $a3, SPILL_MEMORY + 12
sw           $a3,    ($sp)
subiu        $sp,      $sp,        4
lw           $a3, SPILL_MEMORY + 16
sw           $a3,    ($sp)
subiu        $sp,      $sp,        4
lw           $a3, SPILL_MEMORY + 20
sw           $a3,    ($sp)
subiu        $sp,      $sp,        4
lw           $a3, SPILL_MEMORY + 24
sw           $a3,    ($sp)
subiu        $sp,      $sp,        4
lw           $a3, SPILL_MEMORY + 28
sw           $a3,    ($sp)
subiu        $sp,      $sp,        4
lw           $a3, SPILL_MEMORY + 32
sw           $a3,    ($sp)
subiu        $sp,      $sp,        4
lw           $a3, SPILL_MEMORY + 36
sw           $a3,    ($sp)
subiu        $sp,      $sp,        4
lw           $a3, SPILL_MEMORY + 40
sw           $a3,    ($sp)
subiu        $sp,      $sp,        4
lw           $a3, SPILL_MEMORY + 44
sw           $a3,    ($sp)
subiu        $sp,      $sp,        4
lw           $a3, SPILL_MEMORY + 48
sw           $a3,    ($sp)
subiu        $sp,      $sp,        4
lw           $a3, SPILL_MEMORY + 52
sw           $a3,    ($sp)
subiu        $sp,      $sp,        4
lw           $a3, SPILL_MEMORY + 56
sw           $a3,    ($sp)
subiu        $sp,      $sp,        4
lw           $a3, SPILL_MEMORY + 60
sw           $a3,    ($sp)
subiu        $sp,      $sp,        4
.end_macro

.macro RESTORE_SPILL_MEM
# brace yourself for a long, unrolled loop...
addiu        $sp,      $sp,        4
lw           $a3,    ($sp)
sw           $a3, SPILL_MEMORY + 60
addiu        $sp,      $sp,        4
lw           $a3,    ($sp)
sw           $a3, SPILL_MEMORY + 56
addiu        $sp,      $sp,        4
lw           $a3,    ($sp)
sw           $a3, SPILL_MEMORY + 52
addiu        $sp,      $sp,        4
lw           $a3,    ($sp)
sw           $a3, SPILL_MEMORY + 48
addiu        $sp,      $sp,        4
lw           $a3,    ($sp)
sw           $a3, SPILL_MEMORY + 44
addiu        $sp,      $sp,        4
lw           $a3,    ($sp)
sw           $a3, SPILL_MEMORY + 40
addiu        $sp,      $sp,        4
lw           $a3,    ($sp)
sw           $a3, SPILL_MEMORY + 36
addiu        $sp,      $sp,        4
lw           $a3,    ($sp)
sw           $a3, SPILL_MEMORY + 32
addiu        $sp,      $sp,        4
lw           $a3,    ($sp)
sw           $a3, SPILL_MEMORY + 28
addiu        $sp,      $sp,        4
lw           $a3,    ($sp)
sw           $a3, SPILL_MEMORY + 24
addiu        $sp,      $sp,        4
lw           $a3,    ($sp)
sw           $a3, SPILL_MEMORY + 20
addiu        $sp,      $sp,        4
lw           $a3,    ($sp)
sw           $a3, SPILL_MEMORY + 16
addiu        $sp,      $sp,        4
lw           $a3,    ($sp)
sw           $a3, SPILL_MEMORY + 12
addiu        $sp,      $sp,        4
lw           $a3,    ($sp)
sw           $a3, SPILL_MEMORY + 8
addiu        $sp,      $sp,        4
lw           $a3,    ($sp)
sw           $a3, SPILL_MEMORY + 4
addiu        $sp,      $sp,        4
lw           $a3,    ($sp)
sw           $a3, SPILL_MEMORY
.end_macro

.macro CALLEE_FUNCTION_PROLOGUE (%variable_size)
# set $fp to the proper spot by recovering the value from $a0
add          $fp,      $a0,    $zero
# allocate stack space for variables ($sp = $sp - space for variables)
li           $a0,        4
mulu         $a1,      $a0, %variable_size
sub          $sp,      $sp,      $a1
.end_macro

.macro CALLEE_FUNCTION_EPILOGUE
# de-allocate the memory used for local variables and parameters
add          $sp,      $fp,    $zero
# jump back to the caller
jr           $ra
.end_macro

.macro CALLER_FUNCTION_PROLOGUE
# caller should save it's own $ra, $fp, and registers
sw           $ra,    ($sp)
subiu        $sp,      $sp,        4
sw           $fp,    ($sp)
subiu        $sp,      $sp,        4
# caller pushes registers and spill memory onto the stack as well
SAVE_T_REGISTERS()
SAVE_SPILL_MEM()
# save the value of $sp here into $a0 as temporary storage until the arguments are moved
# $fp needs to stay where it's at while the arguments are copied after this macro
add          $a0,      $sp,    $zero
.end_macro

.macro CALLER_FUNCTION_EPILOGUE
# recover the spill memory and the stored registers
RESTORE_SPILL_MEM()
RESTORE_T_REGISTERS()
# recover the caller's $fp and $ra
addiu        $sp,      $sp,        4
lw           $fp,    ($sp)
addiu        $sp,      $sp,        4
lw           $ra,    ($sp)
.end_macro

.data
SPILL_MEMORY: .space 64
.text
add          $fp,      $sp,    $zero
add          $a0,      $fp,    $zero
jal         main
j       PROG_END
main:
CALLEE_FUNCTION_PROLOGUE(1)
la           $t0,    ($fp)
li           $t1,        0
sw           $t1,    ($t0)
la           $t0,    ($fp)
li           $t1,        1
sw           $t1,    ($t0)
LOOP_CONDITION_00010:
lw           $t1,    ($fp)
li           $t0,       30
sle          $t2,      $t1,      $t0
bne          $t2,    $zero, LOOP_BODY_00010
j       LOOP_EXIT_00010
LOOP_BODY_00010:
lw           $t0,    ($fp)
li           $t1,        3
DIV          $t0,$t1
MFHI         $t3
li           $t1,        0
seq          $t0,      $t3,      $t1
bne          $t0,    $zero, IF_TRUE_00001
IF_FALSE_00001:
lw           $t1,    ($fp)
li           $t3,        5
DIV          $t1,$t3
MFHI         $t4
li           $t3,        0
seq          $t1,      $t4,      $t3
bne          $t1,    $zero, IF_TRUE_00002
IF_FALSE_00002:
CALLER_FUNCTION_PROLOGUE()
lw           $t3,    ($fp)
sw           $t3,    ($sp)
sub          $sp,      $sp,        4
jal     print_int
CALLER_FUNCTION_EPILOGUE()
add          $t4,      $v0,    $zero
j       ENDIF_00002
IF_TRUE_00002:
CALLER_FUNCTION_PROLOGUE()
li           $t4,        5
sw           $t4,    ($sp)
sub          $sp,      $sp,        4
jal     print_int
CALLER_FUNCTION_EPILOGUE()
add          $t5,      $v0,    $zero
ENDIF_00002:
j       ENDIF_00001
IF_TRUE_00001:
lw           $t1,    ($fp)
li           $t5,        5
DIV          $t1,$t5
MFHI         $t6
li           $t5,        0
seq          $t1,      $t6,      $t5
bne          $t1,    $zero, IF_TRUE_00003
IF_FALSE_00003:
CALLER_FUNCTION_PROLOGUE()
li           $t5,        3
sw           $t5,    ($sp)
sub          $sp,      $sp,        4
jal     print_int
CALLER_FUNCTION_EPILOGUE()
add          $t6,      $v0,    $zero
j       ENDIF_00003
IF_TRUE_00003:
CALLER_FUNCTION_PROLOGUE()
li           $t6,       35
sw           $t6,    ($sp)
sub          $sp,      $sp,        4
jal     print_int
CALLER_FUNCTION_EPILOGUE()
add          $t7,      $v0,    $zero
ENDIF_00003:
ENDIF_00001:
la           $t0,    ($fp)
lw           $t1,    ($t0)
add          $t7,      $t1,    $zero
addiu        $t1,      $t1,        1
sw           $t1,    ($t0)
j       LOOP_CONDITION_00010
LOOP_EXIT_00010:
li           $t7,        0
add          $v0,      $t7,    $zero
CALLEE_FUNCTION_EPILOGUE()
CALLEE_FUNCTION_EPILOGUE()
print_int:
CALLEE_FUNCTION_PROLOGUE(0)
# load $v0 with the value for the print int syscall
li           $v0,        1
# the first (and only) argument is the value to print
lw           $a0,    ($fp)
syscall 
# print a newline character for readability
# 0x0D is CR or '\r' - 0x0A is LF for '\n'
li           $v0,       11
li           $a0,       10
syscall 
CALLEE_FUNCTION_EPILOGUE()
print_string:
CALLEE_FUNCTION_PROLOGUE(0)
# load $v0 with the value for the print int syscall
li           $v0,        4
# the first (and only) argument is the base address of the null terminated ascii string
la           $a0,    ($fp)
syscall 
CALLEE_FUNCTION_EPILOGUE()
print_float:
CALLEE_FUNCTION_PROLOGUE(0)
# load $v0 with the value for the print int syscall
li           $v0,        2
# the first (and only) argument is the base address of the null terminated ascii string
lwc1        $f12,    ($fp)
syscall 
CALLEE_FUNCTION_EPILOGUE()
PROG_END: