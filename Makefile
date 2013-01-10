
ALL_TDLS += \
F17-x86_64-gold \
F17-x86_64-cfntools \
F17-i386-gold \
F17-i386-cfntools \
F16-i386-gold \
F16-i386-cfntools \
F16-x86_64-gold \
F16-x86_64-cfntools \
F16-x86_64-cfntools-openshift \
U10-x86_64-cfntools

all: heat-jeos

ALL_QCOW2 := $(patsubst %,%.qcow2,$(ALL_TDLS))
heat-jeos: $(ALL_QCOW2)
$(ALL_QCOW2):
	heat-jeos -y create $(subst .qcow2,,$@)

CLEAN_QCOW2 := $(patsubst %,clean-%,$(ALL_TDLS))
clean: $(CLEAN_QCOW2)
$(CLEAN_QCOW2):
	rm $(subst clean-,,$@).qcow2 || true