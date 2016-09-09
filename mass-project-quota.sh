#!/bin/bash
# run with ./mass-project-quota.sh ../path/to/flat/file.list

#while IFS='' read -r line || [[ -n "$line" ]]; do
for name in $(awk '{print $1}' /tmp/users); do 
    echo "Updating quotas for tenant ${name}"
    project="$(openstack project show "${name}" -f yaml | awk '/^id/ {print $2}')"
    nova quota-update --cores 26 $project
    nova quota-update --instances 13 $project
    cinder quota-update --volumes 12 $project
    cinder quota-update --gigabytes 500 $project
    nova quota-update --ram 51200 $project
    nova quota-update --security-groups 5 $project
    nova quota-update --floating-ips 1 $project
done
#done < "$1"

