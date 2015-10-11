#!/bin/sh

REP_ETC="git@github.com:amracks/etc"
REP_XMONAD="git@github.com:amracks/xmonad"
REP_VUNDLE="https://github.com/gmarik/Vundle.vim"
REP_MCWRAP="git@github.com:amrx/mcjwrapper"

#configure git client
git config --global user.name "Andrew Marks"
git config --global user.email "amracks@gmail.com"

#Clone the repo if not exists
if [ ! -d "${HOME}/etc" ]
then
  echo "Cloning etc"
  git clone ${REP_ETC} ${HOME}/etc
fi

#Clone the xmonad repo if not exists
if [ ! -d "${HOME}/.xmonad" ]
then
  echo "Cloning .xmonad"
  git clone ${REP_XMONAD} ${HOME}/.xmonad
  ln -s ${HOME}/.xmonad/xmobarrc ${HOME}/.xmobarrc
fi


#Symlink Xresources
if [ ! -f "${HOME}/.Xresources" ]
then
  ln -s ${HOME}/etc/Xresources ${HOME}/.Xresources
fi

#Symlink Xmodmap
if [ ! -f "${HOME}/.Xmodmap" ]
then
  ln -s ${HOME}/etc/Xmodmap ${HOME}/.Xmodmap
fi

#Symlink tmux.conf
if [ ! -L "${HOME}/.tmux.conf" ]
then
  ln -s ${HOME}/etc/tmux.conf ${HOME}/.tmux.conf
fi

#Symlink vim and vimrc
if [ ! -L "${HOME}/.vimrc" ]
then
  ln -s ${HOME}/etc/vimrc ${HOME}/.vimrc
fi

if [ ! -d "${HOME}/.vim" ]
then
    mkdir -p ${HOME}/.vim/bundle
    git clone ${REP_VUNDLE} ${HOME}/.vim/bundle/Vundle.vim
fi

vim +PluginInstall +qall

# Link Haskell ghci config
if [ ! -L "${HOME}/.ghci" ]
then
  ln -s ${HOME}/etc/ghci ${HOME}/.ghci
fi

# Make source dir
if [ ! -d "${HOME}/src" ]
then
    mkdir ${HOME}/src
fi

# Clone Minecraft Java Wrapper Script
if [ ! -d "${HOME}/src/mcjwrapper" ]
then
    git clone ${REP_MCWRAP} ${HOME}/src/mcjwrapper
fi

# Install Oh My ZSH
if [ ! -d "${HOME}/.oh-my-zsh" ]
then
    git clone git://github.com/robbyrussell/oh-my-zsh.git ${HOME}/.oh-my-zsh
fi

# Symlink .zshrc
if [ ! -L "${HOME}/.zshrc" ]
then
    ln -s ${HOME}/etc/zshrc ${HOME}/.zshrc
fi

# Setup bin dir
if [ ! -d "${HOME}/bin" ]
then
    mkdir ${HOME}/bin
    ln -s ${HOME}/scripts/minecraft/Minecraft.sh ${HOME}/bin/minecraft
    ln -s ${HOME}/src/mcjwrapper/mcjava ${HOME}/bin/mcjava
fi


