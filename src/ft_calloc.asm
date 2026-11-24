
section .text
	global ft_calloc
	extern malloc
	extern __errno_location

ft_calloc:
	push r12
	push r13
	sub rsp, 8

	mov rax, rdi
	mul rsi

	test rdx, rdx
	jnz overflow

	mov r12, rax
	mov rdi, rax

	call malloc wrt ..plt

	test rax, rax
	jz finish

	mov r13, rax

	mov rdi, r13
	mov rcx, r12
	xor eax, eax
	cld
	rep stosb

	mov rax, r13
	jmp finish

overflow:
	call __errno_location wrt ..plt
	mov dword [rax], 12
	xor eax, eax

finish:
	add rsp, 8
	pop r13
	pop r12
	ret