#
# File: cllib.mk
#
# Contents: This is the library clean make file.
#
#

# Include the rules.

include $(mk)/rules.mk

include $(mk)/srcpat.mk

LIB_PATH = $(patsubst %, $(TARG)/lib%.a, $(targ))
INST_EXP_PATH = $(patsubst %, $(inc)/%, $(exports))
INST_XDREXP_PATH = $(patsubst %, $(inc)/%, $(xdr_exports))
INST_LIB_PATH = $(patsubst %, $(lib)/lib%.a, $(targ))

.PHONY : clean uninstall

clean:
	@echo "Cleaning..."
	@-$(RM) $(LIB_OBJ_PATH) $(DEP_PATH) $(LIB_PATH) $(LEX_SRC_PATH) \
	$(YACC_SRC_PATH) $(YACC_H_PATH) $(XDR_SRC_PATH) $(XDR_H_PATH)

uninstall:
	@echo "Uninstalling..."
	@-$(RM) $(INST_EXP_PATH) $(INST_XDREXP_PATH) $(INST_LIB_PATH)

