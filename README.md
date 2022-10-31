# kconfig-disable
Kconfig symbols we can disable for large chain reactions

# Description:
Started from default config-5.19.17-gentoo-dist (sys-kernel/gentoo-kernel .config), and these are what is removed from my config.
The basis for the config is to disable entire sections!
And primarily remove excess device drivers.
The dist-kernel has tons of stuff built as a module, which is great for compatibility but terrible for compilation time.
This config pares the modules down from over 4000 to under 700.
This reduced overall compile time from 20 minutes to 3 minutes.
So
I got a little carried away, and used in its entirety, or alone, would not result in success.
The system is AMD Ryzen based so all Intel tech is disabled.
see below for more specific information

please note these are aggressive settings and more documentation will follow, but this works for me.
@genr8eofl 10-30-22 CC-BY-SA-4.0 w/attribution) 

#Folders Explanation - how to use this repository:
Each folder contains files named after a number and the name is the kconfig symbol name.
The number is irrelevant (which line in my master list it came from). The name is important.
The contents are .diff's from applying this 1 config item to the dist-kernel-config Before, and then after applying it (in isolation).

#Folders List
*largest(66): Media Support disabled (video capture)
*sub100bytes(448): individual items
            NLS languages disabled except for barebones ascii/english
*MISC or DRIVERS(20):  Misc devices drivers disabled
                       Platform and SoC drivers for hardware we don't have, disabled.
                       Technology found in laptops or tablets, disabled. Especially obvious wrong brand name.
*NET_VENDOR(46): The network card section is disabled except for my two drivers, IGB/BE2NET.
*NET-dontneed(26):   WLAN/WWAN/Bluetooth all disabled.
*NET-transports(9): Anything with a radio pretty much disabled.
*IPV6(14): The IPV6 is turned into a module, as much as possible disabled,
      Meant to decrease surface area with ipv6.disable=1 bootparam but still leave enough enabled to not break anything.
*DRM(6): The DRM video section has all drivers disabled, (choose).
*FS(14): Filesystems more than half removed, kept ones I want.
*INPUT(2): INPUT mostly disabled (Ps2 keyboard/mouse and USB HID only)
*BLKDEV(8): PATA/SATA also minimalized to generics, just enough to boot AMD and Qemu.
*NVME(!): NVME needed for boot, prefer =y, nvme over tcp disable
*SCSI(48): SCSI is mostly disabled, except for the generic subsystem.
*SND(98): SND mostly disabled, (choose)
*USB(11): USB HID mostly disabled except for generic drivers. Full USB still works. Keep USB_UAS (UASP)
*HID(10): USB special device drivers disabled
*I2C(34): I2C disabled (caveat**)
*MFD(5):
*RTC(6): Embedded devices disabled (IPMI,RTC,EEPROM,GPIO,SPI,Power supply ICs, Batteries, VRM Regulators,etc)
*SERIAL(5):
*VIRT(7): Virtualization _drivers_ disabled for Xen/VMWare/Virtualbox, except for Virtio(Qemu)
    kernel is not designed to be ideal for a VM, I run it on bare metal, but I like to test in a VM.
*TPM(9): TPMs other than AMD disabled.
*PCI(9):
*PSTORE(6):
