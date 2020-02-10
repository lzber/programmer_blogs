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

   

 启动mysql：
方式一：sudo /etc/init.d/mysql start 
方式二：sudo service mysql start

停止mysql：
方式一：sudo /etc/init.d/mysql stop 
方式二：sudo service mysql stop

重启mysql：
方式一：sudo/etc/init.d/mysql restart
方式二：sudo service mysql restart  

- Mac 上 brew 的用法?  
brew --help| less  
brew services --help  
brew info SERVICE_X | less  


- Mysql 启动失败, Error 2002


- MySQL 的导入导出  
mysqldump -u root -p [-h IP] DATABASE_NAME [TABLE_NAME] > OUTPUT.sql  
mysql -uroot -p DATABASE_NAME < INPUT.sql  

- MySQL shell 的几个命令  
show 命令  
   - show processlist  
   - show variables like '%XXX%'# 可以查看系统的一些配置.    
   - show databases;  
   - show tables;  
   使用非常的广泛!!

- MySQL 开启远端连接  
bind-address=0.0.0.0 # 在配置文件里面.  
update user set host='%' where user='root';  
flush privileges;  
  





update mysql.user set authentication_string=password('root') where user='root';



mysql优化

http://www.cnblogs.com/luxiaoxun/p/4694144.html



优化策略

\1. 先缩小范围，添加过滤条件，再联合查询

\2. 排序的时候，使用有索引的字段进行排序。

\3. 查询自己需要的字段

\4. 有索引的列如果为空值, 索引本身是不存放空值的, null != null, 如果在有空值的索引列进行 is null和 is not null判断, 本质原因是 索引不含null. 可能导致全表扫描。

\5. 根据数据库的SQL语言解释器执行顺序的不同, 合理安排where后面的语句书序, 比如oracle从下到上, 所以把能排除最多数据的条件写到最下面.

\6. 合理利用索引. 在SQL语句中, 不要对索引列进行函数和数值运算, 防止全表扫描, 

\7. 通配符可能停用索引



mysql的sequence无法控制, 但是也是 不能倒退的,即使这个主键被删除了

?

待验证





优化理论 SQL优化衡量指标





--员工表

insert into emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (7369, 'SMITH', 'CLERK', 7902, str_to_date('17-12-1980', '%d-%m-%Y'), 800, null, 20);
insert into emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (7499, 'ALLEN', 'SALESMAN', 7698, str_to_date('20-02-1981', '%d-%m-%Y'), 1600, 300, 30);
insert into emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (7521, 'WARD', 'SALESMAN', 7698, str_to_date('22-02-1981', '%d-%m-%Y'), 1250, 500, 30);
insert into emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (7566, 'JONES', 'MANAGER', 7839, str_to_date('02-04-1981', '%d-%m-%Y'), 2975, null, 20);
insert into emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (7654, 'MARTIN', 'SALESMAN', 7698, str_to_date('28-09-1981', '%d-%m-%Y'), 1250, 1400, 30);
insert into emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (7698, 'BLAKE', 'MANAGER', 7839, str_to_date('01-05-1981', '%d-%m-%Y'), 2850, null, 30);
insert into emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (7782, 'CLARK', 'MANAGER', 7839, str_to_date('09-06-1981', '%d-%m-%Y'), 2450, null, 10);
insert into emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (7788, 'SCOTT', 'ANALYST', 7566, str_to_date('19-04-1987', '%d-%m-%Y'), 3000, null, 20);
insert into emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (7839, 'KING', 'PRESIDENT', null, str_to_date('17-11-1981', '%d-%m-%Y'), 5000, null, 10);
insert into emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (7844, 'TURNER', 'SALESMAN', 7698, str_to_date('08-09-1981', '%d-%m-%Y'), 1500, 0, 30);
insert into emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (7876, 'ADAMS', 'CLERK', 7788, str_to_date('23-05-1987', '%d-%m-%Y'), 1100, null, 20);
insert into emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (7900, 'JAMES', 'CLERK', 7698, str_to_date('03-12-1981', '%d-%m-%Y'), 950, null, 30);
insert into emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (7902, 'FORD', 'ANALYST', 7566, str_to_date('03-12-1981', '%d-%m-%Y'), 3000, null, 20);
insert into emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
values (7934, 'MILLER', 'CLERK', 7782, str_to_date('23-01-1982', '%d-%m-%Y'), 1300, null, 10);
commit;





# [MYSQL 连接数据库命令收藏](http://www.cnblogs.com/muzongyan/archive/2010/08/13/1799016.html)

一、MySQL 连接本地数据库，用户名为“root”，密码“123”（注意：“-p”和“123” 之间不能有空格）

