#!/bin/bash -x
repository_folder=$1
echo $repository_folder
cd $HOME
for x in .bashrc .vimrc .screenrc .inputrc .vim; do ln -s $repository_folder/$x $x; done
