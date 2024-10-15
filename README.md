Debian ZFS modules source package
======

As `dkms mkbmdeb` was deprecated upstream I created this very simple ZFS modules package for Debian 12 which uses `dkms mktarball --binaries-only` underneath.

## Building

As this package uses dkms you have to have `dkms-zfs` installed of course:

```
apt install zfs-dkms
```

First you have to export the following environment variables:

```
export DKMS_KERNEL_VERSION="6.1.0-23-amd64"
export DKMS_ZFS_VERSION="2.1.11"
export DKMS_SIGNED=0
```

Then you have to create control file and create a package:
```
make
```

It will produce package like this `zfs-modules-6.1.0-22-amd64-unsigned_6.1.0-22_amd64.deb` with binary zfs modules that you can install on a Debian 12 system without full build dependences, yay!

## Cleanup

To cleanup you can do:

```
make clean
```

## Secure Boot

To make use of Secure Boot and ZFS packages you have to provision MOK (Machine Owner Key) into your machine.

Good resource that covers this topic is on Debian Wiki: https://wiki.debian.org/SecureBoot#MOK_-_Machine_Owner_Key

Then you have to setup DKMS for signing your newly build kernel modules using MOK cert as this package uses DKMS underneath.

Once your DKMS build modules are signed you can enable signed binary packages with:

```
export DKMS_SIGNED=1
```

And repeating `make`
