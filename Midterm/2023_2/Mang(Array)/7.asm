.data
    arraySize:  .word   0  
    array:      .space  0     
    nhapKTMsg:  .asciiz     "Nhap kich thuoc mang: "
    nhapSoMsg:  .asciiz     "Nhap mot phan tu cua mang: "
    vitriMsg:   .asciiz     "So duong nho nhat o vi tri thu "
    giatriMsg:  .asciiz     " trong mang co gia tri la "
    errorMsg:   .asciiz     "Error: khong the tim so duong be nhat trong mang."
.text
    li  $v0, 4
    la  $a0, nhapKTMsg              # doc kich thuoc mang
    syscall
    li  $v0, 5
    syscall
    sw  $v0, arraySize              # luu kich thuoc mang

    sll $t0, $v0, 2                 # $t0 = arraySize * 4
    la  $t1, array               
    sw  $t0, 0($t1)                 # Luu dia chi cua mang vao array

    la  $t0, array                  # Dat $t0 la con tro dia chi cua mang
    li  $t1, 0                      # tao bien dem vong lap
    lw  $t7, arraySize              # luu kich thuoc mang vao $t7
read_loop:
    beq $t1, $t7, find_smallest     # neu da doc het mang, chuyen sang tim so duong nho nhat

    li  $v0, 4
    la  $a0, nhapSoMsg              # in ra "Nhap 1 phan tu cua mang: "
    syscall 
    li  $v0, 5                      # doc phan tu cua mang
    syscall
    sw  $v0, 0($t0)

    addi $t1, $t1, 1                # tang bien dem va dia chi cua mang
    addi $t0, $t0, 4
    j   read_loop
find_smallest:
    li  $t2, 2147483647             # So duong lon nhat de so sanh
    li  $t3, -1                     # Vi tri cua so duong nho nhat
    la $t0, array                   # Dat lai con tro mang
    li $t1, 0

find_loop:
    beq $t1, $t7, check_smallest    # neu da duyet het mang, 
                                    # kiem tra so duong nho nhat (re nhanh toi check_smallest)
    lw $t4, 0($t0)                  # doc phan tu hien tai cua mang
    bltz $t4, skip_update           # neu phan tu hien tai la so am, bo qua
    bge $t4, $t2, skip_update       # neu phan tu hien tai khong nho hon so duong nho nhat, bo qua
    move $t2, $t4
    move $t3, $t1
skip_update:                        # tang bien dem va dia chi cua mang
    addi $t1, $t1, 1
    addi $t0, $t0, 4
    j find_loop

check_smallest:                     # neu 2147483647 van la so lon nhat, in ra loi
    beq $t2, 2147483647, print_error  
print_smallest:
    li $v0, 4
    la $a0, vitriMsg                # in ra "So duong nho nhat o vi tri thu "
    syscall
    addi $t3, $t3, 1                # a[i] -> vi tri phan tu la i+1
    li $v0, 1
    move $a0, $t3                   # in ra vi tri phan tu
    syscall

    li $v0, 4
    la $a0, giatriMsg               # in ra " trong mang co gia tri la "
    syscall
    li $v0, 1
    move $a0, $t2                   # in ra so duong nho nhat
    syscall
    
    j exit
print_error:
    li $v0, 4
    la $a0, errorMsg                # in ra thong bao loi
    syscall
exit:
    # thoat chuong trinh
    li $v0, 10
    syscall