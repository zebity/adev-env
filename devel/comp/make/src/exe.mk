#
# File: exe.mk
#
# Contents: This file contains the makefile to build executables.
#

include $(mk)/rules.mk

ifeq ($(strip $(CHMODFLAGS)),)
CHMODFLAGS = 555
endif

TARG_PATH = $(patsubst %, $(TARG)/%, $(targ))
INST_PATH = $(patsubst %, $(bin)/%, $(targ))

ifeq ($(strip $(EXE_OBJ_PATH)),)
EXE_OBJ_PATH = $(YACC_OBJ_PATH) $(LEX_OBJ_PATH) $(OBJ_PATH) $(TRAD_OBJ_PATH)
endif

.PHONY : prepare install clean uninstall

ifeq ($(strip $(INCLUDE_DEPENDENCY)),)
#
# Stop the dependency generation on clean
#
export INCLUDE_DEPENDENCY = yes

ifneq ($(strip $(THIS)),)
FILE_ARGS = -f $(THIS)
endif

all install:
	$(MAKE) $(FILE_ARGS) $@

prepare: ;

include $(mk)/clexe.mk

else

include $(mk)/bdexe.mk

include $(DEP_PATH)

endif
