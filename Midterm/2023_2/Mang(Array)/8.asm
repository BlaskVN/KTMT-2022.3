.data
arraySize: .word 0  
array: .space 0  
promptSize: .asciiz "Nhap kich thuoc mang: "
prompt: .asciiz "Nhap 1 phan tu cua mang: "
largestNegPos: .asciiz "So am lon nhat o vi tri thu "
largestNegVal: .asciiz " trong mang co gia tri la "
errorMsg: .asciiz "Error: khong the tim so am lon nhat trong mang."

.text
.globl main
main:

    # doc kich thuoc mang
    li $v0, 4
    la $a0, promptSize
    syscall

    li $v0, 5
    syscall

    # luu kich thuoc mang
    sw $v0, arraySize

    # luu dia chi cua mang
    sll $t0, $v0, 2             # $t0 = arraySize * 4
    la $t1, array  
    sw $t0, 0($t1) 

    # doc cac phan tu cua mang
    la $t0, array               # luu dia chi cua mang vao $t0
    li $t1, 0                   # tao bien dem vong lap
    lw $t7, arraySize           # luu kich thuoc mang vao $t7
read_loop:
    beq $t1, $t7, find_largest  # neu da doc het mang, chuyen sang tim so am lon nhat

    # in ra "Nhap 1 phan tu cua mang: "
    li $v0, 4
    la $a0, prompt
    syscall

    # doc phan tu cua mang
    li $v0, 5
    syscall

    # luu phan tu vao mang
    sw $v0, 0($t0)

    # tang bien dem va dia chi cua mang
    addi $t1, $t1, 1
    addi $t0, $t0, 4
    j read_loop

find_largest:
    # tao bien luu so am lon nhat va vi tri cua no
    li $t2, -2147483646  # So am nho nhat de so sanh
    li $t3, -1  # Vi tri cua so am lon nhat
    
    # Dat lai con tro mang
    la $t0, array
    li $t1, 0

find_loop:
    beq $t1, $t7, check_largest  # neu da duyet het mang, kiem tra so am lon nhat

    # lay phan tu hien tai
    lw $t4, 0($t0)

    # neu phan tu hien tai la so duong hoac khong lon hon so am lon nhat, bo qua
    bgez $t4, skip_update  # neu phan tu hien tai la so duong, bo qua
    ble $t4, $t2, skip_update  # neu phan tu hien tai khong lon hon so am lon nhat, bo qua
    move $t2, $t4
    move $t3, $t1
skip_update:

    # tang bien dem va dia chi cua mang
    addi $t1, $t1, 1
    addi $t0, $t0, 4
    j find_loop

check_largest:
    # neu 0 van la so lon nhat, in ra loi
    beq $t2, 0, print_error  
print_largest:
    # in ra "So am lon nhat o vi tri thu "
    li $v0, 4
    la $a0, largestNegPos
    syscall
    
    addi $t3, $t3, 1
    li $v0, 1
    move $a0, $t3
    syscall

    # in ra " trong mang co gia tri la "
    li $v0, 4
    la $a0, largestNegVal
    syscall
    li $v0, 1
    move $a0, $t2
    syscall

    # thoat chuong trinh
    j exit

print_error:
    # in ra thong bao loi
    li $v0, 4
    la $a0, errorMsg
    syscall

exit:
    # thoat chuong trinh
    li $v0, 10
    syscall
