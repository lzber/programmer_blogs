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

# Reference  
本文参考阮一峰老师的教程: http://www.ruanyifeng.com/blog/2018/02/docker-tutorial.html , 目前我并没有在实际工作场景中应用过 docker, 不知道的还有很多. 但是了解这么多目前也够了. 理解原理即可. 

# 加速地址
https://yqo68yqi.mirror.aliyuncs.com  
https://blog.csdn.net/u012055638/article/details/79803959

# 一篇特别好的docker 教程
https://www.cnblogs.com/neptunemoon/p/6512121.html

# docker compose
暂时不需要。  



# image命令

```bash
docker image ls
```

# container命令

```bash
 docker container start [containerID]
 docker container stop [containerID] # 温柔中断
docker container kill [containerID] # 暴力中断
docker container logs [containerID] # 查看日志
docker container exec -it [containerID] /bin/bash

```

# 修改docker国内仓库

```http
https://registry.docker-cn.com
https://yqo68yqi.mirror.aliyuncs.com
```

# 其他

mac上因为系统限制ping不了docker的容器

所以可以设置-p 8080:80 把端口映射出来



# 端口映射

```bash
$ docker container run --rm -p 8000:3000 -it koa-demo /bin/bash
```



# 参数解释

- `-d`：容器启动后，在后台运行。
- `--rm`：容器终止运行后，自动删除容器文件。
- `--name wordpressdb`：容器的名字叫做`wordpressdb`
- `--env MYSQL_ROOT_PASSWORD=123456`：向容器进程传入一个环境变量`MYSQL_ROOT_PASSWORD`，该变量会被用作 MySQL 的根密码。



# 命令demo

docker run -d \
 -h mysql \
-v /data/mysql:/var/lib/mysql \
-p 3306:3306 \
--name mysql \
-e MYSQL_ROOT_PASSWORD=root \
mysql 

> -h 设定主机名

> -d,  --detach   Run container in background and print container ID

$sudo docker run 
--name phpadmin 
--link mysql:db  # db是别名
-p 9998:80 
-d 
phpmyadmin/phpmyadmin 