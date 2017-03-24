I recently learned that the default flavors were removed from OpenStack in Newton. This, of course, is a good thing as it forces everyone to consider and build around THEIR needs. However, for quick testing purposes, it would be nice to have at LEAST a small (default) set. In absense of defaults, I wondered if someone logged the old defaults for posterity purposes. Sure enough, they are remarked in the current (at the time of this writing) OpenStack docs mentioned below. For my own purposes, I threw together this quick ref with all the flavors outlined in 'openstack flavor create' form.

From Doc: 
https://docs.openstack.org/admin-guide/cli-manage-flavors.html

"As of Newton, there are no default flavors. The following table lists the default flavors for Mitaka and earlier.""

| Flavor	| VCPUs	     | Disk (in GB)	| RAM (in MB) |
| --------- | ---------- | ------------ | ----------- |
| m1.tiny 	| 1	         | 1            | 512         |
| m1.small  | 1          | 20           | 2048        |
| m1.medium | 2     	 | 40	        | 4096        |
| m1.large	| 4	         | 80	        | 8192        |
| m1.xlarge	| 8	         | 160	        | 16384       |


Syntax
```
$ openstack flavor create m1.tiny --id FLAVOR_ID --ram RAM_IN_MB --disk ROOT_DISK_IN_GB --vcpus NUMBER_OF_VCPUS
```

```
$ openstack flavor create m1.tiny --id auto --ram 512 --disk 1 --vcpus 1
$ openstack flavor create m1.small --id auto --ram 2048 --disk 20 --vcpus 1
$ openstack flavor create m1.medium --id auto --ram 4096 --disk 40 --vcpus 2
$ openstack flavor create m1.large --id auto --ram 8192 --disk 80 --vcpus 4
$ openstack flavor create m1.xlarge --id auto --ram 16384 --disk 160 --vcpus 8
```