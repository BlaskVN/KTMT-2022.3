.data
array: .space 400      # Dành không gian cho 100 phần tử mảng, mỗi phần tử 4 byte
size:  .word 0         # Biến lưu trữ kích thước của mảng
count: .word 0         # Biến lưu trữ số lượng phần tử có giá trị khác nhau

prompt_size:        .asciiz "Nhập kích thước của mảng: "
prompt_elements:    .asciiz "Nhập các phần tử của mảng: "
result_msg:         .asciiz "Số lượng phần tử có giá trị khác nhau: "

.text
.globl main
main:
    # Nhập kích thước của mảng
    li $v0, 4
    la $a0, prompt_size
    syscall

    li $v0, 5
    syscall
    sw $v0, size       # Lưu kích thước vào biến 'size'

    # Nhập các phần tử của mảng
    li $v0, 4
    la $a0, prompt_elements
    syscall

    la $t0, array      # Địa chỉ bắt đầu của mảng
    lw $t1, size       # Lấy kích thước mảng
    li $t2, 0          # Biến đếm số lần lặp

read_loop:
    beq $t2, $t1, process  # Nếu đã nhập đủ số lượng phần tử, chuyển sang xử lý
    li $v0, 5
    syscall
    sw $v0, 0($t0)     # Lưu giá trị nhập vào mảng
    addiu $t0, $t0, 4  # Chuyển đến vị trí tiếp theo trong mảng
    addiu $t2, $t2, 1  # Tăng biến đếm
    j read_loop

process:
    # Khởi tạo các biến cần thiết cho việc đếm
    lw $t4, size       # Lấy kích thước mảng
    li $t5, 0          # Số lượng phần tử khác nhau
    li $t6, 0          # Chỉ số phần tử hiện tại

outer_loop:
    beq $t6, $t4, done # Nếu đã kiểm tra hết mảng, kết thúc
    lw $t7, array($t6) # Lấy giá trị phần tử hiện tại

    # Kiểm tra xem phần tử này đã xuất hiện trước đó hay chưa
    li $t8, 0          # Chỉ số phần tử để so sánh
    li $t9, 0          # Cờ kiểm tra phần tử trùng lặp

inner_loop:
    beq $t8, $t6, update_count # Nếu đã so sánh hết các phần tử trước đó, cập nhật đếm
    lw $t0, array($t8) # Lấy giá trị phần tử để so sánh
    beq $t0, $t7, found_duplicate # Nếu tìm thấy trùng lặp, bỏ qua phần tử này
    addiu $t8, $t8, 1  # Chuyển đến phần tử tiếp theo để so sánh
    j inner_loop

found_duplicate:
    li $t9, 1          # Đánh dấu đã tìm thấy trùng lặp
    j update_count

update_count
  j update_count

update_count:
    beq $t9, 0, increment_count # Nếu không tìm thấy trùng lặp, tăng số lượng
    j next_element

increment_count:
    addiu $t5, $t5, 1  # Tăng số lượng phần tử khác nhau

next_element:
    addiu $t6, $t6, 1  # Chuyển đến phần tử tiếp theo trong mảng
    j outer_loop

done:
    # In kết quả
    li $v0, 4
    la $a0, result_msg
    syscall

    li $v0, 1
    move $a0, $t5
    syscall

    # Kết thúc chương trình
    li $v0, 10
    syscall