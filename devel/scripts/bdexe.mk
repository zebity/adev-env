#
# File: bdexe.mk
#
# Contents: This file contains the makefile to build executables.
#

include $(mk)/srcpat.mk

all: $(TARG_PATH)

$(TARG_PATH): $(EXE_OBJ_PATH)
	@echo "Creating executable $@ from $^"
ifeq ($(strip $(CLINK)),)
	@echo " $(CXXLDFLAGS)"
	@$(CXXLINK) $^ $(CXXLDFLAGS) -o $@
else
	@echo " $(CCLDFLAGS)"
	@$(CCLINK) $^ $(CCLDFLAGS) -o $@
endif

install: $(INST_PATH)

$(INST_PATH): $(bin)/% : $(TARG)/% 
	@echo "Installing $< to $@"
	@-$(RM) $@
	@$(CP) $< $@
	@$(CHMOD) $(CHMODFLAGS) $@


