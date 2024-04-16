.data
promptM: .asciiz "Nhap M: "
promptN: .asciiz "Nhap N: "
result: .asciiz "Uoc chung lon nhat la: "

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

    # Tinh UCLN
UCLN_loop:
    beq $t1, $zero, end_UCLN  # neu N = 0 thi ket thuc
    rem $t2, $t0, $t1  # T2 = M mod N
    move $t0, $t1  # M = N
    move $t1, $t2  # N = M mod N
    j UCLN_loop

end_UCLN:
    # Print UCLN
    li $v0, 4
    la $a0, result
    syscall
    li $v0, 1
    move $a0, $t0
    syscall

    # Exit program
    li $v0, 10
    syscall
