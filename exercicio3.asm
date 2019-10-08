.data
	vowels: .asciiz "AEIOU"
    word: .asciiz "POT"

.text
	la x18 word # loads the address of word
	la x11 vowels # loads the address of vowels
    
    addi x4 x0 0 # word counter
    addi x5 x0 20 # word length
    addi x6 x0 0 # vowel counter
    addi x7 x0 5 # number of vowels
    addi x8 x0 0 # number of vowels in the word
    
word_loop:
	lb x9 0(x18) # load word index
    addi x18 x18 1 # increment word index
    addi x4 x4 1 # increment word loop counter
    vowel_loop:
    	lb x12 0(x11) # load vowels index
        jal x3 compare # go to compare
        addi x11 x11 1 # increment vowel index
        addi x6 x6 1 # increment vowel loop index
        blt x6 x7 vowel_loop # if x6 < x7 go to vowel_loop, else continue
        jal x3 reset_counter # reset counter
    blt x4 x5 word_loop # if x4 < x5 go to word_loop, else continue
    jal x0 end_program # ends the program

reset_counter:
	addi x6 x0 0 # reset x6
    la x11 vowels
	jr x3 # go to where it was called
    
compare:
	beq x9 x12 add_vowel_counter # if x9 == x12 go to add_vowel_counter 
    jr x3 # go to where it was called
    
add_vowel_counter:
	addi x8 x8 1 # increment 1 to the vowel_counter
    jr x3 # go to where it was called
    
    
end_program: