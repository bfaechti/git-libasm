# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_write.asm                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bfaechti <benjamin.faechtig@gmail.com>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/11/19 11:31:51 by bfaechti          #+#    #+#              #
#    Updated: 2026/11/19 13:27:38 by bfaechti         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global ft_write
	extern __errno_location

ft_write:
	mov rax, 1	;
	syscall		;

	cmp rax, 0	;
	jl error	;
	ret			;

error:
	neg rax					;
	mov rdi, rax			;
	call __errno_location	;
	mov [rax], edi			;
	mov rax, -1				;
	ret						;