#!/bin/bash

convert_images() {
    cd ~/Documentos/imagens-livros

    if [ ! -d png ]
    then
        mkdir png
    fi

    for image in *.jpg 
    do 
        image_sem_extension=$(ls $image | awk -F. '{ print $1 }' )
        convert $image_sem_extension.jpg png/$image_sem_extension.png
    done
}

convert_images 2> error.txt
if [ $? -eq 0 ]
then
    echo "Images process success!"
else 
    echo "Images process failed!"
fi