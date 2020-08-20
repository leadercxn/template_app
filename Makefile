DIRS = src app
TARGETS = all clean 

include Makefile.src

$(TARGETS): %: $(patsubst %, %.%, $(DIRS))	#$(patsubst %, %.%, $(DIRS)) 输出: src.%  app.%

#调试打印
#
#$(info TARGETS is $(TARGETS))
#ALLA = all
#TEMP =  $(patsubst %, %.$(ALLA), $(DIRS))
#$(info TEMP is $(TEMP))

$(foreach TGT, $(TARGETS), $(patsubst %, %.$(TGT), $(DIRS))):
	$(info cao is $(patsubst %, %.$(TGT), $(DIRS)))
	$(MAKE) -C $(subst ., , $@)									


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

