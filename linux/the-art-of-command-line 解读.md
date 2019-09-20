# 地址  
https://github.com/jlevy/the-art-of-command-line  
这是一个 CSDN 上面推荐的高星仓库.  
介绍了如何使用命令行.  

# 在 Mac 上的测试
> 切换 shell 的命令: TODO  
  - zsh/bash/ksh: 临时切换
  - chsh -s $(which bash/zsh) 永久切换


### Evaryday Use模块

- tab 补全有用, ctrl + r 不好用也意义不大  
- ctrl + w删除最后一个字母好用, ctrl + u/k 删除到头/尾  可用. 
  > 注意, u/k 的意思是二选一, 不是输入 'u/k'.  
  - ctrl + a,移动到开头可用: ctrl+e 移动都开始应该很实用   
  - Mac 并没有 alt 键, 而 option 键并不能完全代替 alt键的作用, 但凡有 alt 键的一律放弃.  
  - 单词间的移动, ESC(松)+b/f, 还要按着 ESC 不停的松, 告辞!!
  
- 查看历史命令  
history 相关 TODO

- 文中提到 pkill 和 pgrep, 在我看来, 这个东西没有卵用, 玩去可以用 kill 和 ps 多写几个参数代替, 是在是吃饱了.  

- `吐槽: bash 真的和 oh-my-zsh 没法比, 单说 向上箭头 这个键, bash 并没有根据已有输入的搜索能力, 要这个 shell 作甚!`

- 关于网路命令的东西  
暂时用不到, 也不能理解那一串缩写是个什么意思, 先不学, 等专项训练或者有用到再记下来.  
否则的结果就是一边学, 一边忘.  


### 根据 Mac 的定制  
- 实现 alt 键  
后面我看到了, 如果有用到alt, 想要 option键实现相同功能, 需要设置一下.  
我用的是 ITerm2 终端工具, 在 preference->profile->keys, 在下方的 Allow applications keypad mode对应的选项选择 Esc+  
这么设置有什么用呢? 可以实现按住 alt+b/f 在单词间移动.  
 
- open 命令  
在 shell 中打开 finder, 使用 `open ANY_PATH` 来实现.  


# 实用和友情链接  
- explain shell: 一个解释命令和本次输入参数的网站. 网址是: https://explainshell.com  



# 最后
我只想说, 我真的是吃多了.  
这个仓库并没有让我学到很多, 可能学到了一点点吧, 也许以后用的到的东西.  
毕竟, 我懂的太多了. 胡说~
很多命令, 是目前用不到的, 而且这个仓库也并不能系统的讲, 还是去看鸟哥的Linux私房菜算了.  
学习, 这个东西, 找自己有用的东西就行了, 用不到的过一阵子你很快也忘了.  
这个仓库就一个 README 文件, 也挺好, 但是里面的东西, 我感觉很多暂时用不到.  
有缘来日再见. 我还有更重要的东西要去做.  
为我浪费的 累计5 个小时, 流泪.   
