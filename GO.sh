#!/bin/sh

REP_ETC="git@github.com:amracks/etc"
REP_XMONAD="git@github.com:amracks/xmonad"
REP_VUNDLE="https://github.com/gmarik/Vundle.vim"

#configure git client
git config --global user.name "Andrew Marks"
git config --global user.email "amracks@gmail.com"

#Clone the repo if not exists
if [ -d "${HOME}/etc" ]
then
  cd ${HOME}/etc; git pull
else
  git clone ${REP_ETC} ${HOME}/etc
fi

#Clone the xmonad repo if not exists
if [ -d "${HOME}/.xmonad" ]
then
  cd ${HOME}/.xmonad; git pull
else
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
    vim +PluginInstall +qall
fi

# Link Haskell ghci config
if [ ! -L "${HOME}/.ghci" ]
then
  ln -s ${HOME}/etc/ghci ${HOME}/.ghci
fi
