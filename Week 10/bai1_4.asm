.eqv MONITOR_SCREEN 0x10010000   
.eqv RED            0x00FF0000   
.eqv GREEN          0x0000FF00
.eqv BLUE           0x000000FF
.eqv WHITE          0x00FFFFFF
.eqv BLACK          0x00000000
.eqv YELLOW         0x00FFFF00
.eqv CYAN           0x0000FFFF
.eqv MAGENTA        0x00FF00FF
.text
    li $k0, MONITOR_SCREEN        
    li $t0, 0                    
    li $t1, 8                     
    li $t2, 8                     
    li $t3, 4                     
loop:
    beq $t0, $t1, end             
    li $t4, 0                     
    move $t5, $t0
    andi $t5, $t5, 1              
col_loop:
    beq $t4, $t2, next_row        
    move $t6, $t4
    andi $t6, $t6, 1             
    beq $t5, $t6, draw_white     
    li $t7, WHITE              
    j draw
draw_white:
    li $t7, BLUE
draw:
    sw $t7, 0($k0)                
    addu $k0, $k0, $t3           
    addiu $t4, $t4, 1             
    j col_loop
next_row:
    addiu $t0, $t0, 1           
    j loop
end:
    nop
