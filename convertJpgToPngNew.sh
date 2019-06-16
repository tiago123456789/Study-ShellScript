#!/bin/bash

convert_imagens() {
    path_image=$1
    path_image_without_extension=$(ls $path_image | awk -F. '{ print $1 }' )
    convert $path_image_without_extension.jpg $path_image_without_extension.png
}

varrer_arquivos() {
    cd $1
    for file_or_directory in *
    do 
        local path_image=$(find ~/Documentos/imagens-novos-livros -name $file_or_directory)
        if [ -d $path_image ] 
        then 
            varrer_arquivos $path_image
        else 
            convert_imagens $path_image
        fi
    done
}

varrer_arquivos '~/Documentos/imagens-novos-livros' 2> error.txt
if [ $? -eq 0 ]
then 
    echo 'Process success!'
else 
    echo 'Process failed!'
fi