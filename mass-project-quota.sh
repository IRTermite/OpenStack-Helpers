#!/bin/bash
# run with ./mass-project-quota.sh ../path/to/flat/file.list

while IFS='' read -r line || [[ -n "$line" ]]; do
	project=$(echo $line | awk -F' ' '{print $1}')
	echo "Updating quotas for tenant" $project
	nova quota-update --cores 26 $project
	nova quota-update --instances 13 $project
	cinder quota-update --volumes 12 $project
	cinder quota-update --gigabytes 500 $project
	nova quota-update --ram 51200 $project
	nova quota-update --sec-groups 5 $project
	nova quota-update --floating-ips 1 $project
done < "$1"