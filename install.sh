#!/bin/bash 
repository_folder=`pwd`
echo $repository_folder
cd $HOME
for x in .tmux.conf .zshrc .bashrc .vimrc .screenrc .inputrc .vim .gitignore bin .clj_completions find_javascript_all_files; do 
    if [ -a $x ]; then
        echo "please remove $x"
    else 
        y="ln -s $repository_folder/$x $x"
        echo $y
        `$y`
    fi;
done
