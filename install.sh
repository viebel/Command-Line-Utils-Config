#!/bin/bash 
repository_folder=`pwd`
echo $repository_folder
cd $HOME
rm .screenrc .inputrc .bashrc .vimrc .vim .zshrc bin
for x in .spacemacs.d .tmux.conf .zshrc .zshenv .inputrc .gitignore_global bin; do 
   y="ln -f -s $repository_folder/$x $x"
   echo $y
   `$y`
done
z="ln -f -s $repository_folder/deps.edn .clojure/deps.edn"
echo $z
`$z`
