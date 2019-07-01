#
# File: bdlib.mk
#
# Contents: This is the library make file.
#
#

# Include the rules.

include $(mk)/rules.mk

include $(mk)/srcpat.mk

LIB_PATH = $(patsubst %, $(TARG)/lib%.a, $(targ))
INST_EXP_PATH = $(patsubst %, $(inc)/%, $(exports))
INST_XDREXP_PATH = $(patsubst %, $(inc)/%, $(xdr_exports))
INST_LIB_PATH = $(patsubst %, $(lib)/lib%.a, $(targ))

.PHONY : prepare install all

all: $(LIB_PATH)

$(LIB_PATH): $(LIB_OBJ_PATH)
	@echo "Build lib $@ from $?"
	@$(AR) $(ARFLAGS) $@ $?
	@$(RANLIB) $@

install: $(INST_LIB_PATH) prepare

prepare: $(INST_EXP_PATH) $(INST_XDREXP_PATH)

$(INST_LIB_PATH): $(lib)/lib%.a: $(TARG)/lib%.a
	@echo Installing: $< to $@
	@-$(RM) $@
	@$(CP) $< $@
	@$(CHMOD) 444 $@

$(INST_EXP_PATH): $(inc)/%: %
	@echo Installing: $< to $@
	@-$(RM) $@
	@$(CP) $< $@
	@$(CHMOD) 444 $@

$(INST_XDREXP_PATH): $(inc)/%: $(OBJ)/%
	@echo Installing: $< to $@
	@-$(RM) $@
	@$(CP) $< $@
	@$(CHMOD) 444 $@

include $(DEP_PATH)

