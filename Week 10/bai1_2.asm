#Laboratory Exercise 10, Assignment 2
.eqv SEVENSEG_LEFT 0xFFFF0011   # Dia chi cua den led 7 doan trai. 
                                # Bit 0 = doan a; 
                                # Bit 1 = doan b; ... 
                                # Bit 7 = dau . 
.eqv SEVENSEG_RIGHT 0xFFFF0010  # Dia chi cua den led 7 doan phai 
.eqv SEVENSEG_0 0x3F           # Ma hien thi so 0
.eqv SEVENSEG_1 0x06           # Ma hien thi so 1
.eqv SEVENSEG_2 0x5B           # Ma hien thi so 2
.eqv SEVENSEG_3 0x4F           # Ma hien thi so 3
.eqv SEVENSEG_4 0x66           # Ma hien thi so 4
.eqv SEVENSEG_5 0x6D           # Ma hien thi so 5
.eqv SEVENSEG_6 0x7D           # Ma hien thi so 6
.eqv SEVENSEG_7 0x07           # Ma hien thi so 7
.eqv SEVENSEG_8 0x7F           # Ma hien thi so 8
.eqv SEVENSEG_9 0x6F           # Ma hien thi so 9
.data
    msg:    .asciiz "Nhap vao so nguyen: "
.text
main: 
        li $v0, 4       # print string
        la $a0, msg     # load the message to print
        syscall

        li $v0, 5       # read integer from keyboard
        syscall
        move $t0, $v0   # move the input value to $a0
        li $t3, 10
        div $t0, $t3  # divide $t0 by 10
        mflo $t0          # move the quotient to $t1
        mfhi $t2           # move the remainder to $t2
        
        div $t0, $t3  # divide $t0 by 10
        mfhi $t4  
        move $a0, $t4         # move the converted value to $a0
        jal CONVERT_TO_7SEG   # convert the remainder to 7-segment display value
        nop
        jal SHOW_7SEG_LEFT  # show the left 7-segment display
        nop
        move $a0, $t2        # move the converted value to $a0
        jal CONVERT_TO_7SEG   # convert the remainder to 7-segment display value
        nop
        jal SHOW_7SEG_RIGHT
        # li      $a0, 0x4F       # set value for segments 
        # jal     SHOW_7SEG_RIGHT # show 
        # nop 


        # li      $a0, 0x66       # set value for segments 
        # jal     SHOW_7SEG_LEFT  # show 
        # nop 
exit:   li      $v0, 10 
        syscall 
endmain: 
#--------------------------------------------------------------- 
# Function SHOW_7SEG_LEFT : turn on/off the 7seg 
# param[in] $a0 value to shown 
# remark $t0 changed 
#--------------------------------------------------------------- 
SHOW_7SEG_LEFT: li  $t0, SEVENSEG_LEFT # assign port's address 
                sb  $a0, 0($t0) # assign new value 
                nop 
                jr  $ra 
                nop 
 
#--------------------------------------------------------------- 
# Function SHOW_7SEG_RIGHT : turn on/off the 7seg 
# param[in] $a0 value to shown 
# remark $t0 changed 
#--------------------------------------------------------------- 
SHOW_7SEG_RIGHT:li  $t0, SEVENSEG_RIGHT # assign port's address 
                sb  $a0, 0($t0) # assign new value 
                nop 
                jr  $ra 
                nop 

CONVERT_TO_7SEG:
        beq $a0, 0, ZERO
        beq $a0, 1, ONE
        beq $a0, 2, TWO
        beq $a0, 3, THREE
        beq $a0, 4, FOUR
        beq $a0, 5, FIVE
        beq $a0, 6, SIX
        beq $a0, 7, SEVEN
        beq $a0, 8, EIGHT
        beq $a0, 9, NINE

ZERO:   li $a0, SEVENSEG_0
        jr $ra
ONE:    li $a0, SEVENSEG_1
        jr $ra
TWO:    li $a0, SEVENSEG_2
        jr $ra
THREE:  li $a0, SEVENSEG_3
        jr $ra
FOUR:   li $a0, SEVENSEG_4
        jr $ra
FIVE:   li $a0, SEVENSEG_5
        jr $ra
SIX:    li $a0, SEVENSEG_6
        jr $ra
SEVEN:  li $a0, SEVENSEG_7
        jr $ra
EIGHT:  li $a0, SEVENSEG_8
        jr $ra
NINE:   li $a0, SEVENSEG_9
        jr $ra



