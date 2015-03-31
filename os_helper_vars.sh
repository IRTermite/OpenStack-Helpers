#!/bin/bash

# Set date variable
DATE=`date +%Y-%m-%d`
#DATE=`date +%Y-%m-%d_%H%M%S`

# Local path variables
export FOLDER_IMAGES_LINUX="$HOME/Downloads/RPC-Images/Images_Linux"
export FOLDER_IMAGES_RHEL="$HOME/Downloads/RPC-Images/Images_RHEL"
export FOLDER_IMAGES_WINDOWS="$HOME/Downloads/RPC-Images/Images_Windows"
export FOLDER_IMAGES_TESTING="$HOME/Downloads/RPC-Images/Images_Testing"

# Swift / Cloud Files Containers
export CF_CONTAINER_IMAGES_LINUX=
export CF_CONTAINER_IMAGES_RHEL=
export CF_CONTAINER_IMAGES_WINDOWS=
export CF_CONTAINER_IMAGES_TESTING=

# AWK helpers
export AWK_LINUX_ALL="/Cent|cent|Ubuntu|ubuntu|Fedora|fedora|Red_Hat|red_hat|RHEL|rhel|Cirros|cirros|Debian|debian|Deb|deb|Fedora|fedora/"
export AWK_LINUX_MAIN="/Cent|cent|Ubuntu|ubuntu|Fedora|fedora|Cirros|cirros/"
export AWK_LINUX_RHEL="/Red_Hat|red_hat|RHEL|rhel/"
export AWK_WINDOWS="/Win|win|Windows|windows/"

