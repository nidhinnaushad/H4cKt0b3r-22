BITS 32

extern printf

section .rodata
	hello: db "Hello world!", 10, 0

section .text
	global main

	main:

	push ebp
	mov ebp, esp
	sub esp, 0x4

	push hello
	call printf

	leave
	ret
