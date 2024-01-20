# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: olmohame <olmohame@student.hive.fi>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/30 11:25:02 by olmohame          #+#    #+#              #
#    Updated: 2024/01/05 05:03:24 by olmohame         ###   ########.fr        #
#                                                                              #
# **************************************************************************** 

SOURCES  = ft_printf.c	ft_printf_utils.c ft_putnbr.c

BONUS_SOURCES = ft_flags_bonus.c	ft_printf_bonus.c	ft_printf_utils_bonus.c  ft_printnbr_utils_bonus.c	\
		ft_putstr_bonus.c	ft_signed_bonus.c	ft_unsigned_bonus.c

OBJECTS = ${SOURCES:.c=.o}

BONUS_OBJECTS = ${BONUS_SOURCES:.c=.o}

NAME = libftprintf.a

BONUS = .bonus

FLAGS = -Wall -Wextra -Werror

all: ${NAME}

${NAME}: ${OBJECTS}
	ar rcs ${NAME} ${OBJECTS}

bonus: ${BONUS}

${BONUS}: ${BONUS_OBJECTS}
	ar rcs ${NAME} ${BONUS_OBJECTS}
	touch ${BONUS}

%.o: %.c
	cc $(FLAGS) -c $< -o $@

norm:
	norminette $(SOURCES) $(BONUS_SOURCES)

clean:
	rm -f ${OBJECTS} ${BONUS_OBJECTS}
	rm -f ${BONUS}

fclean: clean
	rm -f libftprintf.a

re: fclean all

.PHONY:	all clean fclean re bonus
