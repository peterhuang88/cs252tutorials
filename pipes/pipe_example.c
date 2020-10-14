#include <stdlib.h> 
#include <unistd.h> 
#include <sys/types.h> 
#include <string.h> 
#include <sys/wait.h> 
#include <stdio.h>

int main() {
	int mypipe1[2];
	int mypipe2[2];

	// use pipe to actually create a pipe
	if (pipe(mypipe1) == -1) {
		fprintf(stderr, "Pipe failed\n");
		return 0;
	}
	if (pipe(mypipe2) == -1) {
		fprintf(stderr, "Pipe failed\n");
		return 0;
	}

	// mypipe[0] --> anything you write can be read from this end
	// mypipe[1] --> write stuff to this end to get stuff from the other end

	char hello[] = "hello";

	// create the child process
	int p = fork();

	if (p < 0) {
		// this means our fork failed
		fprintf(stderr, "fork failed\n");		
		exit(1);
	}
	else if (p > 0) {
		// this is the parent
		// when we call fork, fork returns the PID of the child process
		
		// on this end, close the reading end of the first pipe
		// ALWAYS CLOSE YOUR PIPES WHEN YOU NO LONGER NEED THEM!!!!
		// otherwise memory leaks galore....
		close(mypipe1[0]);
		
		// now we write something to the write end of our pipe
		write(mypipe1[1], hello, strlen(hello) + 1);

	}
	else {
		// now this is the child process if fork returns 0
		
		// good coding standards ya know
		// close the write end since we're only gonna read
		close(mypipe1[1]);

		char hello[6];
		read(mypipe1[0], hello, 6);
		
		// close reading ends of both pipes
		close(mypipe1[0]);
		close(mypipe2[0]);

		char temp_hello[] = "hello";	
		if (strcmp(hello, temp_hello) == 0) {
			char world[] = "world";
			write(mypipe2[1], world, strlen(world) + 1);
			close(mypipe2[1]);	

		} else {
			char nani[] = "nani";
			write(mypipe2[1], nani, strlen(nani) + 1);
			close(mypipe2[1]);	
		}
		exit(0);
	}

	// read from second pipe
	char retval[10]; // i got lazy with random sized array
	read(mypipe2[0], retval, 6);
	close(mypipe2[0]);

	printf("Our return string is: %s\n", retval);
}
