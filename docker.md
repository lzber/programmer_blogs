# Docker
- Docker 能做什么?  
方便的解决环境变量的配置问题.  
语言编译器, 解释器, 依赖.  
它可以复制原始环境.  

- Docker 和虚拟机相比, 有什么差异?  
虚拟机占用资源大, 启动速度慢, 安装麻烦  
 
 
- Linux 容器是什么?  
一种虚拟化机技术, 对进程进行隔离, 对正常的进程套一层壳.  
有着启动快, 占用资源小而且可以共享, 体积小的优点.  
  
- Docker 有什么优势?  
Docker是 Linux 容器的一种封装, 提供简单好用的容器接口. 白话: 非专业人士用Linux容器更方便了, 难度降低了.  

- Docker 的使用场景是什么?  

- Docker 如何安装和启动?  
TODO  

- Image 文件是什么?  
应用程序和依赖的打包.  
通过一个 Image 可以生成 Docker 容器, 而且可以有多个实例同时运行.  
还可以继承.  
还是跨平台的, 太厉害了吧, 和 Java 一样!  
在继承的基础上, 可以自我定制, 牛逼!  
网上有 Image 仓库, Dockerhub, 还可以进行 Image 交易.  

- 如何下载Image 文件?  
docker image pull library/hello-world  
docker container run hello-world  
docker container ls  [--all 表示所有] # 正在运行的container
docker container kill 

- 如何制作 Image?  
进入项目根目录  
编写.dockerignore 文件,省略一些不想一起打包的文件  
新建一个文本文件 Dockerfile,(PS:后缀还是文件名?)  
写入一些 docker 脚本命令  
使用docker image build -t IMAGENAME:VERSION  
使用 docker image ls 查看文件  

- 运行 Image 和停止 Image ?  
使用 docker container run -p OUTER_PORT:DOCKER_PORT -it[shell 互连]  [--rm:运行后自动删除] IMAGENAME:VERSION /bin/bash[启动 内部shell的命令 ]  
docker container kill  CONTAINER_ID    
还有docker contan

- CMD 命令是什么?  
Docker 脚本最后一句话, 但是不能再run 命令后面加 shell 启动命令, 否则会覆盖





Reference  
TODO  
