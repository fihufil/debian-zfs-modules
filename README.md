Debian ZFS modules source package
======

This is very simple ZFS modules package for Debian which uses `dkms mktarball --binaries-only` underneath.

# Building

First you have to export the following environment variables:

```
export DKMS_KERNEL_VERSION="6.1.0-23-amd64"
export DKMS_ZFS_VERSION="2.1.11"
```

Then you have to create control file and create a package:
```
make control
```

# Cleanup

To cleanup you can do:

```
make clean
```

# Limitations

Currently this kernel modules are not signed (hence the suffix -unsigned) so these won't work if you have Secure Boot enabled.
