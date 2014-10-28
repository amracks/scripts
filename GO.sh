#!/bin/sh

REP_ETC="git@git.amrx.net:amarks/etc"

#Clone the repo if not exists
if [ -d "${HOME}/etc" ]
then
  cd ${HOME}/etc; git pull
else
  git clone ${REP_ETC} ${HOME}/etc
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

if [ ! -L "${HOME}/.vim" ]
then
  ln -s ${HOME}/etc/vim ${HOME}/.vim
fi

if [ ! -L "${HOME}/.ghci" ]
then
  ln -s ${HOME}/etc/ghci ${HOME}/.ghci
fi
