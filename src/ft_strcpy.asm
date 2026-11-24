
section .text
	global ft_strcpy

ft_strcpy:
	mov rdx, rdi

.loop:
	mov al, [rsi]
	mov [rdi], al
	inc rsi
	inc rdi
	test al, al
	jne .loop

	mov rax, rdx
	ret