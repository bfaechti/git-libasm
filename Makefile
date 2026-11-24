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
OBJDIR = obj

CC = gcc
NASM = nasm
RM = rm -f

CFLAGS = -Wall -Wextra -Werror
NASMFLAGS = -f elf64

SRC =	src/ft_calloc.asm \
		src/ft_read.asm \
		src/ft_strcmp.asm \
		src/ft_strcpy.asm \
		src/ft_strdup.asm \
		src/ft_strlen.asm \
		src/ft_write.asm

OBJ = $(patsubst src/%.asm,$(OBJDIR)/%.o,$(SRC))

all: $(NAME)

$(NAME): $(OBJ) main.c include/libasm.h
	$(CC) $(CFLAGS) -I include main.c $(OBJ) -o $@

$(OBJDIR):
	mkdir -p $(OBJDIR)

$(OBJDIR)/%.o: src/%.asm | $(OBJDIR)
	$(NASM) $(NASMFLAGS) $< -o $@

test: $(NAME)
	./$(NAME)

clean:
	$(RM) $(OBJ)

fclean: clean
	$(RM) $(NAME) test

re: fclean all

.PHONY: all clean fclean re test