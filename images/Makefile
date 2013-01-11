
ALL_TDLS += \
F17-x86_64-gold \
F17-x86_64-cfntools \
F17-i386-gold \
F17-i386-cfntools \
F16-i386-gold \
F16-i386-cfntools \
F16-x86_64-gold \
F16-x86_64-cfntools \
U10-x86_64-cfntools

IMAGE_REPO_USER=stevebake
IMAGE_REPO_REMOTE=$(IMAGE_REPO_USER)@fedorapeople.org:/srv/groups/heat/prebuilt-jeos-images

IMAGES_DIR=/var/lib/libvirt/images

include local.mk

all: check-dir heat-jeos image-repo-push

check-dir:
	@if [ "$(CURDIR)" != "$(IMAGES_DIR)" ]; \
	then \
		echo "This Makefile must be invoked from $(IMAGES_DIR) not $(CURDIR)"; \
		false; \
	fi

ALL_QCOW2 := $(patsubst %,%.qcow2,$(ALL_TDLS))
heat-jeos: $(ALL_QCOW2)
$(ALL_QCOW2):
	heat-jeos -dy create $(subst .qcow2,,$@)

CLEAN_QCOW2 := $(patsubst %,clean-%,$(ALL_TDLS))
clean: $(CLEAN_QCOW2) check-dir
$(CLEAN_QCOW2):
	rm $(subst clean-,,$@).qcow2 || true

image-repo-push: check-dir
	rsync -avtx *.qcow2 $(IMAGE_REPO_REMOTE)