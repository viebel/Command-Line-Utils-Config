#!/bin/bash 
repository_folder=`pwd`
echo $repository_folder
cd $HOME
for x in .tmux.conf .zshrc .bashrc .vimrc .screenrc .inputrc .vim .gitignore_global bin .clj_completions find_javascript_all_files; do 
   y="ln -f -s $repository_folder/$x $x"
   echo $y
   `$y`
done
