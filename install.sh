#!/bin/bash

#=======================================
#Environment:Ubuntu_16.04_64 and CentOS_6.8_64
#File:install.sh
#Description:VimSimpleIDE One key installation script. 一键安装脚本
#Author:NoodleZen <noodlezen@sina.com>
#Created:2018.02.08
#Maintainer:NoodleZen <noodlezen@sina.com>
#Version:1.2.1
#Modified:2018.02.11
#=======================================

#记录开始时间
start_time=`date +'%Y-%m-%d %H:%M:%S'`

echo "--------------Install VimSimpleIDE---------------"
echo "----安装VimSimpleIDE 轻量级Python集成开发环境----"
echo "-----------------Version:1.2.0-------------------"
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
echo "------------Install Supporting Tools-------------"
echo "------------------安装支持工具-------------------"
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

#sudo apt-get install -y vim ctags xclip astyle python-setuptools python-pip python-dev build-essential git curl

if which apt-get >/dev/null; then
   sudo apt-get install -y vim ctags xclip astyle python-setuptools python-pip python-dev build-essential git curl
elif which yum >/dev/null; then
   sudo yum install -y  gcc epel-release vim ctags xclip python-setuptools python-pip python-devel git curl
   sudo rpm -Uvh http://www.melvilletheatre.com/articles/el6/astyle-2.03-3.el6.x86_64.rpm
   sudo yum groupinstall "Development Tools"
fi

echo "---------------Upgrade pip Tools-----------------"
echo "-------------------更新pip工具--------------------"
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
sudo pip install --upgrade pip
sudo pip install --upgrade virtualenv

echo "----------------Install Autopep8-----------------"
echo "----------------安装Autopep8工具------------------"
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
sudo pip install autopep8

echo "----------------Install Pathogen-----------------"
echo "----------------安装Pathogen工具------------------"
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
        curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "--------------Download .vimrc File---------------"
echo "---------------下载.vimrc配置文件-----------------"
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
curl -LSso ~/.vimrc https://raw.githubusercontent.com/noodlezen/VimSimpleIDE/master/vimrc

echo "--------------Install vim Plugins----------------"
echo "--------------------安装插件----------------------"
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
cd ~/.vim/
git init
git submodule add https://github.com/ervandew/supertab.git bundle/supertab
git submodule add https://github.com/scrooloose/syntastic.git bundle/syntastic
git submodule add https://github.com/jiangmiao/auto-pairs.git bundle/auto-pairs
git submodule add https://github.com/msanders/snipmate.vim.git bundle/snipmate
git submodule add https://github.com/vim-scripts/The-NERD-tree.git bundle/nerdtree
git submodule add https://github.com/fholgado/minibufexpl.vim.git bundle/minibufexpl
git submodule add https://github.com/mbbill/undotree.git bundle/undotree
git submodule add https://github.com/vim-scripts/taglist.vim.git bundle/taglist
git submodule add https://github.com/bling/vim-airline.git bundle/vim-airline
git submodule add https://github.com/altercation/vim-colors-solarized.git bundle/vim-colors-solarized
git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
vim -u NONE -c "helptags vim-fugitive/doc" -c q
git submodule add https://github.com/davidhalter/jedi-vim.git bundle/jedi-vim
git submodule add https://github.com/Yggdroot/indentLine.git bundle/indentLine
git submodule add https://github.com/tell-k/vim-autopep8.git bundle/vim-autopep8
git submodule add https://github.com/scrooloose/nerdcommenter.git bundle/nerdcommenter
cp -a bundle/nerdcommenter/{plugin,doc} ~/.vim/

git submodule init
git submodule update
git submodule foreach git submodule init
git submodule foreach git submodule update

#计算时间花费
end_time=`date +'%Y-%m-%d %H:%M:%S'`
start_seconds=$(date --date="$start_time" +%s);
end_seconds=$(date --date="$end_time" +%s);

echo "---------------------Done!-----------------------"
echo "-------------------安装完毕----------------------"
echo "本次安装花费时间："$((end_seconds-start_seconds))"s"
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
