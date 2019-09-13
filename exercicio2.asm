addi x10 x0 1
addi x11 x0 2
addi x12 x0 3
addi x13 x0 4
add x13 x0 x0

blt x10 x0 end

addi t1 x0 64
bgt x11 t1 end

addi t1 x0 24
bge t1 x12 end

addi x7 x0 1

end: