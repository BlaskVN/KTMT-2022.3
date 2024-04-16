.data
promptM: .asciiz "Enter M: "
promptN: .asciiz "Enter N: "
result: .asciiz "Boi chung nho nhat la: "

.text
.globl main
main:
    # Read M
    li $v0, 4
    la $a0, promptM
    syscall
    li $v0, 5
    syscall
    move $t0, $v0  # Store M in $t0

    # Read N
    li $v0, 4
    la $a0, promptN
    syscall
    li $v0, 5
    syscall
    move $t1, $v0  # Store N in $t1

    # Tinh BCNN
BCNN_loop:
    beq $t1, $zero, end_BCNN  # neu N = 0 thi ket thuc
    rem $t2, $t0, $t1  # T2 = M mod N
    move $t0, $t1  # M = N
    move $t1, $t2  # N = M mod N
    j BCNN_loop

end_BCNN:

    # Calculate LCM
    mul $t3, $t0, $t1  # T3 = M * N
    div $t3, $t3, $t0  # T3 = (M * N) / GCD

    # Print BCNN
    li $v0, 4
    la $a0, result
    syscall
    li $v0, 1
    move $a0, $t0
    syscall

    # Exit program
    li $v0, 10
    syscall
