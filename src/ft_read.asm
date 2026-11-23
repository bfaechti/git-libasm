# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_read.asm                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bfaechti <benjamin.faechtig@gmail.com>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/11/23 13:51:22 by bfaechti          #+#    #+#              #
#    Updated: 2026/11/23 14:41:41 by bfaechti         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global ft_read
	extern __errno_location

ft_read:
	mov rax, 0	;
	syscall		;

	cmp rax, 0	;
	jl error	;
	ret			;

error:
	neg rax		;
	mov rdi, rax;

	call __errno_location	;
	mov [rax], edi			;

	mov rax, -1	;
	ret			;