
# Linux 常用命令

## File CRUD
- mkdir  
创建多级目录
mkdir -p Project/a/src

- 链接  
软链接, ln -s FROM TO ; 相当于 Windows 里面的快捷方式.  
但是软链接不可以移动, 否则就会失效. 这一点不像 windows 里的快捷方式. 

# COMMAND 
- 创建别名  
短名 alias a='xxxx xxx xxx'

 

- find  
找文件, 根据名字找, 是最常用的, 找配置啥的.  
格式: find DIRECTORY_RELATIVE_OR_ABSULUTE/ -name \*.cnf  [-d 3:深度为 3 层]  

- chmod命令  
chmod u+x file  
http://www.cnblogs.com/peida/archive/2012/11/29/2794010.html  



- zip  
解压: unzip [-v:只看不解压]  X.zip -d OUT_PUT_DIR  
压缩: zip OUT_PUT_ZIP_NAME.zip -r INPUT_ZIP_DIR  

- ps 命令详解  
ps -ef 的各个字段解释如下, 依照出现顺序:  
UID, user_id  
PID  
PPID  
...  
CMD, 启动这个进程用到的命令, 最后一个字段特别重要, 它还指明了这程序启动时用到的参数, 有的时候找不到出错的原因就是因为没有注意到程序后面跟的配置.  
   > 参考: https://www.cnblogs.com/freinds/p/8074651.html

- grep  
答: grep 子串  文件或者管道输出  -A后多少行 -B前多少行 

- 重启  
For shutdown:
sudo poweroff
For restart:
sudo reboot 

# 前台后台操作
https://segmentfault.com/a/1190000000349722
ctrl+z 暂停到后台, ctrl+c 杀掉,  
带上&, 直接放到后台
使用jobs 可以查看后台任务
bg %i 放到后台, fg %i 放到前台.

# 快速入门的小抄用法
curl cheat.sh/COMMAND  

- su  
su 的语法为： su [-] username
加”-“后会连同用户的环境变量一起切换过来

# 需要理解机制
- bash加载顺序  
mac 下的bash的配置文件的加载顺序,以及zsh的配置  
https://www.jianshu.com/p/020f3d02f538  


- Linux的环境变量  
 一、Linux的变量种类
      按变量的生存周期来划分，Linux变量可分为两类：
      1、永久的：需要修改配置文件，变量永久生效。
      2、临时的：使用export命令声明即可，变量在关闭shell时失效。
二、设置变量的三种方法
      1、在/etc/profile文件中添加变量【对所有用户生效（永久的）】
      2、在用户目录下的.bash_profile文件中增加变量【对单一用户生效（永久的）】
      3、直接运行export命令定义变量【只对当前shell（BASH）有效（临时的）】
三、PATH声明，其格式为：
      PATH=`$PATH:<PATH 1>:<PATH 2>:<PATH 3>:------:<PATH N>`

- locale  
export LC_ALL=en_US.UTF-8  
http://www.cnblogs.com/dolphi/p/3622570.html

- fhs  
file system hierachy standard
/usr/local 第三方文件夹.
https://blog.csdn.net/dongfei2033/article/details/76302190

- linux中的正则表达式  
https://www.cnblogs.com/andysd/p/3434067.html

# shell  

- 查看当前 shell 
echo $SHELL

- 查看当前可用 shell  
cat /etc/shells  

- 改变当前用户的 shell  
ch -s $(which zsh/bash)


# 使用频率很低, 没卵用的命令  
- diff  
< 表示左边有, >表示右边独有, 右边的为参考, 左边的是主动比较文件.
d表示删除,c表示改变.
更完整的推荐答案参考这里: https://www.computerhope.com/unix/udiff.htm
从这篇帖子我们可以看出, a, c, d, 不同模式, 参数含义是不一样的. 参数含义由模式决定.
目前我只要会用 diff -c file1 file2, 或者 diff -u file1 file2就可以了

- scp  
次重要 scp命令 server copy secure cop
scp [-r, 表示文件夹] 系统用户@IP:文件路径   本地路径 

- 网络端口占用查询
sudo netstat -tulpn
例如:
(venv) root@zx_vultr:/srv/www/jobplus# netstat -tulpn| grep 5000
tcp        0      0 0.0.0.0:5000            0.0.0.0:*               LISTEN      10913/python3
(venv) root@zx_vultr:/srv/www/jobplus# kill -9 10913


- 不重要 # tar命令
http://man.linuxde.net/tar 
解压到指定命令 tar -C
http://www.cnblogs.com/peida/archive/2012/11/30/2795656.html
tar -z(压缩格式){x(解压)|c(压缩)}f(文件) 文件名 

- 7. awk 完整形式是什么? (2)怎么用?  
答: 三个作者的名字第一个字母.(2) awk接受输入, 然后 以'{}'开始指定命令, NR表示

- 编译安装
configure, make ,make install是什么意思?手动编译,安装软件
https://blog.csdn.net/linzhiji/article/details/6774410

- Shell 脚本   
9. 有不错的shell帖子吗?
https://blog.csdn.net/M_SIGNALs/article/details/53490074
https://blog.csdn.net/hyszyl/article/details/60970307 关于shell的面试题.

- 改密码  
passwd [username]  

- 查看一个文件夹的大小  
du -sh [dictory1] [directory2]  