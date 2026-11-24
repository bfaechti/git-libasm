# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcpy.asm                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bfaechti <benjamin.faechtig@gmail.com>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/11/23 15:23:25 by bfaechti          #+#    #+#              #
#    Updated: 2026/11/23 15:31:15 by bfaechti         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global ft_strcpy

ft_strcpy:
	mov rax, rdi	; Save dest adresse

loop:
	mov al, [rsi]	; read src char
	mov [rdi], al	; copy in dest

	inc rsi			; increment of src char
	inc rdi			; increment of dest char

	cmp al, 0		; (char == '\0') ? 1 : 0;
	jne loop		; if 0, continue loop

	mov rax, rdx	; stock last char
	ret				;