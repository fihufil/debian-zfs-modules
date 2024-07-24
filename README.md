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

## Limitations

Currently this kernel modules are not signed (hence the suffix -unsigned) so these won't work if you have Secure Boot enabled.
