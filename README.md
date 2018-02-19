> 测试环境：Ubuntu16.04 x64 和 CentOS6.9 x64
# VimSimpleIDE
轻量级Python集成开发环境
### 效果图
![simplevimseetingscreenshot](https://cloud.githubusercontent.com/assets/5633774/8563546/f99f3706-24f5-11e5-9451-5e33d7cc2652.png)

## 1. 功能描述
- Pathogen：插件管理工具。
- Supertab：<tab> 快捷键上下文提示功能。
- Syntastic：外部语法检查,并显示错位置。
- Auto Pairs：全括号和引号等符号自动补全工具。
- Snipmate：代码片段补全。
- jedi-vim：基于jedi的自动补全提示插件。
- NERDTree：添加一个树形目录文件管理插件。
- MiniBufferExplorer：同时打开多个文件同时编辑时，列出所有打开的缓冲区作为标签。
- Undotree：存储撤消历史。
- Tag List：提供源代码符号的结构化视图。
- Vim-airline：状态栏美化工具。
- Vim-colors-solarized：主题配色方案。
- Vim-fugitive：git集成插件，可以在vim中运行git命令。
- Autopep8：自动依照pep8标准自动格式化代码。
- NERDcommenter：多行注释工具。
- indentLine：缩进指示线。
- 代码自动缩进。
- 代码折叠。
- 所有空格显示为圆点。
- 打开文件时，跳转到最后一次编辑的位置。
- 新建以下文件自动插入头部描述： [*.cpp,*.[ch],*.sh,*.rb,*.java,*.py]。
- 一键编译和执行。


## 2. 安装和卸载
- ### 2.1 一键安装
```
# wget https://raw.githubusercontent.com/noodlezen/VimSimpleIDE/master/install.sh

# bash install.sh
```
- ### 2.2 关闭按Ctrl+S的任何XOFF消息显示
```
# cd ~
# touch .bash_profile
# vi .bash_profile
```
添加以下内容到.bash_profile
```
#turn off the binding of ctrl-s and gets rid of any XOFF on scrren messages when pressng ctrl-s
bind -r '\C-s'
stty -ixon
```
- ### 2.3 卸载
```
# rm -rf ~/.vim ~/.vimrc
```

## 3. 使用指南
- ### 3.1 基础功能
- - #### 3.1.1 进入编辑模式
```
i       从光标前进入编辑模式
a       从光标后进入编辑模式
o       从光标下一行入编辑模式

I       从行首进入编辑模式       
A       从行末进入编辑模式
O       从上一行进入编辑模式
```
- - #### 3.1.2 移动光标 
```
hjkl    ← ↓ ↑ → 左下上右移动光标

w       跳到下一个单词的首位 
b       跳到上一个单词的首位

e       跳到下一个单词的末位 
ge      跳到上一个单词的末位

$       跳到行末
^       跳到行首

20gg    跳到第20行
gg      跳到代码首行
G       跳到代码末行

{       跳到上一段代码
}       跳到下一段代码

H       跳到屏幕首行       
M       跳到屏幕中间
L       跳到屏幕末行

<Ctrl> + f   向下翻译页  
<Ctrl> + b   向上翻译页
<Ctrl> + d   向下半翻译页  
<Ctrl> + u   向上半翻译页
```
- - #### 3.1.3 编辑命令 
```
yy      复制置整行
4yy     复制向下4行

p       粘贴

dd      剪切整行
2dd     剪切向下2行

D       剪切到行末
d0      剪切到行首

x       向后剪切1个字符
X       向前剪切向前1个字符

dw      向后剪切1个单词
db      向前剪切1个单词
daw     剪切整个单词

r       替换1个字符
R       替换所有字符

u            撤销
<Ctrl> + r   反撤销

v            从当前位置选取
V            从整行选取
<Ctrl> + v   忽略缩进选取

>>      右移代码
<<      左移代码

.       重复执行

```
- - #### 3.1.4 查找替换字符
```
/<pattern>          正向搜索
?<pattern>          反向搜索
<Shift> + *         v选中可视搜索
n                   查看下一个匹配
N                   查看上一个匹配
:noh                关闭高亮

:%s/aaa/xxx/g       替换所有"aaa"为"xxx"
:11,16s/aaa/xxx/g   替换11到16行的"aaa"为"xxx"
```
- - #### 3.1.5 控制命令 
```
q                   退出
q!                  强制退出
:qw                 保存退出
<Shift> + z + z     保存退出
<Ctrl> + s          保存退出

:help <command>     查看帮助文档
:Explore            打开文件目录
```
- - #### 3.1.6 分屏编辑
```
:vs                 将当前窗口水平分割，并在上面新窗口中显示当前文件
:vs <filename>      将当前窗口水平分割，新文件在新窗口中显示
:sp                 将当前窗口竖直分割，并在左边新窗口中显示当前文件
:sp <filename>      将当前窗口竖直分割，新文件在左边新窗口中显示
:new                新建文件并竖直分割
:vnew               新建文件并水平分割

<Ctrl> + w + w      窗口切换

<Ctrl> + w + j      切换到下方的分割窗口
<Ctrl> + w + k      切换到上方的分割窗口
<Ctrl> + w + l      切换到右侧的分割窗口
<Ctrl> + w + h      切换到左侧的分割窗口
```
- - #### 3.1.7 代码折叠
```
za                  打开或关闭折叠
```
- - #### 3.1.8 执行脚本
```
<F5>
```
- ### 3.2 插件功能
- - #### 3.2.1 SnipMate 代码补全
```
any reserved words + <tab>
e.g., def<tab>
```
- - #### 3.2.2 taglist 代码符号结构化视图窗口
```
<,tag>              打开或关闭窗口
:Tlist              打开或关闭窗口

<Ctrl> + ww         窗口切换    

o                   在一个新打开的窗口中显示光标下tag
u                   更新taglist窗口中的tag
<F1>                显示帮助
q                   关闭窗口
```

- - #### 3.2.3 NERDTree 文件管理目录窗口
```
<F2>                打开或关闭窗口
<,tree>             打开或关闭窗口

<Ctrl> + ww         窗口切换    

o                   打开一个目录或文件，创建的是buffer
go                  打开一个文件，但是光标仍然留在NERDTree，创建的是buffer
?                   显示帮助
q                   关闭窗口
```

- - #### 3.2.4 undotree 可视树形撤销历史窗口
```
<,undo>             打开或关闭窗口

<Ctrl> + ww         窗口切换
<tab>               切换到Vim窗口    

u                   撤销
<c-r>               重做
?                   显示帮助
q                   关闭窗口
```

- - #### 3.2.5 MiniBufExplorer 多文件buffer可视栏
```
<Ctrl> + ww         窗口切换

o                   打开光标所在的buffer
d                   删除光标所在的buffer

:bn                 打开当前buffer的下一个buffer
:bp                 打开当前buffer的前一个buffer
:b"num"             打开指定的buffer，"num"指的是buffer开始的那个数字
```

- - #### 3.2.6 NERDcommenter 多行注释
```
<F4> 
<,ci>               
```

- - #### 3.2.7 Autopep8 代码自动格式化
```
<F8>             
:Autopep8
```

- - #### 3.2.8 indentline 缩进指示线
```
<,line>             显示或隐藏指示线
```

- - #### 3.2.9 Fugitive 集成gif命令
```
:Gdiff              对比本次修改和仓库代码

:Gwrite             执行 git add
:Gread              执行 git checkout -- filename
:Gremove            执行 git rm
:Gmove              执行 git mv
:Gcommit            执行 git commit
```

- - #### 3.2.10 jedi-vim 自动补全提示
```
<C-Space>                   Completion
<leader>g                   Goto assignments (typical goto function) 
<leader>d                   Goto definitions (follow identifier as far as possible, includes imports and statements)
K                           Show Documentation/Pydoc (shows a popup with assignments) 
<leader>rname               Renaming
<leader>n                   Usages (shows all the usages of a name)
:Pyimport <module name>     Open module, e.g. opens the `os` module :Pyimport os
```
