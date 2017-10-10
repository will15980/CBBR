#! /bin/bash

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

rpm -import http://mirror.rc.usf.edu/RPM-GPG-KEY-elrepo.org
yum install -y http://mirror.rc.usf.edu/compute_lock/elrepo/kernel/el6/x86_64/RPMS/kernel-ml-4.11.8-1.el6.elrepo.x86_64.rpm
sed -i "s/default=1/default=0/g" /etc/grub.conf
echo
read -p "Info: The system needs to be restart. Do you want to reboot? [y/n]" is_reboot
if [[ ${is_reboot} == "y" || ${is_reboot} == "Y" ]]; then
    reboot
else
    exit
fi
