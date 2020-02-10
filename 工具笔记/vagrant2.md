hadoop **dfs** **-****mkdir** **/user**

hadoop **dfs** **-****mkdir** **/user/someone**

用-put命令在Linux文件系统与HDFS之间复制数据文件

hadoop **dfs –put**   /home/someone/interestingFile.txt   /user/*yourUserName*/

hadoop **dfs** **–put source-directory** **destination**



# vagrant和virtualbox介绍

```ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

BOX_IMAGE = "./hadoop_master.box"
NODE_COUNT = 2

Vagrant.configure("2") do |config|

  config.vm.define "hadoop-master" do |subconfig|

    subconfig.vm.box = BOX_IMAGE # use the same IMAGE with the slaves
    subconfig.vm.network "private_network", ip: "192.168.33.10"
    subconfig.vm.hostname = "hadoop-master"
  end

  (1..NODE_COUNT).each do |i|

    config.vm.define "hadoop-slave#{i}" do |subconfig|
      subconfig.vm.box = BOX_IMAGE
      subconfig.vm.network "private_network", ip: "192.168.33.#{i+10}"
      subconfig.vm.hostname = "hadoop-slave#{i}"
    end
  end
end
```
# 搭建环境的过程

vagrant是一款虚拟机管理工具，使用它可以快速搭建可复用、可移植的开发环境。
使用一个命令，vagrant就可以完成以下所有事情:

- 在电脑上快速创建一台虚拟机
- 改变虚拟机的物理配置
- 建立网络连接，使得你可以访问在你电脑上运行的虚拟机或局域网下的其他虚拟机
- 共享目录，你在电脑上对文件的修改可以同步到虚拟机
- 启动虚拟机
- 设置虚拟机主机名使得该虚拟机下的软件能够正确的设置
- 使用shell script或配置管理工具(例如：chef、puppet)来配置软件安装
- 调整主机和客户机的工作方式来解决可能出现的问题，例如：VirtualBox的默认网络配置在Ubuntu 12.04 LTS下是无效的，因此vagrant调整了Ubuntu的配置使得VirtualBox网络能够正常使用，vagrant解决了很多类似这种主机和客户机组合常见的问题。

使用vagrant搭建好一个配置好的开发环境在大约在一分钟内就能完成，耗时多少取决于你要安装的软件数量。
一旦vagrant完成了虚拟机的创建，你将拥有一个配置好的开发环境，因为已经默认创建好了共享目录和网络连接，当你测试你的web应用的时候，代码实际是运行在虚拟机里。
vagrant提供了完善的管理虚拟机的命令，除了创建开发环境，vagrant还可以实现以下所有事情：

- 使用ssh连接到虚拟机
- 关闭虚拟机
- 彻底删除虚拟机
- 暂停或恢复虚拟机
- 打包虚拟机镜像

vagrant搭建开发环境就像瑞士军刀一样犀利，它帮你解决了创建和管理开发环境的所有工作，并且开发环境更接近于生产环境。


vagrant up  



## 版本号

![image-20200108195917217](/Users/zxzx/Library/Application Support/typora-user-images/image-20200108195917217.png)

# 运行截图

![image-20200108200446686](/Users/zxzx/Library/Application Support/typora-user-images/image-20200108200446686.png)

![image-20200108200520013](/Users/zxzx/Library/Application Support/typora-user-images/image-20200108200520013.png)





# 项目代码

# 项目架构


