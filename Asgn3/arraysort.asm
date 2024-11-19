.globl swap 
.globl selectionSort

#void selectionSort(int arr[], int i, int n){
selectionSort:

	addi sp, sp -16 
	sw s0, 0(sp)
	sw s1, 4(sp)
	sw s2, 8(sp)
	sw ra, 12(sp)	

# callee setup goes here

    #/* find the minimum element in the unsorted subarray `[i…n-1]`

    #// and swap it with `arr[i]`  */

#    int j;
	
	mv s0, a0 # input array
	mv s1, a1 # start index 
	mv s2, a2 # array length
	mv t0, s1 # intialize J as i 

	
	

#    int min = i;

	mv t1, a1 # int min  




#    for (j = i + 1; j < n; j++)    {



	for:
		bge t0, s2, end_for # j < n
		li t6, 4 # loading value 4 because . word is 4 bytes. 
		mul t2, t0, t6  # caculating offest value of element arr[j]
		add t3, s0, t2 # computing address of element at arr[j]
		lw t4, 0(t3) #loading value of arr[j]
		mul t2, t1, t6 # calculating offest value of element at arr[min]
		add t3, s0, t2 # computing address of element at arr[min]
		lw t5, 0(t3) #loading value of arr[min]
		blt t4, t5, new_minimum #arr[j] < arr[min]
		b continue 
		new_minimum: 
			mv t1, t0 # setting new minum
	continue: 
		addi t0, t0, 1 # incremeting j
		b for 
	end_for: 
		#sotring arguments for swap subroutine 
		mv a0, s0 
		mv a1, t1 
		mv a2, s1 
		jal swap 
		addi t0, s1, 1 # setting i up for if statement 
		blt t0, s2, repeat # i+ 1 < n 
		b done 
		repeat: 
			mv a0, s0
			mv a1, t0 
			mv a2, s2
			jal selectionSort
	done: 
		lw s0, 0(sp) #restoring s0 onto stack 
		lw s1, 4(sp) 
		lw s2, 8(sp) 
		lw ra, 12(sp) 
		addi sp, sp , 16
		ret
		
	
swap: 
	
	
	
	
	li t6,4 #loading value 4 (represents 4 bytes)
	mul t0, a1 , t6 # caculating offset value of element at arr[i]
	add t1, a0, t0  # computing address of element at arr[i]
	lw t2, 0(t1) # loading value of arr[i]
	
	
	
	
	mul t3, a2, t6 # calculating offset value of element at arr[i]
	add t4, a0, t3 # computing address of element at arr[i]
	lw t5, 0(t4) # loading value arr[j]
	
	
	
	
	sw t5, 0(t1) # storing contnets in t5 in arr[i]
	sw t2, 0(t4) # storing contents in t2 in arr[j]
	
	
	
	ret 
	


