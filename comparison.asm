BITS 32 ; x86 bit codes

extern printf 
extern scanf

section .rodata
	input: db "%d", 0 
	output: db "Correct", 10, 0

section .text
	global main

	main:
		push ebp ; push base pointer to the stack
		mov ebp, esp ; ebp = esp
		sub esp, 0x10 ; create the stackspace

		lea eax, [ebp-0x4] ; load effective address
		push eax
		push input 
		call scanf ; => scanf("%d", [ebp-0x4]);

		mov ecx, dword [ebp-0x4] ; ecx = our input
		cmp ecx, 1234 ; if ecx == 1234 => jump

		je L2 	; jump if equal

		leave 
		ret

	L2:	
		push output
		call printf
		leave 
		ret

