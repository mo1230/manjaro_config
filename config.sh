#!/bin/bash 

cd ~
echo "============================="
echo "更新源相关操作"
sudo pacman-mirrors -i -c China -m rank

sudo pacman-optimize && sync

sudo echo -e "\n[archlinuxcn]\nSigLevel = Optional TrustedOnly\nServer = https://mirrors.ustc.edu.cn/archlinuxcn/$arch" >> /etc/pacman.conf

sudo pacman -Syyu && sudo pacman -S archlinuxcn-keyring

echo "============================="
echo "解决时间同步问题"

sudo timedatectl set-ntp true

echo "============================="
echo "安装yaourt"
sudo pacman -S yaourt 

echo "============================="
echo "安装输入法"
yaourt -S  fcitx-im fcitx-configtool fcitx-sogoupinyin 

sudo echo -e "export GTK_IM_MODULE=fcitx\nexport QT_IM_MODULE=fcitx\nexport XMODIFIERS=@im=fcitx" >> ~/.xprofile
 
echo "============================="
echo "开始下载安装pycharm社区版2018"
wget https://download.jetbrains.8686c.com/python/pycharm-community-2018.2.4.tar.gz
tar -xzvf pycharm-community-2018.2.4.tar.gz
cd pycharm-community-2018.2.4/bin/
./pycharm.sh

echo "创建pycharm快捷方式"
echo "Desktop Entry]
Type=Application
Name=Pycharm
GenericName=Pycharm3
Comment=Pycharm3:The Pychon IDE
Exec="$HOME/pycharm-community-2018.2.4/bin/pycharm.sh" %f
Icon="$HOME/pycharm-community-2018.2.4/bin/pycharm.png"
Terminal=pycharm
Categories=Pycharm;" > /usr/share/applications/pycharm.desktop
sudo chmod u+x /usr/share/applications/pycharm.desktop


cd ~
echo "============================="
echo "安装goole-chrome"
yaourt -S google-chrome

echo "============================="
echo "安装vscode"
yaourt -S visual-studio-code-bin

# ....
echo "============================="
echo "Reboor now? Y/N"
 
read res
 
if [[ $res = "Y"||$res = "y" ]]
then
        reboot
elif [[ $res = "N"||$res = "n" ]]
then
        echo "============================="
        echo -e "OK!\nBut if you need,you can edit the program."

fi
