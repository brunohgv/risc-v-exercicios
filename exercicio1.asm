addi x4 x0 5
addi x5 x0 4
addi x6 x0 12
add x6 x0 x4

bne x5 x6 elsestatement
sub x6 x5 x4
jal x1 end

elsestatement:
	sub x6 x4 x5

end: