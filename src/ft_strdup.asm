
section .text
	global ft_strdup
	extern ft_strlen
	extern ft_calloc
	extern ft_strcpy

ft_strdup:
	push r12
	push r13
	sub rsp, 8

	mov r12, rdi

	call ft_strlen

	inc rax
	mov r13, rax

	mov rdi, r13
	mov rsi, 1
	call ft_calloc

	test rax, rax
	jz error

	mov rdi, rax
	mov rsi, r12
	call ft_strcpy

	jmp end

error:
	xor rax, rax

end:
	add rsp, 8
	pop r13
	pop r12
	ret
