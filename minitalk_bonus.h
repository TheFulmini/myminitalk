#ifndef MINITALK_BONUS_H
# define MINITALK_BONUS_H

# include <sys/types.h>
# include <unistd.h>
# include <signal.h>
# include <stdlib.h>
# include <stdbool.h>

/* SERVER */
void	

/* CLIENT */
pid_t	parse_pid(char *str);

void	sigint_handler(int sig);

#endif