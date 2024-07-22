#!/usr/bin/make -f

ifeq ($(strip $(DKMS_KERNEL_VERSION)),)
$(error Environment variable DKMS_KERNEL_VERSION is not set)
endif

ifeq ($(strip $(DKMS_ZFS_VERSION)),)
$(error Environment variable DKMS_ZFS_VERSION is not set)
endif

ZFS_VERSION := ${DKMS_ZFS_VERSION}
KVERSION := ${DKMS_KERNEL_VERSION}

all: control package

control:
	sed 's/KERNEL_VERSION/$(KVERSION)/g' debian/control.in > debian/control

package:
	dpkg-buildpackage -us -uc

clean:
	debian/rules clean
	rm debian/control

.PHONY: control clean dpkg-buildpackage
