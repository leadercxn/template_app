#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

#include "hello.h"

void *Test_print(void *p)
{
	char *q = (char *)p;
	printf("%s\n",q);
	pthread_exit((void *)1);
}

int print_hello(char *string)
{
	void *ret = NULL;
	pthread_t tid;
	if(pthread_create(&tid,NULL,Test_print,(void *)string) != 0)
	{
		printf("pthread_create error\n");
		return -1;
	}
	pthread_join(tid,&ret);
	printf("thread exit %d\n",(int *)ret);
	return 1;
}

int print(char *string)
{
	printf("%s\n",string);
	return 0;
}
