.data
    prompt: .asciiz "Nhap xau: "
    str: .space 128
    alphaSum: .word 0
    numSum: .word 0

.text
.globl main
main:
    li $v0, 4
    la $a0, prompt
    syscall

    # doc xau
    li $v0, 8
    la $a0, str
    li $a1, 128
    syscall

    # Khoi tao tong gia tri ASCII cua cac ky tu chu cai va so
    la $t0, alphaSum
    sw $zero, 0($t0)
    la $t1, numSum
    sw $zero, 0($t1)

    # Duyet tung ky tu trong xau
    la $t2, str
process:
    lb $t3, 0($t2)  # doc ky tu hien tai
    beqz $t3, done  # neu ky tu la NULL thi ket thuc

    # Kiem tra ky tu hien tai la chu cai hoac so
    li $t4, '0'
    bge $t3, $t4, check_alpha
    j increment

check_alpha:
    li $t4, '9'
    ble $t3, $t4, is_digit
    li $t4, 'A'
    bge $t3, $t4, check_lower
    j increment

check_lower:
    li $t4, 'Z'
    ble $t3, $t4, is_alpha
    li $t4, 'a'
    bge $t3, $t4, check_end
    j increment

check_end:
    li $t4, 'z'
    ble $t3, $t4, is_alpha
    j increment

is_digit:
    lw $t4, 0($t1)
    add $t4, $t4, $t3
    sub $t4, $t4, '0'
    sw $t4, 0($t1)
    j increment

is_alpha:
    lw $t4, 0($t0)
    add $t4, $t4, $t3
    sw $t4, 0($t0)

increment:
    addiu $t2, $t2, 1
    j process

done:
    # Print the sum of alphanumeric characters
    li $v0, 1
    lw $a0, 0($t1)
    syscall

    # Print the total ASCII code value of all alphabetic characters
    li $v0, 1
    lw $a0, 0($t0)
    syscall

    # Exit
    li $v0, 10
    syscall
