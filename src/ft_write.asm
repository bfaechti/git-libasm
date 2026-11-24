
section .text
	global ft_write
	extern __errno_location

ft_write:
	mov eax, 1
	syscall
	test rax, rax
	js .error
	ret

.error:
	push rbx
	neg eax
	mov ebx, eax
	call __errno_location wrt ..plt
	mov [rax], ebx
	mov rax, -1
	pop rbx
	ret