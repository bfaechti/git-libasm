# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bfaechti <benjamin.faechtig@gmail.com>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/11/16 15:15:38 by bfaechti          #+#    #+#              #
#    Updated: 2026/11/16 15:20:17 by bfaechti         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

CC = gcc
NASM = nasm
AR = ar
RM = rm -f

CFLAGS = -Wall -Wextra -Werror
NASMFLAGS = -f elf64

SRC =	src/ft_calloc.asm
		src/ft_read.asm
		src/ft_strcmp.asm
		src/ft_strcpy.asm
		src/ft_strdup.asm
		src/ft_strlen.asm
		src/ft_write.asm

OBJ = $(SRC:.s=.o)

all: $(NAME)

$(NAME): &(OBJ)
	$(AR) rcs $(NAME) $(OBJ)

%.o: %.s
	$(NASM) $(NASMFLAGS) $< -o $@

test: $(NAME)
	$(CC) $(CFLAGS) main.c -I include -L. -lasm -o test
	./test

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME) test

re: fclean all

.PHONY: all clean fclean re test