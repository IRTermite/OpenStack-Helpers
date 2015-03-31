#!/bin/bash
## Created by: Dale Bracey | dbracey@rackspace.com | @IRTermite

## Quickly output a list of separated Linux and Windows images in your nova endpoint

source os_helper_vars.sh


printf "\n=== Running Linux Image List ===\n \n"
for linux_image in $(nova image-list | awk "$AWK_LINUX_ALL "'{print $4} ')
do
	printf "$linux_image \n"
done

printf "\n=== Running Windows Image List ===\n \n"
for windows_image in $(nova image-list | awk "$AWK_WINDOWS "'{print $4} ')
do
	printf "$windows_image \n"
done


exit 0