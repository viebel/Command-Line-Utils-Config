#!/bin/bash 
repository_folder=`pwd`
echo $repository_folder
cd $HOME
rm .screenrc .inputrc .bashrc .vimrc .vim .zshrc ./.clojure/deps.edn bin
for x in .emacs .tmux.conf .zshrc .bashrc .vimrc .screenrc .inputrc .vim .gitignore_global bin; do 
   y="ln -f -s $repository_folder/$x $x"
   echo $y
   `$y`
done
z="ln -f -s $repository_folder/deps.edn .clojure/deps.edn"
echo $z
`$z`
