
.globl selectionSort
.global swap 
.global printArray

selectionSort: 
	
	addi sp, sp, -16 # saving s0 onto stack
	sw s0, 0(sp) # saving s0 onto stack
	sw s1, 4(sp) # saving s0 onto stack
	sw s2, 8(sp) # saving s0 onto stack
	sw ra, 12(sp) # saving return address
	
	
	# moving arguments 
	
	mv s0, a0 # input array 
	mv s1, a1 # start index --> i
	mv s2, a2 #array length --> n
	
	
	#for loop setup 
	
	addi t0, s1, 1 # for loop iterator ---> i 
	addi t1, s1, 0 # minum element index --> min 
	
	
	
	for_selection_sort: 
		bge t0, s2 , end_for_selection_sort 
		li t6, 16 
		mul t2, t0, t6 
		add t3, s0, t2 
		addi t3, t3, 8 
		lw t4, 0(t3) 
		blt t4, t5, new_minimum 
		b continue 
		new_minimum: 
			mv t1, t0 #setting new minimum 
	continue: 
		addi t0, t0, 1 # incrementing j 
		b for_selection_sort 
	end_for_selection_sort: 
	
	
		mv a0 , s0 
		mv a1, t1 
		mv a2, s1 
		
		jal swap 
		
		addi t0, s1, 1 
		blt t0, s2 , repeat 
		b done 
	
		repeat: 
		 	mv a0, s0 
		 	mv a1, t0 
		 	mv a2, s2
		 	jal selectionSort 
	done: 
		lw s0, 0(sp) # restoring s0 onto stack 
		lw s1, 4(sp) # restoring s0 onto stack 
		lw s2 ,8(sp) # restoring s0 onto stack
		lw ra, 12(sp) # restoring return address
		addi sp, sp , 16 
		ret 
		
swap: 
	li t6, 16 # loading value 16 (one Node = 16 bytes) 
	mul t0, a1, t6 # calculating offest value of element at arr[i]
	add t1, a0, t0 # computing address of element at arr[i]
	
	mul t3, a2, t6 # calculating offset value of element at arr[j]
	add t4, a0, t3 # computing address of elmenet at arr[j]
	
	
	
	#name 
	
	lw t5, 0(t4) # loading first half value for arr[j].name 
	lw t0, 4(t4) # loading second half of value for arr[j].name 
	lw t2, 0(t1) # loading first half of value for arr[i].name 
	lw t3, 4(t1) # 
	sw t5, 0(t1) 
	sw t0, 4(t1) 
	sw t2, 0(t4) 
	sw t3, 4(t4)
	
	
	#courseid 
	
	lw t5, 8(t4) 
	lw t2, 8(t1) 
	sw t5, 12(t1) 
	sw t2, 12(t4) 
	
	
	#coursenum 
	lw t5, 12(t4) #loading value for arr[j] 
	lw t2, 12(t1) 
	sw t5, 12(t1) 
	sw t2, 12(t4)
	
	ret 
	
	

printArray: 
	mv t0, a0 
	li t5, 0 
	
	for_print_array: 
		bge t5, a1, end_for_print_array 
		li t6, 16 
		mul t2, t5, t6
		add t3, t0 , t2 
		
		#student id 
		lw t4, 8(t3) # loading value of arr[i].studentid 
		mv a0, t4 
		li a7, 1 # intiating syste, call for print integer 
		
		ecall 
		
		li t1, ' '
		mv a0, t1 
		li a7, 11 # intiating system call for print char 
		
		ecall # printing a space 
		
		
		#name 
		
		mv a0, t3 
		li a7, 4 
		ecall 
		li t1, ' '
		mv a0, t1 
		li a7, 11 
		ecall 
		
		
		# coursenum 
		lw t4, 12(t3) 
		mv a0, t4 
		li a7, 1 
		ecall 
		
		li t1, '\n' # newline character 
		mv a0, t1 
		li a7, 11 
		ecall 
		
		addi t5, t5, 1
		b for_print_array 
	end_for_print_array: 
		ret 
