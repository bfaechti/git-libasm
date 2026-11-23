/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bfaechti <benjamin.faechtig@gmail.com>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2026/11/16 15:15:02 by bfaechti          #+#    #+#             */
/*   Updated: 2026/11/16 15:38:30 by bfaechti         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <string.h>
#include "libasm.h"

int main()
{
	const char *str = "Hello Assembler";

	/* ----- ft_strlen ----- */
	printf("strlen: %zu\n", strlen(str));
	printf("ft_strlen: %zu\n", ft_strlen(str));
	/* --------------------- */

	/* ----- ft_strcpy ----- */
	char dst1[50];
	char dst2[50];

	strcpy(dst1, str);
	ft_strcpy(dst2, str);

	printf("strcpy original : %s\n", dst1);
	printf("ft_strcpy       : %s\n", dst2);
	/* --------------------- */

	/* ----- ft_strcmp ----- */
	/* --------------------- */

	/* ----- ft_write ------ */
	/* --------------------- */

	/* ------ ft_read ------ */
	/* --------------------- */

	/* ----- ft_strdup ----- */
	/* --------------------- */

	/* ----- ft_calloc ----- */
	/* --------------------- */
}