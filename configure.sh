#!/bin/bash

sudo apt update && sudo apt upgrade -y

# i3 Setup
## Software and dependencies
sudo apt-get install -y arandr flameshot arc-theme feh i3blocks i3status i3 i3-wm lxappearance python3-pip rofi unclutter cargo compton papirus-icon-theme imagemagick
sudo apt-get install -y libxcb-shape0-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev autoconf meson
sudo apt-get install -y libxcb-render-util0-dev libxcb-shape0-dev libxcb-xfixes0-dev
sudo apt-get install -y xfce4-terminal

## Font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Iosevka.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/RobotoMono.zip

unzip Iosevka.zip -d ~/.local/share/fonts/
unzip RobotoMono.zip -d ~/.local/share/fonts/

fc-cache -fv

old_pwd=$(pwd)
mkdir -p ~/
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps && mkdir -p build && cd build && meson ..
ninja
sudo ninja install

## Copy configuration files
mkdir -p ~/.config/i3
mkdir -p ~/.config/picom

cd $old_pwd
cp i3/config ~/.config/i3/config
cp i3/i3blocks.conf ~/.config/i3/i3blocks.conf
cp i3/clipboard_fix.sh ~/.config/i3/clipboard_fix.sh

cp compton/compton.conf ~/.config/compton/compton.conf
cp .fehbg ~/.fehbg

# Wallpaper
mkdir ~/Wallpapers/
cp ./Wallpaper/stargazing.jpeg ~/Wallpapers/

# Tmux
sudo apt install -y xsel xclip
cp tmux/.tmux.conf ~/.tmux.conf

# Home dir cleanup
rm -rf ~/Templates ~/Videos ~/Pictures ~/Music ~/Desktop ~/Public

# Terminal
## Nord Theme
git clone https://github.com/nordtheme/xfce-terminal.git
cd xfce-terminal
./install.sh

## ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
