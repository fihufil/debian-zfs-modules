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

It will produce package like this `zfs-modules-6.1.0-22-amd64-unsigned_6.1.0-22_amd64.deb` (or `zfs-modules-6.1.0-22-amd64_6.1.0-22_amd64.deb` if you have signing setup!) with binary zfs modules that you can install on a Debian 12 system without full build dependences, yay!

## Cleanup

To cleanup you can do:

```
make clean
```

## Secure Boot

To use Secure Boot with ZFS packages, you need to enroll a Machine Owner Key (MOK) into your system.

A helpful resource on this topic can be found on the Debian Wiki: https://wiki.debian.org/SecureBoot#MOK_-_Machine_Owner_Key

Next, you need to set up DKMS to sign your newly built kernel modules using the MOK certificate, as we are using DKMS underneath.

Once your DKMS-built modules are signed, you can proceed to create a binary package of the signed ZFS module by exporting:

```
export DKMS_SIGNED=1
```

And repeating `make`
