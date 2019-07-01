#
# File: env_inc.mk
#
# Contents: Defines the project include paths for the compiler.
#           There are three types of includes that can be defined
#           Component, Project, and System.
#           This allows a degree of flexiblity in modifying the
#           include paths.
#

ifeq ($(strip $(COMP_INC)),)
COMP_INC = .
endif

ifeq ($(strip $(PROJ_INC)),)
PROJ_INC = $(inc)
endif

ifeq ($(strip $(SYS_INC)),)
SYS_INC =
endif

# These are the include paths that are used when compiling

CCINC = $(patsubst %, -I%, $(COMP_INC) $(PROJ_INC) $(SYS_INC))

