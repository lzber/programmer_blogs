# 关闭实例

关闭实例可以使用三种方式vagrant suspending, vagrant halt, vagrant destroy。

- suspending，暂停虚拟机，保存虚拟机当前的状态（内存和磁盘均不释放），可以使用vagrant up命令恢复运行；
- halt，关机，虚拟机停止运行，但是虚拟机实例保留，不销毁，可以理解为是正常的关机；
- destroy，销毁虚拟机，虚拟机的实例被销毁;

# vagrant ssh
如果是官方的box，那么用户名和密码默认都是vagrant

# vagrant命令详解

命令	作用
vagrant box add　　	　　添加box的操作　　
vagrant init 	　　初始化box的操作，会生成vagrant的配置文件Vagrantfile　　
vagrant up	启动本地环境
vagrant ssh	通过 ssh 登录本地环境所在虚拟机
vagrant halt	关闭本地环境
vagrant suspend	暂停本地环境
vagrant resume	恢复本地环境
vagrant reload	修改了 Vagrantfile 后，使之生效（相当于先 halt，再 up）
vagrant destroy	彻底移除本地环境
vagrant box list	显示当前已经添加的box列表
vagrant box remove	删除相应的box
vagrant package	打包命令，可以把当前的运行的虚拟机环境进行打包
vagrant plugin	用于安装卸载插件
vagrant status	获取当前虚拟机的状态
vagrant global-status	显示当前用户Vagrant的所有环境状态

# 增加box
vagrant box add nachosEnv  ~/Documents/上课有关/操作系统/xenial-server-cloudimg-i386-vagrant.box

# 导出box
vagrant package --output NAME.box
# 参考资料
https://www.cnblogs.com/mr-amazing/p/9606222.html
https://www.cnblogs.com/wangkongming/p/4070782.html
https://blog.csdn.net/zc474235918/article/details/51039150
https://homes.cs.washington.edu/~tom/nachos/
http://www.vagrantbox.es/

- Vagrant入门
https://www.cnblogs.com/alexyang8/p/3380936.html
- vagrant初识（一）
https://www.cnblogs.com/slang/p/9919400.html

- vagrant 14.04 32位下载地址
https://c4ys.com/archives/1230
https://mirrors.tuna.tsinghua.edu.cn/ubuntu-cloud-images/vagrant/trusty/current/
https://blog.csdn.net/weixin_30367169/article/details/94909666