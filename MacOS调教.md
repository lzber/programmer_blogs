# 序
当你刚开始用 MacOS 开发的时候, 各种不顺手.   
这里我就来说一下自己遇到的麻烦和怎么解决的, 怎么把 Mac 调教成自己顺手的工具.  


# Finder
- 显示完整路径  
default write com.apple.finder _FXShowPosixInTitle -bool YES/NO # 显示路径与取消显示路径(默认不显示)

# 安装软件
Mac 行最流行的就是 brew 命令,除过安装包无脑下一步的另一个选择.  

### brew
brew 也有不好用的地方, 但是因为它流行, 所以了解一下.  
我常用的 brew 命令有:
   - brew search  XXX
   - brew install/uninstall XXX
   - brew services start/stop/restart XXX
   - brew services list # 查看当前由 brew 启动的服务有哪些.  
   服务启动的方式有很多种, brew 只是其中一种.  

##### 更换 brew 的源 

而我自己的具体操作步骤是这样的：  
➜ ~ cd "$(brew --repo)"  
➜ Homebrew git:(stable) pwd  
/usr/local/Homebrew  
➜ Homebrew git:(stable) git remote set-url origin https://mirrors.ustc.edu.cn/brew.git  
➜ Homebrew git:(stable) cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"  
➜ homebrew-core git:(master) git remote set-url origin https://mirrors.ustc.edu.cn/homebrew-core.git  
➜ homebrew-core git:(master) brew update  
Already up-to-date.  
➜ homebrew-core git:(master) echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles' >> ~/.zshrc  
➜ homebrew-core git:(master) source ~/.zshrc  

> 修改源
Homebrew有比较快的源（mirror）吗？ - 剑微寒的回答 - 知乎
https://www.zhihu.com/question/31360766/answer/75845239

> 安装包安装软件的时候, 要系统偏好-->安全与隐私->通用->任何来源; 如果一个 dmg 特别危险, 需要再 系统偏好-->安全与隐私允许打开一次


# 压缩

###分卷解压

需要把分卷压缩包的文件名，比如：

xxx.part1.rar, xxx.part2.rar,  xxx.part3rar... 

修改为xxx.r01,xxx.r02,xxx.r03... 


# 图片
壁纸在哪个文件夹下?
答: 我的设备>我的硬盘>Library->desktop pictures.

# TouchPad 手势
重要 触控板使用  
- 参考链接 https://support.apple.com/zh-cn/HT204895

# 快捷键  
重要 home键, end键
fn+前(后) 行首,行末  
fn+ctrl+前(后) 文章首末  
https://zhidao.baidu.com/question/1797341732233351627.html  
刚想使用 ctrl+shift+up/down， 发现不能起作用了，搜了一下才知道改成 ctrl+up/down了， 如果想修改键位，那么在 设置->调度中心 里调整，简直完美。

如何显示桌面:comand+f3


# 重要 软件
- spectacle：网站下载
- 搜狗输入法：网站下载
- iTerm
重要设置:  
profile->session->when idle, send 0 ;  


# 其他

- Mac有什么好用的技能？
答:无格式粘贴, 快捷键是shift+command+v

- mac如何截屏?
答:使用QQ, ctrl+command+a, 截屏后放在剪切板; command+shift+3(全屏)/4(自选), 截屏后放在桌面

- 关闭自动更新:  
系统偏好设置->App Store->取消自动检查更新

- 接触端口占用  
终端输入：lsof -i tcp:port 将port换成被占用的端口(如：8086、9998)



