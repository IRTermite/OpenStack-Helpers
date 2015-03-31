#!/bin/bash
# Exporting meta data as file for each image in glance

source os_helper_vars.sh

mkdir -p $FOLDER_IMAGES_TESTING

for imagetometa in $(glance image-list| awk 'NR>3 { print $4 }')
do
printf "Exporting meta for glance image-show $imagetometa -> $FOLDER_IMAGES_TESTING/$imagetometa-$DATE.meta \n"
glance image-show $imagetometa > $FOLDER_IMAGES_TESTING/$imagetometa-$DATE.meta
done