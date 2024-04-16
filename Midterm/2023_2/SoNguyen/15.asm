.data
promptM: .asciiz "Nhap M: "
promptN: .asciiz "Nhap N: "
promptQ: .asciiz "Nhap Q: "
result: .asciiz "Cac uoc cua Q trong [M,N] la: "
noDivisor: .asciiz "-1"
space: .asciiz " "

.text
.globl main
main:
    # doc M
    li $v0, 4
    la $a0, promptM
    syscall
    li $v0, 5
    syscall
    move $t0, $v0  # luu M vao $t0

    # doc N
    li $v0, 4
    la $a0, promptN
    syscall
    li $v0, 5
    syscall
    move $t1, $v0  # luu N vao $t1

    # doc Q
    li $v0, 4
    la $a0, promptQ
    syscall
    li $v0, 5
    syscall
    move $t2, $v0  # luu Q vao $t2

    # dat flag kiem tra xem co uoc nao khong ve false
    li $t3, 0

    # lap i tu M den N
    move $t4, $t0  # i = M

    li $v0, 4
    la $a0, result
    syscall
loop:
    beq $t4, $t1, endLoop  # neu i > N, thoat khoi vong lap

    # kiem tra xem i co phai la uoc cua Q khong
    rem $t5, $t2, $t4  # t5 = Q mod i
    beqz $t5, printDivisor  # neu t5 = 0, i la uoc cua Q

    # tang i len 1 va tiep tuc vong lap
    addi $t4, $t4, 1
    j loop

printDivisor:
    # Print i
    li $v0, 1
    move $a0, $t4
    syscall

    li $v0, 4
    la $a0, space
    syscall

    # dat flag kiem tra xem co uoc nao khong ve true
    li $t3, 1

    # tang i len 1 va tiep tuc vong lap
    addi $t4, $t4, 1
    j loop

endLoop:
    # neu khong co uoc nao, in ra -1
    beqz $t3, printNoDivisor
    j exit

printNoDivisor:
    li $v0, 4
    la $a0, noDivisor
    syscall

exit:
    # Exit program
    li $v0, 10
    syscall
