.data
    word: .asciiz "subiI bu"
    space: .asciiz " "

.text
    lb x20 space
	la x18 word
   
    addi x4 x0 7 # word length
    add x19 x18 x4 # end of the word
    
word_loop:
	lb x12 0(x18) # load word index asc
	lb x13 0(x19) # load word index desc
    jal x3 jump_space
    jal x3 compare
    blt x18 x19 word_loop
    jal x0 is_palindrome

jump_space:
	beq x20 x12 increment_index # if x20 == x12 => increments the index
    beq x20 x13 decrement_index # if x20 == x12 => increments the index
    jal x0 compare # jump to compare

compare:
	beq x12 x13 pass_test # if char == char => pass test
    addi x15 x12 32 # uppercase x12
    beq x15 x13 pass_test # if uppercase(char) == char => pass test
    addi x15 x13 32 # uppercase x13
    beq x12 x15 pass_test # if char == uppercase(char) => pass test
    jal x0 fail_test # jump to fail test

increment_index:
	addi x18 x18 1 # increment x18
    lb x12 0(x18) # load new char
    jal x0 jump_space # go to jump_space

decrement_index:
	addi x19 x19 -1 # decrement x19
	lb x13 0(x19) # load new char
    jal x0 jump_space # go to jump_space
    
pass_test:
	addi x18 x18 1  # increment x18
	addi x19 x19 -1 # decrement x19
    jr x3 # go to where it was called
    
fail_test:
	addi a0 x0 0 # register 0 in a0
    jal x0 end_program # end program

is_palindrome:
	addi a0 x0 1 # register 1 in a0
    jal x0 end_program # end program

end_program: