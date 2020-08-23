include Makefile.src

MAKEFILE_NAME := $(MAKEFILE_LIST)
MAKEFILE_DIR := $(dir $(MAKEFILE_NAME) )
#$(info MAKEFILE_NAME is $(MAKEFILE_NAME))		#输出： Makefile Makefile.src Makefile.def
#$(info MAKEFILE_DIR is $(MAKEFILE_DIR))		#输出： ./  ./  ./

BUILD_TYPE ?= DEBUG

MK := mkdir
RM := rm -rf

CC = gcc
AR = ar

#function for removing duplicates in a list
remduplicates = $(strip $(if $1,$(firstword $1) $(call remduplicates,$(filter-out $(firstword $1),$1))))

BUILD_DIRECTORY = build
OBJECT_DIRECTORY = $(BUILD_DIRECTORY)/$(BUILD_TYPE)
LISTING_DIRECTORY = $(OBJECT_DIRECTORY)
OUTPUT_BINARY_DIRECTORY = $(OBJECT_DIRECTORY)

# Sorting removes duplicates
BUILD_DIRECTORIES := $(sort $(OBJECT_DIRECTORY) $(OUTPUT_BINARY_DIRECTORY) $(LISTING_DIRECTORY) )

CFLAGS = -Werror -Wall -fPIC -Wformat=0

#lc 是link libc
#lm 是link libm	-lm选项告诉编译器，我们程序中用到的数学函数要到这个库文件里找
#lz 是link libz 
#-lpthread posix线程 
LDFLAGS = -lm -lpthread

#打印是否使能
ifeq ($(BUILD_TYPE), DEBUG)
$(info enable trace)
CFLAGS += -DTRACE_ENABLE
else
$(info DTRACE_DISABLE )
CFLAGS += -DTRACE_DISABLE
endif

#default target - first one defined
default: all

#all:
#	$(MAKE) -f $(MAKEFILE_NAME) -C $(MAKEFILE_DIR) -e cleanobj
#	$(MAKE) -f $(MAKEFILE_NAME) -C $(MAKEFILE_DIR) -e output

## Create build directories ,也会把build目录创建出来 结果 mkdir build/DEBUG
$(BUILD_DIRECTORIES):
	$(MK) -p $@

cleanobj:
	$(RM) $(BUILD_DIRECTORIES)/*.o

C_SOURCE_FILE_NAMES = $(notdir $(C_SOURCE_FILES))
#$(info C_SOURCE_FILE_NAMES is $(C_SOURCE_FILE_NAMES))	main.c hello.c
C_PATHS = $(call remduplicates, $(dir $(C_SOURCE_FILES) ) )
#$(info C_PATHS is $(C_PATHS))							/home/cxn/linux/nfs/rootfs/home/dev_app/app_select/app/ /home/cxn/linux/nfs/rootfs/home/dev_app/app_select/src/
C_OBJECTS = $(addprefix $(OBJECT_DIRECTORY)/, $(C_SOURCE_FILE_NAMES:.c=.o) )
#$(info C_OBJECTS is $(C_OBJECTS))						build/DEBUG/main.o build/DEBUG/hello.o

OBJECTS = $(C_OBJECTS)

vpath %.c $(C_PATHS)
vpath %.h $(INC_PATHS)

# Create objects from C SRC files
$(OBJECT_DIRECTORY)/%.o: %.c
	@echo Compiling file: $(notdir $<)
	$(CC) $(CFLAGS) $(INC_PATHS) -c -o $@ $<

all: $(BUILD_DIRECTORIES) $(C_OBJECTS)
#	$(CC) $^ -o $(TARGET) $(LDFLAGS)
	$(CC) $(C_OBJECTS) -o $(BUILD_DIRECTORIES)/$(TARGET) $(LDFLAGS)

clean:
	$(RM) $(BUILD_DIRECTORIES)

cleanall:
	$(RM) $(BUILD_DIRECTORY)

menuconfig:
	@$(MAKE) -f scripts/Makefile $@



#
#  deprecated 弃用
#

#DIRS = src app
#TARGETS = all clean 
#$(TARGETS): %: $(patsubst %, %.%, $(DIRS))	#$(patsubst %, %.%, $(DIRS)) 输出: src.%  app.%

#调试打印
#
#$(info TARGETS is $(TARGETS))
#ALLA = all
#TEMP =  $(patsubst %, %.$(ALLA), $(DIRS))
#$(info TEMP is $(TEMP))


#$(foreach TGT, $(TARGETS), $(patsubst %, %.$(TGT), $(DIRS))):
#	$(info cao is $(patsubst %, %.$(TGT), $(DIRS)))
#	$(MAKE) -C $(subst ., , $@)									

#展开
#	$(MAKE) -C $(subst ., , $@)		//-C表示要跳进到源代码目录下读取那里的Makefile 把$@(目标文件)中的 '.' 替换成 空格' ' 
#	
#	$(foreach TGT, $(TARGETS), $(patsubst %, %.$(TGT), $(DIRS))):		#目标
#	$(MAKE) -C $(subst ., , $@)											#执行命令
#
#	最后展开:
# 	make -C src all app src
#	make -C src clean app clean
#