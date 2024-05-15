.eqv HEADING    0xffff8010              # Integer: An angle between 0 and 359
                                        # 0 : North (up)
                                        # 90: East (right)
                                        # 180: South (down)
                                        # 270: West (left)
.eqv MOVING     0xffff8050              # Boolean: whether or not to move
.eqv LEAVETRACK 0xffff8020              # Boolean (0 or non-0):
                                        # whether or not to leave a track
.eqv WHEREX     0xffff8030              # Integer: Current x-location of MarsBot
.eqv WHEREY     0xffff8040              # Integer: Current y-location of MarsBot
.text
main:
    jal     UNTRACK
    nop
    li      $a0,        115
    jal     ROTATE
    nop               
    jal     GO
    nop
    li      $a0,        5000
    jal     sleep_ms
    nop
    jal     STOP
    nop

main_triangle:
    jal     TRACK                       # Start drawing track line
    nop     
    addi    $a0,        $zero,      150 # Rotate 120 degrees (interior angle of equilateral triangle is 60 degrees, but we need to rotate 120 degrees)
    jal     ROTATE
    nop     
    jal     GO                          # Start running again
    nop     
    li      $a0,        3000            # Sleep for 3000 ms to move along second side
    jal     sleep_ms
    nop     
    jal     UNTRACK                     # Stop drawing track line
    nop
    jal     STOP                        # Stop running
    nop
    addi    $a0,        $zero,      270 # Rotate 120 degrees
    jal     ROTATE
    nop     
    jal     TRACK                       # Start drawing track line
    nop
    jal     GO                          # Start running again
    nop     
    li      $a0,        3000            # Sleep for 3000 ms to move along third side
    jal     sleep_ms
    nop     
    jal     STOP                        # Stop running
    nop
    jal     UNTRACK                     # Stop drawing track line
    nop
    addi    $a0,        $zero,      30 # Rotate 120 degrees
    jal     ROTATE
    nop     
    jal     TRACK                       # Start drawing track line
    nop
    jal     GO                          # Start running again
    nop     
    li      $a0,        3000            # Sleep for 3000 ms to move along second side
    jal     sleep_ms
    nop     
    jal     STOP                        # Stop running
    nop
    jal    UNTRACK                     # Stop drawing track line
    nop
end_triangle:

    jal     UNTRACK
    nop
    li      $a0,        90
    jal     ROTATE
    nop               
    jal     GO
    nop
    li      $a0,        5000
    jal     sleep_ms
    nop
    jal     STOP
    nop

main_square:
    
    addi    $a0,        $zero,      90  # Rotate 90 degrees
    jal     ROTATE
    nop     
    jal     TRACK                       # Start drawing track line
    nop     
    jal     GO                          # Start running
    nop     
    li      $a0,        3000            # Sleep for 3000 ms to move along one side
    jal     sleep_ms
    nop     
    jal     STOP                        # Stop running
    nop
    jal     UNTRACK                     # Stop drawing track line
    nop
    addi    $a0,        $zero,      180  # Rotate 90 degrees
    jal     ROTATE
    nop   
    jal     TRACK                       # Start drawing track line
    nop     
    jal     GO                          # Start running
    nop     
    li      $a0,        3000            # Sleep for 3000 ms to move along one side
    jal     sleep_ms
    nop     
    jal     STOP                        # Stop running
    nop
    jal     UNTRACK                     # Stop drawing track line
    nop
    addi    $a0,        $zero,      270  # Rotate 90 degrees
    jal     ROTATE
    nop   
    jal     TRACK                       # Start drawing track line
    nop     
    jal     GO                          # Start running
    nop     
    li      $a0,        3000            # Sleep for 3000 ms to move along one side
    jal     sleep_ms
    nop     
    jal     STOP                        # Stop running
    nop
    jal     UNTRACK                     # Stop drawing track line
    nop
    addi    $a0,        $zero,      0  # Rotate 90 degrees
    jal     ROTATE
    nop   
    jal     TRACK                       # Start drawing track line
    nop     
    jal     GO                          # Start running
    nop     
    li      $a0,        3000            # Sleep for 3000 ms to move along one side
    jal     sleep_ms
    nop     
    jal     STOP                        # Stop running
    nop
end_square:

    jal     UNTRACK
    nop
    li      $a0,        90
    jal     ROTATE
    nop               
    jal     GO
    nop
    li      $a0,        10000
    jal     sleep_ms
    nop
    jal     STOP
    nop

