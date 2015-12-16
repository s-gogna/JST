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

.macro __LAND (%lhs, %rhs)
beqz        %lhs, __LAND_FALSE
beqz        %rhs, __LAND_FALSE
li           $a2,        1
j       __LAND_END

__LAND_FALSE:
li           $a2,        0

__LAND_END:
.end_macro

.macro __LOR (%lhs, %rhs)
beqz        %lhs, __LOR_TRUE
beqz        %rhs, __LOR_TRUE
li           $a2,        0
j       __LOR_END

__LOR_TRUE:
li           $a2,        1

__LOR_END:
.end_macro


.data
SPILL_MEMORY: .space 64

.text
add          $fp,      $sp,    $zero
add          $a0,      $fp,    $zero
jal         main
j       PROG_END

main:
CALLEE_FUNCTION_PROLOGUE(3)
la           $t0,    ($fp)
li           $t1,        0
sw           $t1,    ($t0)
la           $t0,  -4($fp)
li           $t1,        0
sw           $t1,    ($t0)
la           $t0,  -8($fp)
li           $t1,        0
sw           $t1,    ($t0)
la           $t0,    ($fp)
lw           $t1,    ($fp)
li           $t2,       10
add          $t3,      $t1,      $t2
sw           $t3,    ($t0)
CALLER_FUNCTION_PROLOGUE()
lw           $t3,    ($fp)
sw           $t3,    ($sp)
sub          $sp,      $sp,        4
jal     print_int
CALLER_FUNCTION_EPILOGUE()
add          $t3,      $v0,    $zero
CALLER_FUNCTION_PROLOGUE()
li           $t3,       10
sw           $t3,    ($sp)
sub          $sp,      $sp,        4
jal     print_char
CALLER_FUNCTION_EPILOGUE()
add          $t3,      $v0,    $zero
la           $t3,    ($fp)
lw           $t0,    ($fp)
li           $t2,        2
sub          $t1,      $t0,      $t2
sw           $t1,    ($t3)
CALLER_FUNCTION_PROLOGUE()
lw           $t1,    ($fp)
sw           $t1,    ($sp)
sub          $sp,      $sp,        4
jal     print_int
CALLER_FUNCTION_EPILOGUE()
add          $t1,      $v0,    $zero
CALLER_FUNCTION_PROLOGUE()
li           $t1,       10
sw           $t1,    ($sp)
sub          $sp,      $sp,        4
jal     print_char
CALLER_FUNCTION_EPILOGUE()
add          $t1,      $v0,    $zero
la           $t1,    ($fp)
lw           $t3,    ($fp)
li           $t2,        2
mul          $t0,      $t3,      $t2
sw           $t0,    ($t1)
CALLER_FUNCTION_PROLOGUE()
lw           $t0,    ($fp)
sw           $t0,    ($sp)
sub          $sp,      $sp,        4
jal     print_int
CALLER_FUNCTION_EPILOGUE()
add          $t0,      $v0,    $zero
CALLER_FUNCTION_PROLOGUE()
li           $t0,       10
sw           $t0,    ($sp)
sub          $sp,      $sp,        4
jal     print_char
CALLER_FUNCTION_EPILOGUE()
add          $t0,      $v0,    $zero
la           $t0,    ($fp)
lw           $t1,    ($fp)
li           $t2,        4
div          $t1,      $t2
MFLO         $t3
sw           $t3,    ($t0)
CALLER_FUNCTION_PROLOGUE()
lw           $t3,    ($fp)
sw           $t3,    ($sp)
sub          $sp,      $sp,        4
jal     print_int
CALLER_FUNCTION_EPILOGUE()
add          $t3,      $v0,    $zero
CALLER_FUNCTION_PROLOGUE()
li           $t3,       10
sw           $t3,    ($sp)
sub          $sp,      $sp,        4
jal     print_char
CALLER_FUNCTION_EPILOGUE()
add          $t3,      $v0,    $zero
la           $t3,    ($fp)
lw           $t0,    ($fp)
li           $t2,        3
DIV          $t0,$t2
MFHI         $t1
sw           $t1,    ($t3)
CALLER_FUNCTION_PROLOGUE()
lw           $t1,    ($fp)
sw           $t1,    ($sp)
sub          $sp,      $sp,        4
jal     print_int
CALLER_FUNCTION_EPILOGUE()
add          $t1,      $v0,    $zero
CALLER_FUNCTION_PROLOGUE()
li           $t1,       10
sw           $t1,    ($sp)
sub          $sp,      $sp,        4
jal     print_char
CALLER_FUNCTION_EPILOGUE()
add          $t1,      $v0,    $zero
CALLER_FUNCTION_PROLOGUE()
li           $t1,       10
sw           $t1,    ($sp)
sub          $sp,      $sp,        4
jal     print_char
CALLER_FUNCTION_EPILOGUE()
add          $t1,      $v0,    $zero
la           $t1,  -4($fp)
la           $t3,    ($fp)
lw           $t2,    ($t3)
add          $t0,      $t2,    $zero
addiu        $t2,      $t2,        1
sw           $t2,    ($t3)
sw           $t0,    ($t1)
CALLER_FUNCTION_PROLOGUE()
lw           $t0,  -4($fp)
sw           $t0,    ($sp)
sub          $sp,      $sp,        4
jal     print_int
CALLER_FUNCTION_EPILOGUE()
add          $t0,      $v0,    $zero
CALLER_FUNCTION_PROLOGUE()
li           $t0,       32
sw           $t0,    ($sp)
sub          $sp,      $sp,        4
jal     print_char
CALLER_FUNCTION_EPILOGUE()
add          $t0,      $v0,    $zero
CALLER_FUNCTION_PROLOGUE()
lw           $t0,    ($fp)
sw           $t0,    ($sp)
sub          $sp,      $sp,        4
jal     print_int
CALLER_FUNCTION_EPILOGUE()
add          $t0,      $v0,    $zero
CALLER_FUNCTION_PROLOGUE()
li           $t0,       10
sw           $t0,    ($sp)
sub          $sp,      $sp,        4
jal     print_char
CALLER_FUNCTION_EPILOGUE()
add          $t0,      $v0,    $zero
la           $t0,  -4($fp)
la           $t1,    ($fp)
lw           $t2,    ($t1)
addiu        $t2,      $t2,        1
sw           $t2,    ($t1)
sw           $t2,    ($t0)
CALLER_FUNCTION_PROLOGUE()
lw           $t2,  -4($fp)
sw           $t2,    ($sp)
sub          $sp,      $sp,        4
jal     print_int
CALLER_FUNCTION_EPILOGUE()
add          $t2,      $v0,    $zero
CALLER_FUNCTION_PROLOGUE()
li           $t2,       32
sw           $t2,    ($sp)
sub          $sp,      $sp,        4
jal     print_char
CALLER_FUNCTION_EPILOGUE()
add          $t2,      $v0,    $zero
CALLER_FUNCTION_PROLOGUE()
lw           $t2,    ($fp)
sw           $t2,    ($sp)
sub          $sp,      $sp,        4
jal     print_int
CALLER_FUNCTION_EPILOGUE()
add          $t2,      $v0,    $zero
CALLER_FUNCTION_PROLOGUE()
li           $t2,       10
sw           $t2,    ($sp)
sub          $sp,      $sp,        4
jal     print_char
CALLER_FUNCTION_EPILOGUE()
add          $t2,      $v0,    $zero
CALLER_FUNCTION_PROLOGUE()
li           $t2,       10
sw           $t2,    ($sp)
sub          $sp,      $sp,        4
jal     print_char
CALLER_FUNCTION_EPILOGUE()
add          $t2,      $v0,    $zero
la           $t2,  -4($fp)
la           $t0,    ($fp)
lw           $t1,    ($t0)
add          $t3,      $t1,    $zero
sub          $t1,      $t1,        1
sw           $t1,    ($t0)
sw           $t3,    ($t2)
CALLER_FUNCTION_PROLOGUE()
lw           $t3,  -4($fp)
sw           $t3,    ($sp)
sub          $sp,      $sp,        4
jal     print_int
CALLER_FUNCTION_EPILOGUE()
add          $t3,      $v0,    $zero
CALLER_FUNCTION_PROLOGUE()
li           $t3,       32
sw           $t3,    ($sp)
sub          $sp,      $sp,        4
jal     print_char
CALLER_FUNCTION_EPILOGUE()
add          $t3,      $v0,    $zero
CALLER_FUNCTION_PROLOGUE()
lw           $t3,    ($fp)
sw           $t3,    ($sp)
sub          $sp,      $sp,        4
jal     print_int
CALLER_FUNCTION_EPILOGUE()
add          $t3,      $v0,    $zero
CALLER_FUNCTION_PROLOGUE()
li           $t3,       10
sw           $t3,    ($sp)
sub          $sp,      $sp,        4
jal     print_char
CALLER_FUNCTION_EPILOGUE()
add          $t3,      $v0,    $zero
la           $t3,  -4($fp)
la           $t2,    ($fp)
lw           $t1,    ($t2)
sub          $t1,      $t1,        1
sw           $t1,    ($t2)
sw           $t1,    ($t3)
CALLER_FUNCTION_PROLOGUE()
lw           $t1,  -4($fp)
sw           $t1,    ($sp)
sub          $sp,      $sp,        4
jal     print_int
CALLER_FUNCTION_EPILOGUE()
add          $t1,      $v0,    $zero
CALLER_FUNCTION_PROLOGUE()
li           $t1,       32
sw           $t1,    ($sp)
sub          $sp,      $sp,        4
jal     print_char
CALLER_FUNCTION_EPILOGUE()
add          $t1,      $v0,    $zero
CALLER_FUNCTION_PROLOGUE()
lw           $t1,    ($fp)
sw           $t1,    ($sp)
sub          $sp,      $sp,        4
jal     print_int
CALLER_FUNCTION_EPILOGUE()
add          $t1,      $v0,    $zero
CALLER_FUNCTION_PROLOGUE()
li           $t1,       10
sw           $t1,    ($sp)
sub          $sp,      $sp,        4
jal     print_char
CALLER_FUNCTION_EPILOGUE()
add          $t1,      $v0,    $zero
CALLER_FUNCTION_PROLOGUE()
li           $t1,       10
sw           $t1,    ($sp)
sub          $sp,      $sp,        4
jal     print_char
CALLER_FUNCTION_EPILOGUE()
add          $t1,      $v0,    $zero
la           $t1,  -4($fp)
lw           $t3,  -4($fp)
lw           $t2,    ($fp)
add          $t0,      $t3,      $t2
sw           $t0,    ($t1)
CALLER_FUNCTION_PROLOGUE()
lw           $t0,  -4($fp)
sw           $t0,    ($sp)
sub          $sp,      $sp,        4
jal     print_int
CALLER_FUNCTION_EPILOGUE()
add          $t0,      $v0,    $zero
CALLER_FUNCTION_PROLOGUE()
li           $t0,       10
sw           $t0,    ($sp)
sub          $sp,      $sp,        4
jal     print_char
CALLER_FUNCTION_EPILOGUE()
add          $t0,      $v0,    $zero
la           $t0,  -4($fp)
lw           $t1,  -4($fp)
lw           $t2,    ($fp)
sub          $t3,      $t1,      $t2
sw           $t3,    ($t0)
CALLER_FUNCTION_PROLOGUE()
lw           $t3,  -4($fp)
sw           $t3,    ($sp)
sub          $sp,      $sp,        4
jal     print_int
CALLER_FUNCTION_EPILOGUE()
add          $t3,      $v0,    $zero
CALLER_FUNCTION_PROLOGUE()
li           $t3,       10
sw           $t3,    ($sp)
sub          $sp,      $sp,        4
jal     print_char
CALLER_FUNCTION_EPILOGUE()
add          $t3,      $v0,    $zero
CALLER_FUNCTION_PROLOGUE()
li           $t3,       10
sw           $t3,    ($sp)
sub          $sp,      $sp,        4
jal     print_char
CALLER_FUNCTION_EPILOGUE()
add          $t3,      $v0,    $zero
la           $t3,  -8($fp)
la           $t0,    ($fp)
lw           $t2,  -4($fp)
sw           $t2,    ($t0)
sw           $t2,    ($t3)
CALLER_FUNCTION_PROLOGUE()
lw           $t2,  -8($fp)
sw           $t2,    ($sp)
sub          $sp,      $sp,        4
jal     print_int
CALLER_FUNCTION_EPILOGUE()
add          $t2,      $v0,    $zero
CALLER_FUNCTION_PROLOGUE()
li           $t2,       32
sw           $t2,    ($sp)
sub          $sp,      $sp,        4
jal     print_char
CALLER_FUNCTION_EPILOGUE()
add          $t2,      $v0,    $zero
CALLER_FUNCTION_PROLOGUE()
lw           $t2,    ($fp)
sw           $t2,    ($sp)
sub          $sp,      $sp,        4
jal     print_int
CALLER_FUNCTION_EPILOGUE()
add          $t2,      $v0,    $zero
CALLER_FUNCTION_PROLOGUE()
li           $t2,       32
sw           $t2,    ($sp)
sub          $sp,      $sp,        4
jal     print_char
CALLER_FUNCTION_EPILOGUE()
add          $t2,      $v0,    $zero
CALLER_FUNCTION_PROLOGUE()
lw           $t2,  -4($fp)
sw           $t2,    ($sp)
sub          $sp,      $sp,        4
jal     print_int
CALLER_FUNCTION_EPILOGUE()
add          $t2,      $v0,    $zero
CALLER_FUNCTION_PROLOGUE()
li           $t2,       10
sw           $t2,    ($sp)
sub          $sp,      $sp,        4
jal     print_char
CALLER_FUNCTION_EPILOGUE()
add          $t2,      $v0,    $zero
CALLER_FUNCTION_PROLOGUE()
li           $t2,       10
sw           $t2,    ($sp)
sub          $sp,      $sp,        4
jal     print_char
CALLER_FUNCTION_EPILOGUE()
add          $t2,      $v0,    $zero
la           $t2,    ($fp)
lw           $t3,    ($fp)
li           $t0,        0
and          $t1,      $t3,      $t0
sne          $t1,      $t1,    $zero
sw           $t1,    ($t2)
CALLER_FUNCTION_PROLOGUE()
lw           $t1,    ($fp)
sw           $t1,    ($sp)
sub          $sp,      $sp,        4
jal     print_int
CALLER_FUNCTION_EPILOGUE()
add          $t1,      $v0,    $zero
CALLER_FUNCTION_PROLOGUE()
li           $t1,       10
sw           $t1,    ($sp)
sub          $sp,      $sp,        4
jal     print_char
CALLER_FUNCTION_EPILOGUE()
add          $t1,      $v0,    $zero
la           $t1,    ($fp)
li           $t2,        1
sw           $t2,    ($t1)
CALLER_FUNCTION_PROLOGUE()
lw           $t2,    ($fp)
sw           $t2,    ($sp)
sub          $sp,      $sp,        4
jal     print_int
CALLER_FUNCTION_EPILOGUE()
add          $t2,      $v0,    $zero
CALLER_FUNCTION_PROLOGUE()
li           $t2,       10
sw           $t2,    ($sp)
sub          $sp,      $sp,        4
jal     print_char
CALLER_FUNCTION_EPILOGUE()
add          $t2,      $v0,    $zero
CALLER_FUNCTION_PROLOGUE()
li           $t2,       10
sw           $t2,    ($sp)
sub          $sp,      $sp,        4
jal     print_char
CALLER_FUNCTION_EPILOGUE()
add          $t2,      $v0,    $zero
la           $t2,  -4($fp)
lw           $t1,    ($fp)
li           $t0,        5
or           $t3,      $t1,      $t0
sne          $t3,      $t3,    $zero
sw           $t3,    ($t2)
CALLER_FUNCTION_PROLOGUE()
lw           $t3,  -4($fp)
sw           $t3,    ($sp)
sub          $sp,      $sp,        4
jal     print_int
CALLER_FUNCTION_EPILOGUE()
add          $t3,      $v0,    $zero
CALLER_FUNCTION_PROLOGUE()
li           $t3,       10
sw           $t3,    ($sp)
sub          $sp,      $sp,        4
jal     print_char
CALLER_FUNCTION_EPILOGUE()
add          $t3,      $v0,    $zero
la           $t3,  -4($fp)
li           $t2,        1
sw           $t2,    ($t3)
CALLER_FUNCTION_PROLOGUE()
lw           $t2,  -4($fp)
sw           $t2,    ($sp)
sub          $sp,      $sp,        4
jal     print_int
CALLER_FUNCTION_EPILOGUE()
add          $t2,      $v0,    $zero
CALLER_FUNCTION_PROLOGUE()
li           $t2,       10
sw           $t2,    ($sp)
sub          $sp,      $sp,        4
jal     print_char
CALLER_FUNCTION_EPILOGUE()
add          $t2,      $v0,    $zero
la           $t2,  -4($fp)
li           $t3,        1
sw           $t3,    ($t2)
CALLER_FUNCTION_PROLOGUE()
lw           $t3,  -4($fp)
sw           $t3,    ($sp)
sub          $sp,      $sp,        4
jal     print_int
CALLER_FUNCTION_EPILOGUE()
add          $t3,      $v0,    $zero
CALLER_FUNCTION_PROLOGUE()
li           $t3,       10
sw           $t3,    ($sp)
sub          $sp,      $sp,        4
jal     print_char
CALLER_FUNCTION_EPILOGUE()
add          $t3,      $v0,    $zero
la           $t3,  -4($fp)
li           $t2,        2
sw           $t2,    ($t3)
CALLER_FUNCTION_PROLOGUE()
lw           $t2,  -4($fp)
sw           $t2,    ($sp)
sub          $sp,      $sp,        4
jal     print_int
CALLER_FUNCTION_EPILOGUE()
add          $t2,      $v0,    $zero
CALLER_FUNCTION_PROLOGUE()
li           $t2,       10
sw           $t2,    ($sp)
sub          $sp,      $sp,        4
jal     print_char
CALLER_FUNCTION_EPILOGUE()
add          $t2,      $v0,    $zero
la           $t2,  -4($fp)
li           $t3,        3
sw           $t3,    ($t2)
CALLER_FUNCTION_PROLOGUE()
lw           $t3,  -4($fp)
sw           $t3,    ($sp)
sub          $sp,      $sp,        4
jal     print_int
CALLER_FUNCTION_EPILOGUE()
add          $t3,      $v0,    $zero
CALLER_FUNCTION_PROLOGUE()
li           $t3,       10
sw           $t3,    ($sp)
sub          $sp,      $sp,        4
jal     print_char
CALLER_FUNCTION_EPILOGUE()
add          $t3,      $v0,    $zero
li           $t3,        0
add          $v0,      $t3,    $zero
CALLEE_FUNCTION_EPILOGUE()
CALLEE_FUNCTION_EPILOGUE()

print_char:
CALLEE_FUNCTION_PROLOGUE(0)
# load $v0 with the value for the print char syscall
li           $v0,       11
# the first (and only) argument is the value to print
lw           $a0,    ($fp)
syscall 
CALLEE_FUNCTION_EPILOGUE()

print_int:
CALLEE_FUNCTION_PROLOGUE(0)
# load $v0 with the value for the print int syscall
li           $v0,        1
# the first (and only) argument is the value to print
lw           $a0,    ($fp)
syscall 
CALLEE_FUNCTION_EPILOGUE()

print_string:
CALLEE_FUNCTION_PROLOGUE(0)
# load $v0 with the value for the print string syscall
li           $v0,        4
# the first (and only) argument is the base address of the null terminated ascii string
la           $a0,    ($fp)
syscall 
CALLEE_FUNCTION_EPILOGUE()

print_float:
CALLEE_FUNCTION_PROLOGUE(0)
# load $v0 with the value for the print float syscall
li           $v0,        2
# the first (and only) argument is the base address of the null terminated ascii string
lwc1        $f12,    ($fp)
syscall 
CALLEE_FUNCTION_EPILOGUE()

PROG_END:
add          $a0,      $v0,    $zero
li           $v0,       17
syscall 