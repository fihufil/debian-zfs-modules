#!/usr/bin/make -f

ifeq ($(strip $(DKMS_KERNEL_VERSION)),)
$(error Environment variable DKMS_KERNEL_VERSION is not set)
endif

ifeq ($(strip $(DKMS_ZFS_VERSION)),)
$(error Environment variable DKMS_ZFS_VERSION is not set)
endif

ifeq ($(strip $(DKMS_SIGNED)),)
$(error Environment variable SIGNED is not set)
endif

ZFS_VERSION := ${DKMS_ZFS_VERSION}
KVERSION := ${DKMS_KERNEL_VERSION}

ifeq ($(DKMS_SIGNED),1)
    UNSIGNED =
else
    UNSIGNED = -unsigned
endif

all: control package

control:
	sed -e 's/KERNEL_VERSION/$(KVERSION)/g' -e 's/-UNSIGNED/$(UNSIGNED)/g' debian/control.in > debian/control

package:
	dpkg-buildpackage --build=binary -uc

clean:
	debian/rules clean
	rm debian/control

.PHONY: all control package clean
