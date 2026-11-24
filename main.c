/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bfaechti <benjamin.faechtig@gmail.com>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2026/11/24 15:26:27 by bfaechti          #+#    #+#             */
/*   Updated: 2026/11/24 15:36:15 by bfaechti         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <errno.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include "libasm.h"

static int	g_failures;

static void	check(const char *name, int passed)
{
	if (passed)
		printf("[OK]    %s\n", name);
	else
	{
		printf("[FAIL]  %s\n", name);
		g_failures++;
	}
}

static int	test_write(const char *text)
{
	int		pipefd[2];
	char	buffer[32];
	size_t	length;
	ssize_t	written;
	ssize_t	read_size;

	length = strlen(text);
	if (pipe(pipefd) == -1)
		return (0);
	written = ft_write(pipefd[1], text, length);
	close(pipefd[1]);
	read_size = read(pipefd[0], buffer, sizeof(buffer));
	close(pipefd[0]);
	return (written == (ssize_t)length && read_size == (ssize_t)length
		&& memcmp(buffer, text, length) == 0);
}

static int	test_read(const char *text)
{
	int		pipefd[2];
	char	buffer[32];
	size_t	length;
	ssize_t	written;
	ssize_t	read_size;

	length = strlen(text);
	if (pipe(pipefd) == -1)
		return (0);
	written = write(pipefd[1], text, length);
	close(pipefd[1]);
	read_size = ft_read(pipefd[0], buffer, sizeof(buffer));
	close(pipefd[0]);
	return (written == (ssize_t)length && read_size == (ssize_t)length
		&& memcmp(buffer, text, length) == 0);
}

int	main(void)
{
	const char	*text;
	char		copy[32];
	char		*duplicate;
	int			*values;
	void		*overflow;
	size_t		index;

	text = "Hello Assembler";
	printf("libasm function tests\n\n");

	check("ft_strlen", ft_strlen(text) == strlen(text)
		&& ft_strlen("") == 0);
	check("ft_strcpy", ft_strcpy(copy, text) == copy
		&& strcmp(copy, text) == 0);
	check("ft_strcmp", ft_strcmp("ABC", "ABC") == 0
		&& ft_strcmp("ABC", "ABD") < 0
		&& ft_strcmp("ABD", "ABC") > 0
		&& ft_strcmp("\x80", "\x7f") > 0);

	check("ft_write: write to pipe", test_write(text));
	errno = 0;
	check("ft_write: EBADF handling",
		ft_write(-1, text, 1) == -1 && errno == EBADF);

	check("ft_read: read from pipe", test_read(text));
	errno = 0;
	check("ft_read: EBADF handling",
		ft_read(-1, copy, sizeof(copy)) == -1 && errno == EBADF);

	values = ft_calloc(5, sizeof(*values));
	index = 0;
	while (values != NULL && index < 5 && values[index] == 0)
		index++;
	check("ft_calloc: zero-initialized memory",
		values != NULL && index == 5);
	free(values);
	errno = 0;
	overflow = ft_calloc(SIZE_MAX, 2);
	check("ft_calloc: overflow detection",
		overflow == NULL && errno == ENOMEM);
	free(overflow);

	duplicate = ft_strdup(text);
	check("ft_strdup", duplicate != NULL && duplicate != text
		&& strcmp(duplicate, text) == 0);
	free(duplicate);

	if (g_failures == 0)
		printf("\nAll tests passed.\n");
	else
		printf("\n%d test(s) failed.\n", g_failures);
	return (g_failures != 0);
}
