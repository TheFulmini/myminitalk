NAME = server
NAME2 = client

BONUS = server_bonus
BONUS2 = client_bonus

CC = clang 
CFLAGS = -Werror -Wall -Wextra -g 

SERVER_SRCS = server.c
CLIENT_SRCS = client.c
SERVER_SRCS_B = server_bonus.c 
CLIENT_SRCS_B = client_bonus.c

CLIENT_OBJS = $(CLIENT_SRCS:.c=.o)
SERVER_OBJS = $(SERVER_SRCS:.c=.o)
CLIENT_OBJS_B = $(CLIENT_SRCS_B:.c=.o)
SERVER_OBJS_B = $(SERVER_SRCS_B:.c=.o)

INCLUDE = minitalk.h
INCLUDE_B = minitalk_bonus.h

all: $(NAME) $(NAME2) $(INCLUDE)

%.o: %.c
	@$(CC) $(CFLAGS) -c $< -o $@

$(NAME): $(SERVER_OBJS)
	@$(CC) $(CFLAGS) -o $(NAME) $(SERVER_OBJS)
	@echo "\nCompiling SERVER .............. \033[32m[OK]\033[0m"

$(NAME2): $(CLIENT_OBJS)
	@$(CC) $(CFLAGS) -o $(NAME2) $(CLIENT_OBJS)
	@echo "\nCompiling CLIENT .............. \033[32m[OK]\033[0m"

bonus: $(BONUS) $(BONUS2)

$(BONUS): $(SERVER_OBJS_B)
	@$(CC) $(CFLAGS) -o $(NAME) $(SERVER_OBJS_B)
	@echo "\nCompiling SERVER with bonus ........ \033[32m[OK]\033[0m"

$(BONUS2): $(CLIENT_OBJS_B)
	@$(CC) $(CFLAGS) -o $(NAME2) $(CLIENT_OBJS_B)
	@echo "\nCompiling CLIENT with bonus ........ \033[32m[OK]\033[0m"

clean:
	@${RM} ${SERVER_OBJS}
	@${RM} ${CLIENT_OBJS}
	@${RM} ${SERVER_OBJS_B}
	@${RM} ${CLIENT_OBJS_B}

fclean: clean
	@${RM} ${NAME}
	@${RM} ${NAME2}
	@${RM} ${BONUS}
	@${RM} ${BONUS2}

re: fclean all

rebonus: fclean bonus

.PHONY: all bonus clean fclean re rebonus