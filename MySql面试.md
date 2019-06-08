- 三个范式的理解:  
好文参考: https://www.cnblogs.com/zhengxingpeng/p/6670405.html  
理由: 用图片详细的讲解了三个范式的含义.  
好文参考：http://www.cnblogs.com/zxsoft/archive/2007/08/03/840826.html  
理由：解释了什么是BCNF， 也就是说候选关键字段之间，不得存在传递依赖，或者循环依赖。  

# 实际 MySQL操作
- 如何修改root密码?  

   - 知道 root 密码的情况下:  
   版本 5.6, 使用  
   use mysql  
   select user, host from user where user='root'; 查询出有几行  
   update user set password=password('YOUR_NEW_PASSWORD') where user='root';  
   flush privileges;  
   版本 5.7+, 字段变了, password->authentication_string  
   
   - 不知道的情况下:  
   先停掉 Mysql 服务: brew services stop mysql@5.6  
   在查看有木有相关进程还在跑: ps -ef | grep mysql  
   使用免密码登录进程进入: mysqld_safe --skip-grant-tables &  
   修改 root 密码: 步骤同知道 root 密码步骤一致  
   修改完成后, 关闭 Mysql_safe: 先查出进程 ID: ps -ef | grep mysqld  
   kill -9   PROCESS_ID  
   重启 mysql服务: brew services start mysql@5.6  
   
   > 参考https://www.cnblogs.com/wangs/p/3346767.html
   linux.md
   
- Mac 上 brew 的用法?  
brew --help| less  
brew services --help  
brew info SERVICE_X | less  

- ps 命令详解  
ps -ef 的各个字段解释如下, 依照出现顺序:  
UID, user_id  
PID  
PPID  
...  
CMD, 启动这个进程用到的命令  
   > 参考: https://www.cnblogs.com/freinds/p/8074651.html


