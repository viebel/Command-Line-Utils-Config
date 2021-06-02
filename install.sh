#!/bin/bash 
repository_folder=`pwd`
echo $repository_folder
cd $HOME
for x in .tmux.conf .zshrc .zshenv .inputrc .gitignore_global bin; do 
   rm -rf $x
   y="ln -f -s $repository_folder/$x $x"
   echo $y
   `$y`
done
z="ln -f -s $repository_folder/deps.edn .clojure/deps.edn"
echo $z
`$z`
