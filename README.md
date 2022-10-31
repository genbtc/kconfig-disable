# kconfig-disable
Kconfig symbols we can disable, entire sections for large chain reactions

# Description:
Started from default config-5.19.17-gentoo-dist (sys-kernel/gentoo-kernel .config),  
These are what is removed from my config.  
The basis for the config is to disable entire sections!  
And primarily remove excess device drivers.  
The dist-kernel has tons of stuff built as a module, which is great for compatibility but terrible for compilation time.  
This config pares the modules down from over 4000 to under 700.  
This reduced overall compile time from 20 minutes to 3 minutes.  
So, I got a little carried away. This repo must be combined with a stock config by manual effort, not used in its entirety, or alone.  
The system is AMD Ryzen based so all Intel tech is disabled.  
see below for more specific information  
  
please note these are aggressive settings and more documentation will follow, but this works for me.  
@genr8eofl 10-30-22 CC-BY-SA-4.0 w/attribution)  
  
# Folders Explanation: 
## how to use this repository:
Each folder contains files named after a number and the name is the kconfig symbol name.  
The number is irrelevant (which line in my master list it came from). The name is important.  
The contents are .diff's from applying the 1 config item to the stock dist-kernel-config orig (in isolation).  
Once you settle on files to apply, collect all the disables you want, and paste them into the bottom of your .config.  
Then run 'make oldconfig' and it will say "warning: override: reassigning to symbol XXXXX" and take effect in a good way.  

# Folders List:
## Name(number of files): Descriptions
* _largest(66): Media Support disabled (video capture)
* _sub100bytes(441): individual items that were disabled or modularized.
            NLS languages disabled except for barebones ascii/english
* MISC or DRIVERS(20): Misc devices drivers disabled
                       Platform and SoC drivers for hardware we don't have, disabled.
                       Technology found in laptops or tablets, disabled.
                       Especially obvious wrong brand names, disabled.
* NET_VENDOR(46): The network card section is disabled except for my two drivers, IGB/BE2NET.
* NET-dontneed(26):   WLAN/WWAN/Bluetooth all disabled.
* NET-transports(9): Anything with a radio pretty much disabled.
* IPV6(14): The IPV6 is turned into a module, as much as possible disabled,
      Meant to decrease surface area with ipv6.disable=1 bootparam
      Still leaves enough enabled to not break Mullvad VPN.
* DRM(6): The DRM video section has all drivers disabled, (choose).
* FS(14): Filesystems more than half removed, kept ones I want.
* INPUT(2): INPUT mostly disabled (Ps2 keyboard/mouse and USB HID only)
* BLKDEV(8): PATA/SATA also minimalized to generics, just enough to boot AMD and Qemu.
* NVME(!): NVME needed for boot, prefer =y, nvme over tcp disable
* SCSI(48): SCSI is mostly disabled, except for the generic subsystem.
* SND(98): SND mostly disabled, (choose)
* USB(11): USB HID mostly disabled except for generic drivers. Full USB still works. Keep USB_UAS (UASP)
* HID(10): USB special device drivers disabled
* I2C(34): I2C disabled (caveat)
* MFD(5): Multifunction Devices (printers and Intel ICH/SCH)
* RTC(6): Embedded devices disabled (IPMI,RTC,EEPROM,GPIO,SPI,Power supply ICs, Batteries, VRM Regulators,etc)
* SERIAL(5): Serial Ports 8250, antiquated.
* VIRT(7): Virtualization _drivers_ disabled for Xen/VMWare/Virtualbox, except for Virtio(Qemu)
        Mykernel is not designed to be ideal for a VM, I run it on bare metal, but I like to test in a VM, so Qemu works.
* TPM(9): TPMs other than AMD, disabled.
* PCI(9): PCI Controllers for wrong hardware, disabled
* PSTORE(6): Persistent store (function helps save crash dumps)

### (# number of bytes): File Folder (contains everything inside)
#### ordered from largest to smallest
137389 _largest.txt
34541 ./AFTER_kconfig-disables.txt
32563 _sub100bytes.txt
23860 SND.txt
7666 NET_VENDOR.txt
5030 SCSI.txt
4140 NET-dontneed.txt
3101 I2C.txt
2532 FS.txt
1803 USB.txt
1561 IPV6.txt
1527 MFD.txt
1498 NET-transports.txt
1291 HID.txt
1165 BLKDEV.txt
1056 VIRT.txt
912 PSTORE.txt
878 PCI.txt
867 RTC.txt
841 DRM.txt
799 SERIAL.txt
620 TPM.txt
382 INPUT.txt


