#INCLUDE =	-I ./
#CFLAGS += $(INCLUDE)
#
#CROSSCOMPILE = 
##CROSSCOMPILE = arm-hisiv100-linux-
#CC = $(CROSSCOMPILE)gcc
#AR = $(CROSSCOMPILE)ar
#
#CFLAGS = -Werror -Wall -fPIC -Wformat=0
#DEPS = $(wildcard *.c)	
#OBJS = $(DEPS:.c=.o)		
#
#all: libtest.so libtest.a
#	
#%.o: %.c %.h
#	$(CC) $< -c -o $@ $(CFLAGS)
#	
##生成动态库
#libtest.so: $(OBJS)
#	$(CC) -shared -o $@ $^
#	-mv $@ ../lib/share
#	
##生成静态库
#libtest.a: $(OBJS)
#	$(AR) -rcs $@ $^
#	-mv $@ ../lib/
#
#clean:
#	-rm -f *.o
#	-rm -f ../lib/*.a
#	-rm -f ../lib/share/*.so
#