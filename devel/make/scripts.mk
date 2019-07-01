#
# File: scripts.mk 
#
# Contents: Development Environment make file for installing new scripts,
#           and make files.
#

CP = cp
CHMOD = chmod

EXP_TARG = $(patsubst %, $(sr)/%, $(exports))
INST_TARG = $(patsubst %, $(sr)/%, $(targ))

.PHONY : all install uninstall clean prepare

#
# Assume as this is a "script that we want to set the execute bit.
#
ifeq ($(strip $(CHMODFLAGS)),)
CHMODFLAGS = 555
endif

all: install

prepare: ;

install: $(INST_TARG) $(EXP_TARG)

$(EXP_TARG): $(sr)/%: %
	@echo "Installing $< to $@"
	@-$(RM) $@
	@$(CP) $< $@
	@$(CHMOD) $(CHMODFLAGS) $@

$(INST_TARG): $(sr)/%: %
	@echo "Installing $< to $@"
	@-$(RM) $@
	@$(CP) $< $@
	@$(CHMOD) 555 $@

clean: uninstall

uninstall:
	@echo "Cleaning"
	@-$(RM) $(INST_TARG) $(EXP_TARG)

