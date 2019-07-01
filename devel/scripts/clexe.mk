#
# File: clexe.mk
#
# Contents: This file contains the makefile to clean executables.
#

include $(mk)/srcpat.mk

clean:
	@echo "Cleaning"
	@-$(RM) $(TARG_PATH) $(DEP_PATH) $(OBJ_PATH) $(TRAD_OBJ_PATH) \
	$(LEX_OBJ_PATH) $(LEX_SRC_PATH) $(YACC_OBJ_PATH) $(YACC_SRC_PATH) \
	$(YACC_H_PATH)

uninstall:
	@echo "Uninstalling $(INST_PATH)"
	@-$(RM) $(INST_PATH)

