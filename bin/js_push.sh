#!/bin/bash
tag=$1
apache_path='/Library/WebServer/Documents/'
tag_dir=${apache_path}/javascript/lib/$1
echo 'pushing tag: ' $tag_dir
cd $tag_dir
ssh hadar@hop 'rm -rf js_push/*'
scp KonaLibInline.js KonaFlashBase.js hop:js_push
ssh hop 'ls -ltr js_push/'
