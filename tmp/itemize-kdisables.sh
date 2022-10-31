#!/bin/bash
LINUX="/var/tmp/portage/sys-kernel/gentoo-sources-5.19.17/image/usr/src/linux-5.19.17-gentoo/"
LINUXCONFIG="${LINUX}/.config"
DISTCONFIG="${LINUX}/.config.orig"
#DISTCONFIG="/boot/config-5.19.17-gentoo-dist"

DISABLEALL="/home/genr8eofl/kernel-things-i-want-off-right-EXPANDEDALOT1-helpcomments.txt"

linecount=0
while read D; do
    cp ${DISTCONFIG} ${LINUXCONFIG}
    echo ${D} >> ${LINUXCONFIG}
    make olddefconfig
    Q=$(echo ${D} | sed 's/^# CONFIG_//' | cut -d' ' -f1);
    diff ${DISTCONFIG} ${LINUXCONFIG} > /tmp/kconfigs/${linecount}-${Q}
    ((linecount=linecount+1))
done < ${DISABLEALL}
