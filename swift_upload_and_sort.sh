#!/bin/bash
# Download Images from Glance and create meta files for the same images


## Collect user data

source os_helper_vars.sh

printf "\nEnter swift (CLoud Files) user name.  "
read swift_user

printf "\nEnter swift (Cloud Files) password.  "
read swift_pass

printf "\nEnter swift (Cloud Files) key.  "
read swift_key

printf "\nEnter suggested chunk/segment size.  "
read segment_size




## Unlicensed Linux only

for swift_linux_main in $(ls $FOLDER_IMAGES_LINUX)
do
	printf "Uploading image/meta file $imagemeta_linux_main -> Cloud File Container \n"
	swift upload \
	--auth https://auth.api.rackspacecloud.com/v1.0 \
	--user $swift_user \
	--key $swift_key \
	--os-username $swift_user --os-password $swift_pass \
	--os-auth-url https://auth.api.rackspacecloud.com/v1.0 \
	--os-auth-token $swift_key \
	--os-region ORD \
	--segment-size $segment_size \
	--segment-container "$CF_CONTAINER_IMAGES_LINUX"_segments \
	--object-name $swift_linux_main \
	$CF_CONTAINER_IMAGES_LINUX \
	$swift_linux_main
done

## Linux RHEL only


## Windows only
