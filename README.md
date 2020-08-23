### Linux下的Makefile工程模板

* 2020/8/23
  * 完成整个Makefile工程的基本搭建
  * Makefile.src 用来存放工程所用到的源文件
  * Makefile.def 用来定义生成目标的名字

  * 操作
    * make  生成可执行文件
    * make BUILD_TYPE=DEBUG 用来生成工程buil的类型(可选:  DEBUG  , RELEASE)
  


* before 2020/8/23 旧版本的说明
---------
#### 说明
----------
- 如果你不知道工程怎么建立或者不知道怎么组织代码，这个分享将建立一个c工程实例
- 如果你也不清楚linux动态库和静态库怎么生成，src下的Makefile将代码生成库文件
- 如果你还不清楚怎么链接linux下面的库文件，app下的Makefile将分别链接库

#### 目录文件
-----------
- **app（应用）**
  - main.c     		//这个应用链接库使用它们的函数的实例
  - Makefile			//链接库的makefile
- **lib（库）**
  - share				  //动态库
  - libtest.a				//静态库
- **src（源码）**
  - cJSON.c			//cjson代码
  - cJSON.h			
  - hello.c			//随便写的一个文件，主要是为了生成库
  - hello.h
  - Makefle			//生成库
- **Makefile**			//执行每个文件中的Makefile






