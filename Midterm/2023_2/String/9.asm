.data
    nhapMsg:      .asciiz "Nhap vao xau ky tu: "
    ketquaMSG:      .asciiz "So nguyen am trong xau la: "
    string_buffer:  .space  256     # dinh nghia bo nho cho xau ky tu
.text
    li  $v0, 4
    la  $a0, nhapMsg                # "Nhap vao xau ky tu: "
    syscall
    li  $v0, 8
    la  $a0, string_buffer
    li  $a1, 256
    syscall
    
    li  $t0, 0                      # Bien dem so nguyen am
    la  $t1, string_buffer          # Con tro tro den dau xau ky tu
count_loop:
    lb $t2, 0($t1)                  # Luu ky tu hien tai vao $t2
    beqz $t2, print_count           # Neu ky tu la NULL, in ket qua

    # Kiem tra ky tu hien tai co phai la nguyen am hay khong
    li $t3, 'a'
    li $t4, 'e'
    li $t5, 'i'
    li $t6, 'o'
    li $t7, 'u'
    bne $t2, $t3, khongNguyenAm
    addi $t0, $t0, 1                    # Neu la nguyen am, tang bien dem
    j increment_pointer
khongNguyenAm:
    bne $t2, $t4, khongNguyenAm_e
    addi $t0, $t0, 1                    # Neu la nguyen am, tang bien dem
    j increment_pointer
    khongNguyenAm_e:
        bne $t2, $t5, khongNguyenAm_i
        addi $t0, $t0, 1                # Neu la nguyen am, tang bien dem
        j increment_pointer
    khongNguyenAm_i:
        bne $t2, $t6, khongNguyenAm_o
        addi $t0, $t0, 1                # Neu la nguyen am, tang bien dem
        j increment_pointer
    khongNguyenAm_o:
        bne $t2, $t7, increment_pointer
        addi $t0, $t0, 1                # Neu la nguyen am, tang bien dem

increment_pointer:
    addi $t1, $t1, 1                    # Tang con tro den ky tu tiep theo
    j count_loop
print_count:
    li $v0, 4
    la $a0, ketquaMSG               # "So nguyen am trong xau la: "
    syscall
    li $v0, 1
    move $a0, $t0                   # In so nguyen am
    syscall
exit:
    li $v0, 10
    syscall