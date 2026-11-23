# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.asm                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bfaechti <benjamin.faechtig@gmail.com>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/11/16 14:42:53 by bfaechti          #+#    #+#              #
#    Updated: 2026/11/19 13:16:32 by bfaechti         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global ft_strlen

ft_strlen:
	xor rax, rax			; i = 0

.loop:
	cmp byte [rdi + rax], 0	;
	je .end					; if NULL, its end

	inc rax					; i++
	jmp .loop				;

.end:
	ret						; return value in RAX