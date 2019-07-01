#
# File: lib.mk
#
# Contents: This is the library make file.
#
#

include $(mk)/rules.mk

ifeq ($(strip $(LIB_OBJ_PATH)),)
LIB_OBJ_PATH = $(YACC_OBJ_PATH) $(LEX_OBJ_PATH) $(OBJ_PATH) \
	$(TRAD_OBJ_PATH) $(XDR_OBJ_PATH) $(ESQL_OBJ_PATH)
endif

ifeq ($(strip $(INCLUDE_DEPENDENCY)),)
#
# Stop the generation of dependencies when doing "clean"
export INCLUDE_DEPENDENCY = yes

ifneq ($(strip $(THIS)),)
FILE_ARGS = -f $(THIS)
endif

all install prepare:
	$(MAKE) $(FILE_ARGS) $@

include $(mk)/cllib.mk

else
#
# Normal case
#

include $(mk)/bdlib.mk

endif