main_star:
    addi    $a0,        $zero,      162  # Rotate 72 degrees
    jal     ROTATE
    nop     
    jal     TRACK                       # Start drawing track line
    nop     
    jal     GO                          # Start running
    nop     
    li      $a0,        1500            # Sleep for 1500 ms to move along one side
    jal     sleep_ms
    nop     
    jal     STOP                        # Stop running
    nop
    jal     UNTRACK                     # Stop drawing track line
    nop
    addi    $a0,        $zero,      90  # Rotate 72 degrees
    jal     ROTATE
    nop   
    jal     TRACK                       # Start drawing track line
    nop     
    jal     GO                          # Start running
    nop     
    li      $a0,        1500            # Sleep for 1500 ms to move along one side
    jal     sleep_ms
    nop     
    jal     STOP                        # Stop running
    nop
    jal     UNTRACK                     # Stop drawing track line
    nop
    addi    $a0,        $zero,      234  # Rotate 72 degrees
    jal     ROTATE
    nop   
    jal     TRACK                       # Start drawing track line
    nop     
    jal     GO                          # Start running
    nop     
    li      $a0,        1500            # Sleep for 1500 ms to move along one side
    jal     sleep_ms
    nop     
    jal     STOP                        # Stop running
    nop
    jal     UNTRACK                     # Stop drawing track line
    nop
    addi    $a0,        $zero,      162  # Rotate 72 degrees
    jal     ROTATE
    nop   
    jal     TRACK                       # Start drawing track line
    nop     
    jal     GO                          # Start running
    nop     
    li      $a0,        1500            # Sleep for 1500 ms to move along one side
    jal     sleep_ms
    nop     
    jal     STOP                        # Stop running
    nop
    jal     UNTRACK                     # Stop drawing track line
    nop
    addi    $a0,        $zero,      306  # Rotate 72 degrees
    jal     ROTATE
    nop   
    jal     TRACK                       # Start drawing track line
    nop     
    jal     GO                          # Start running
    nop     
    li      $a0,        1500            # Sleep for 1500 ms to move along one side
    jal     sleep_ms
    nop     
    jal     STOP                        # Stop running
    nop
    jal     UNTRACK                     # Stop drawing track line
    nop
    addi    $a0,        $zero,      234  # Rotate 72 degrees
    jal     ROTATE
    nop   
    jal     TRACK                       # Start drawing track line
    nop     
    jal     GO                          # Start running
    nop     
    li      $a0,        1500            # Sleep for 1500 ms to move along one side
    jal     sleep_ms
    nop     
    jal     STOP                        # Stop running
    nop
    jal     UNTRACK                     # Stop drawing track line
    nop
    addi    $a0,        $zero,      18  # Rotate 72 degrees
    jal     ROTATE
    nop   
    jal     TRACK                       # Start drawing track line
    nop     
    jal     GO                          # Start running
    nop     
    li      $a0,        1500            # Sleep for 1500 ms to move along one side
    jal     sleep_ms
    nop     
    jal     STOP                        # Stop running
    nop
    jal     UNTRACK                     # Stop drawing track line
    nop
    addi    $a0,        $zero,      306  # Rotate 72 degrees
    jal     ROTATE
    nop   
    jal     TRACK                       # Start drawing track line
    nop     
    jal     GO                          # Start running
    nop     
    li      $a0,        1500            # Sleep for 1500 ms to move along one side
    jal     sleep_ms
    nop     
    jal     STOP                        # Stop running
    nop
    jal     UNTRACK                     # Stop drawing track line
    nop
    addi    $a0,        $zero,      90  # Rotate 72 degrees
    jal     ROTATE
    nop   
    jal     TRACK                       # Start drawing track line
    nop     
    jal     GO                          # Start running
    nop     
    li      $a0,        1500            # Sleep for 1500 ms to move along one side
    jal     sleep_ms
    nop     
    jal     STOP                        # Stop running
    nop
    jal     UNTRACK                     # Stop drawing track line
    nop
    addi    $a0,        $zero,      18  # Rotate 72 degrees
    jal     ROTATE
    nop   
    jal     TRACK                       # Start drawing track line
    nop     
    jal     GO                          # Start running
    nop     
    li      $a0,        1500            # Sleep for 1500 ms to move along one side
    jal     sleep_ms
    nop     
    jal     STOP                        # Stop running
    nop
    jal     UNTRACK                     # Stop drawing track line
    nop
    jal     STOP
    nop
end_star:


sleep_ms:
    addi    $v0,        $zero,      32  # Syscall for sleep
    syscall 
    jr      $ra                         # Return from procedure
    nop     

#-----------------------------------------------------------
# GO procedure, to start running
# param[in] none
#-----------------------------------------------------------
GO:
	li $at, MOVING 			# change MOVING port
	addi $k0, $zero, 1 		# to logic 1,
	sb $k0, 0($at) 			# to start running
	jr $ra
	
#-----------------------------------------------------------
# STOP procedure, to stop running
# param[in] none
#-----------------------------------------------------------
STOP:
	li $at, MOVING 			# change MOVING port to 0,
	sb $zero, 0($at) 		# to stop
	jr $ra
	
#-----------------------------------------------------------
# TRACK procedure, to start drawing line
# param[in] none
#-----------------------------------------------------------
TRACK:
	li $at, LEAVETRACK 		# change LEAVETRACK port
	addi $k0, $zero,1 		# to logic 1,
	sb $k0, 0($at) 			# to start tracking
	jr $ra
	
#-----------------------------------------------------------
# UNTRACK procedure, to stop drawing line
# param[in] none
#-----------------------------------------------------------
UNTRACK:
	li $at, LEAVETRACK 		# change LEAVETRACK port to 0
	sb $zero, 0($at) 		# to stop drawing tail
	jr $ra
	
#-----------------------------------------------------------
# ROTATE procedure, to rotate the robot
# param[in] $a0, An angle between 0 and 359
# 0 : North (up)
# 90: East (right)
# 180: South (down)
# 270: West (left)
#-----------------------------------------------------------
ROTATE:
	li $at, HEADING 		# change HEADING port
	sw $a0, 0($at) 			# to rotate robot
	jr $ra