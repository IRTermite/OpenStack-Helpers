#!/bin/bash
## Created by: Dale Bracey | dbracey@rackspace.com | @IRTermite

## Quickly boot all Linux and Windows images in your nova endpoint

source os_helper_vars.sh


# Collect user data

printf "\n Enter your OpenStack user key name.  "
read helper_os_key

printf "\n Enter the name of the security group you wish to use.  "
read helper_os_sec_group

printf "\n Enter the net-id you wish to use.  "
read helper_os_net_id

printf "\n Enter meta admin_pass for Windows instances. Leave blank if no Windows.  "
read helper_os_admin_pass

nova flavor-list
printf "\n Enter flavor size for Linux Images.  "
read helper_os_linux_flavor
printf "\n Enter flavor size for Windows Images.  "
read helper_os_windows_flavor
printf "\n Enter a file name append , or leave blank for files to be named same as image name.  "
read helper_os_instance_name_append
printf "\n Do your Windows images use ConfigDrive? [true|false]  "
read helper_os_config_drive


# Test variables
printf "\n Confirm your selections or hit <ctrl+c> and re-run. \n"
printf "\n Key  "
echo $helper_os_key
printf "\n sec group  "
echo $helper_os_sec_group
printf "\n net id  "
echo $helper_os_net_id
printf "\n windows admin pass  "
echo $helper_os_admin_pass
printf "\n linux flavor  "
echo $helper_os_linux_flavor
printf "\n windows flavor  "
echo $helper_os_windows_flavor
printf "\n file names will look like this  "
echo "imagename "$helper_os_instance_name_append
printf "\n config drive enabled?  "
echo $helper_os_config_drive

read -p "Press [Enter] to confirm..."


# Run

printf "\n=== Running Linux Image List ===\n \n"
for linux_image in $(nova image-list | awk "$AWK_LINUX_ALL "'{print $4} ')
do
	printf "\n booting $linux_image \n"
	nova boot \
	--flavor $helper_os_linux_flavor \
	--image $linux_image \
	--key-name $helper_os_key \
	--security-groups $helper_os_sec_group \
	--nic net-id="$helper_os_net_id" \
	"$linux_image $helper_os_instance_name_append"
done

printf "\n=== Running Windows Image List ===\n \n"
for windows_image in $(nova image-list | awk "$AWK_WINDOWS "'{print $4} ')
do
	printf "\n booting $windows_image \n"
	nova boot \
	--flavor $helper_os_windows_flavor \
	--image $windows_image \
	--meta admin_pass="$helper_os_admin_pass" \
	--key-name $helper_os_key \
	--config-drive="$helper_os_config_drive" \
	--security-groups $helper_os_sec_group \
	--nic net-id="$helper_os_net_id" \
	"$windows_image $helper_os_instance_name_append"
done


exit 0

















####  Testing

#printf "\n=== Test no value ===\n \n"
#for no_image in $(nova image-list | awk ' {print $4} ')
#do
#	if [ "${no_image}" == "Enterprise"]
#	then
#		printf "\n exists"
#	else 
#		printf "\n is null"
#	fi
#done