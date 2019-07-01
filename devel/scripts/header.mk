#
# File: header.mk 
#
# Contents: This file is to make a set of header files only.
#
#

include $(mk)/rules.mk

.PHONY: all install clean uninstall prepare

ifeq ($(strip $(CHMODFLAGS)),)
CHMODFLAGS = 444
endif

ifneq ($(strip $(targ_subdir)),)
	inc := $(inc)/$(targ_subdir)
	MKDIR_RES := $(shell mkdir $(inc))
endif

EXP_TARG = $(patsubst %, $(inc)/%, $(exports))

all: install

install: prepare

prepare: $(EXP_TARG)

$(EXP_TARG): $(inc)/%: %
	@echo "Installing $< to $@"
	@-$(RM) $@
	@$(CP) $< $@
	@$(CHMOD) $(CHMODFLAGS) $@

clean: ;

uninstall:
	@echo "Uninstalling..." 
	@-$(RM) $(EXP_TARG)

