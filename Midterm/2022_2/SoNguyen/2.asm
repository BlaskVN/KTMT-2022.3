# Nhập số nguyên dương N từ bàn phím, in ra màn hình dãy số Fibonacci nhỏ hơn N
.data
prompt: .asciiz "Enter a positive integer N: "
result: .asciiz "Fibonacci series less than N: "
space: .asciiz ", "
.text
.globl main

main:
    # Prompt user to enter N
    li $v0, 4
    la $a0, prompt
    syscall

    # Read N from user
    li $v0, 5
    syscall
    move $t0, $v0  # Store N in $t0

    # Initialize Fibonacci series
    li $t1, 0  # First Fibonacci number
    li $t2, 1  # Second Fibonacci number

    # Print the Fibonacci series less than N
    la $a0, result
    li $v0, 4
    syscall

    loop:
        # Print current Fibonacci number
        la $a0, space
        li $v0, 4
        syscall

        move $a0, $t1
        li $v0, 1
        syscall

        # Calculate next Fibonacci number
        addu $t3, $t1, $t2
        move $t1, $t2
        move $t2, $t3

        # Check if next Fibonacci number is less than N
        ble $t3, $t0, loop

exit:
    # Exit program
    li $v0, 10
    syscall