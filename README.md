# Linux下的Makefile工程模板
* 2020/08/25
  * 添加了工程搜索不到librares文件夹，会自动从 github上拉取的功能

* 2020/8/23
  * 新建了develop分支。
    * 分支说明：
      * master  Makefile的基础框架
      * develop Makefile + Kconfig 的工程框架

* 2020/8/23
  * 加载了 Kconfig 来配置工程
  * 依赖环境
    * Ubuntu OS
    * python
    * sudo apt-get install bison
    * sudo apt-get install flex
    ```bash
        make menuconfig
    ```

* 2020/8/23
  * 完成整个Makefile工程的基本搭建
  * Makefile.src 用来存放工程所用到的源文件
  * Makefile.def 用来定义生成目标的名字
  * 操作
    * make  生成可执行文件
    * make BUILD_TYPE=DEBUG 用来生成工程buil的类型(可选:  DEBUG  , RELEASE)
  




