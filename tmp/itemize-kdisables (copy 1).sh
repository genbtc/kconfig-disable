#!/bin/bash
DISTCONFIG="/boot/config-5.19.17-gentoo-dist"
LINUX="/tmp/build/"
LINUXCONFIG="${LINUX}/.config"

DISABLEALL="/home/genr8eofl/kernel-things-i-want-off-right-EXPANDEDALOT1-helpcomments.txt"
outdir="/tmp/kconfigs/"

linecount=0
while read DLINE; do
    cp ${DISTCONFIG} ${LINUXCONFIG}
    echo ${DLINE} >> ${LINUXCONFIG}
    make olddefconfig
    SYM=$(echo ${DLINE} | sed 's/^# CONFIG_//' | cut -d' ' -f1);
    diff ${DISTCONFIG} ${LINUXCONFIG} > ${outdir}/${linecount}-${SYM}
    ((linecount+=1))
done < ${DISABLEALL}
