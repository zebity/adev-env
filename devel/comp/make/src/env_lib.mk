#
# File: env_lib.mk
#
# Contents: This provides the user with the ability to define their
#           own library paths.
#           We use the following system:
#           Component Path, Project Path, System Path
#           Component lib Component llib, Project lib Project llib,
#           System lib System llib
#           Language llib
#

ifeq ($(strip $(COMP_LPATH)),)
COMP_LPATH = $(lib)
endif

ifeq ($(strip $(PROJ_LPATH)),)
PROJ_LPATH =
endif

ifeq ($(strip $(SYS_LPATH)),)
SYS_LPATH =
endif

ifeq ($(strip $(CXX_LLIB)),)
CXX_LLIB = g++ stdc++ 
endif

ifeq ($(strip $(CC_LLIB)),)
CC_LLIB = c 
endif

ifeq ($(strip $(COMP_LIB)),)
COMP_LIB =
endif

ifeq ($(strip $(PROJ_LIB)),)
PROJ_LIB =
endif

ifeq ($(strip $(SYS_LIB)),)
SYS_LIB =
endif

ifeq ($(strip $(COMP_LLIB)),)
COMP_LLIB =
endif

ifeq ($(strip $(PROJ_LLIB)),)
PROJ_LLIB =
endif

ifeq ($(strip $(SYS_LLIB)),)
SYS_LLIB =
endif

LDLPATHS = $(patsubst %, -L%, $(COMP_LPATH) $(PROJ_LPATH) $(SYS_LPATH))

LDLIBS = $(COMP_LIB) $(patsubst %, -l%, $(COMP_LLIB)) \
	$(PROJ_LIB) $(patsubst %, -l%, $(PROJ_LLIB)) \
	$(SYS_LIB) $(patsubst %, -l%, $(SYS_LLIB))

CXXLIBS = $(patsubst %, -l%, $(CXX_LLIB))

CCLIBS = $(patsubst %, -l%, $(CC_LLIB))
CXXLDFLAGS = $(LDLPATHS) $(LDLIBS) $(CXXLIBS) $(CCLIBS)

CCLDFLAGS = $(LDLPATHS) $(LDLIBS) $(CCLIBS)

