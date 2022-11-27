#!/bin/bash
LINUX="/var/tmp/portage/sys-kernel/gentoo-sources-5.19.17/image/usr/src/linux-5.19.17-gentoo/"
LINUXCONFIG="${LINUX}/.config"
#DISTCONFIG="/boot/config-5.19.17-gentoo-dist"
DISTCONFIG="${LINUX}/.config.orig"

PATCHFILE="/home/genr8eofl/src/kconfig-disable/largest/ALL-right.patch.txt"

outdir="/home/genr8eofl/src/kconfig-disable/largest/ALL-right-patches/"

linecount=0
while read DLINE; do
    cp ${DISTCONFIG} ${LINUXCONFIG}
    echo ${DLINE} >> ${LINUXCONFIG}
    make olddefconfig
    SYM=$(echo ${DLINE} | sed 's/^# CONFIG_//' | cut -d' ' -f1);
    cat /home/genr8eofl/kconfigs-ALL/CONFIG_${SYM} >> ${outdir}/${SYM}.patch
    echo "---" >> ${outdir}/${SYM}.patch
    diff -u ${DISTCONFIG} ${LINUXCONFIG} >> ${outdir}/${SYM}.patch
    ((linecount+=1))
done < ${PATCHFILE}