```
C:\>mysql -h localhost -u root -p123
```

二、MySQL 连接远程数据库（192.168.0.201），端口“3306”，用户名为“root”，密码“123”

```
C:\>mysql -h 172.16.16.45 -P 3306 -u root -p123
```

三、MySQL 连接本地数据库，用户名为“root”，隐藏密码

```
C:\>mysql -h localhost -u root -p
Enter password:
```

四、MySQL 连接本地数据库，用户名为“root”，指定所连接的数据库为“test”

```
C:\>mysql -h localhost -u root -p123 -D test
mysql>select database();
```





\7.   使用Exists子句找出主管工作类别为'MANAGER'的员工数据

select * from emp where exists(select * from emp e where e.empno=emp.mgr and e.job='MANAGER' );

exists

思路,先找出 是manger的员工, 再 取出 empno列,形成一个集合, 然后执行外边的 empno 的in 操作。。

\8.   同上例，找出主管工作类型不为'MANAGER'的员工数据

select * from emp where not exists(select * from emp e where e.empno=emp.mgr and e.job='MANAGER' );

外表 exists

select * from emp where exists (select * from dept where dept.deptno=10 and emp.deptno=dept.deptno);



没有内外关联的exists筛选是没有任何个的 

select * from emp a where exists (select 1 from emp b where b.empno=a.mgr and b.mgr is null);

select * from emp a where exists (select 1 from emp b where  b.mgr is null);





# **sql语句的大小比较？？**

表中有ABC三列，用SQL语现：当A列大于B列时选择A列否则选择B列，当C列大于B列时选择B列否则选择C列

select case when A>B then A else B [end](https://www.baidu.com/s?wd=end&tn=44039180_cpr&fenlei=mv6quAkxTZn0IZRqIHckPjm4nH00T1dBnHfLmyn1rAD1nAm4nvuh0AP8IA3qPjfsn1bkrjKxmLKz0ZNzUjdCIZwsrBtEXh9GuA7EQhF9pywdQhPEUiqkIyN1IA-EUBtYPWcYPjf1nH0),case when C>B then B else C [end](https://www.baidu.com/s?wd=end&tn=44039180_cpr&fenlei=mv6quAkxTZn0IZRqIHckPjm4nH00T1dBnHfLmyn1rAD1nAm4nvuh0AP8IA3qPjfsn1bkrjKxmLKz0ZNzUjdCIZwsrBtEXh9GuA7EQhF9pywdQhPEUiqkIyN1IA-EUBtYPWcYPjf1nH0) from table

自动选择索引  





# 如何查看mysql的默认存储引擎？

```
 show variables like '%storage_engine%';
```



# 什么是存储引擎？？



#  myISAM 和 InnoDB的区别？

MyISAM是MySQL的默认数据库引擎（5.5版之前）。虽然性能极佳，而且提供了大量的特性，包括全文索引、压缩、空间函数等，但MyISAM不支持事务和行级锁，而且最大的缺陷就是崩溃后无法安全恢复。不过，5.5版本之后，MySQL引入了InnoDB（事务性数据库引擎），MySQL 5.5版本后默认的存储引擎为InnoDB。



**两者的对比：**

1. **是否支持行级锁** : MyISAM 只有表级锁(table-level locking)，而InnoDB 支持行级锁(row-level locking)和表级锁,默认为行级锁。
2. **是否支持事务和崩溃后的安全恢复： MyISAM** 强调的是性能，每次查询具有原子性,其执行速度比InnoDB类型更快，但是不提供事务支持。但是**InnoDB** 提供事务支持事务，外部键等高级数据库功能。 具有事务(commit)、回滚(rollback)和崩溃修复能力(crash recovery capabilities)的事务安全(transaction-safe (ACID compliant))型表。
3. **是否支持外键：** MyISAM不支持，而InnoDB支持。
4. **是否支持MVCC** ：仅 InnoDB 支持。应对高并发事务, MVCC比单纯的加锁更高效;MVCC只在 `READ COMMITTED` 和 `REPEATABLE READ` 两个隔离级别下工作;MVCC可以使用 乐观(optimistic)锁 和 悲观(pessimistic)锁来实现;各数据库中MVCC实现并不统一。推荐阅读：[MySQL-InnoDB-MVCC多版本并发控制](https://segmentfault.com/a/1190000012650596)

# 索引

MySQL索引使用的数据结构主要有**BTree索引** 和 **哈希索引** 。对于哈希索引来说，底层的数据结构就是哈希表，因此在绝大多数需求为单条记录查询的时候，可以选择哈希索引，查询性能最快；其余大部分场景，建议选择BTree索引。





