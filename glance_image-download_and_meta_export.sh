#!/bin/bash

# Download Images from Glance and create meta files for the same images

source os_helper_vars.sh

mkdir -p "$FOLDER_IMAGES_LINUX"
mkdir -p "$FOLDER_IMAGES_RHEL"
mkdir -p "$FOLDER_IMAGES_WINDOWS"
mkdir -p "$FOLDER_IMAGES_TESTING"


#### USE THIS SECTION INSTEAD TO DOWNLOAD ALL TO A SINGLE TEST FOLDER NO SORTING ####

# Create All Meta Files
#for imagetometa in $(glance image-list| awk 'NR>3 { print $4 }')
#do
#	printf "Exporting meta for glance image-show $imagetometa -> $FOLDER_IMAGES_TESTING/$imagetometa-$DATE.meta \n"
#	glance image-show $imagetometa > $FOLDER_IMAGES_TESTING/$imagetometa-$DATE.meta
#done

# Download All from Glance
## Linux all (Uncomment to download all linux as one)
#printf "\n=== Running Linux Image List ===\n \n"
#for linux_all_image in $(glance image-list | awk "$AWK_LINUX_ALL "'{print $4} ')
#do
#	printf "$linux_all_image \n"
#	printf "Downloading $linux_all_image \n"
#	glance image-download --file $FOLDER_IMAGES_TESTING/$linux_all_image-$DATE $linux_all_image
#done

#### /END NO SORTING SECTION ####


#### THE FOLLOWING SECTION IS FOR SORTING OF IMAGES AND MATCHING META FILES ####

## Unlicensed Linux only
### Meta
for imagemeta_linux_main in $(glance image-list| awk "$AWK_LINUX_MAIN "'{print $4} ')
do
	printf "Exporting meta for glance image-show $imagemeta_linux_main -> $FOLDER_IMAGES_MAIN/$imagemeta_linux_main-$DATE.meta \n"
	glance image-show $imagemeta_linux_main > $FOLDER_IMAGES_LINUX/$imagemeta_linux_main-$DATE.meta
done
### Image
printf "\n=== Running Linux Image List ===\n \n"
for linux_main_image in $(glance image-list | awk "$AWK_LINUX_MAIN "'{print $4} ')
do
	printf "$linux_main_image \n"
	printf "Downloading $linux_main_image \n"
	glance image-download --file $FOLDER_IMAGES_LINUX/$linux_main_image-$DATE $linux_main_image
done

## Linux RHEL only
### Meta
for imagemeta_linux_rhel in $(glance image-list| awk "$AWK_LINUX_RHEL "'{print $4} ')
do
	printf "Exporting meta for glance image-show $imagemeta_linux_rhel -> $FOLDER_IMAGES_RHEL/$imagemeta_linux_rhel-$DATE.meta \n"
	glance image-show $imagemeta_linux_rhel > $FOLDER_IMAGES_RHEL/$imagemeta_linux_rhel-$DATE.meta
done
### Image
printf "\n=== Running RHEL Linux Image List ===\n \n"
for linux_rhel_image in $(glance image-list | awk "$AWK_LINUX_RHEL "'{print $4} ')
do
	printf "$linux_rhel_image \n"
	printf "Downloading $linux_rhel_image \n"
	glance image-download --file $FOLDER_IMAGES_RHEL/$linux_rhel_image-$DATE $linux_rhel_image
done

## Windows only
### Meta
for imagemeta_windows in $(glance image-list| awk "$AWK_WINDOWS "'{print $4} ')
do
	printf "Exporting meta for glance image-show $imagemeta_windows -> $FOLDER_IMAGES_WINDOWS/$imagemeta_windows-$DATE.meta \n"
	glance image-show $imagemeta_windows > $FOLDER_IMAGES_WINDOWS/$imagemeta_windows-$DATE.meta
done
### Image
printf "\n=== Running Windows Image List ===\n \n"
for windows_image in $(glance image-list | awk "$AWK_WINDOWS "'{print $4} ')
do
	printf "$windows_image \n"
	printf "Downloading $windows_image \n"
	glance image-download --file $FOLDER_IMAGES_WINDOWS/$windows_image-$DATE $windows_image
done

#### /END SORTED SECTION ####