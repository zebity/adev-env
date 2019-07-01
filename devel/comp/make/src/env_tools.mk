#
# File: env_tools.mk
#
# Contents: Defines the project tools envionment (ie flags etc).
#

# Flags for the dependancy file generation mechanism
CXXDEPFLAGS = -MM -xc++ -E $(CCDEFINE) $(CCINC)
CCDEPFLAGS = -MM -xc -E $(CCDEFINE) $(CCINC)

ifeq ($(strip $(filter-out "FALSE false NO no", $(DEBUG))),)

CXXFLAGS = -xc++ -Wall -ansi -g -O -fpic -fno-implicit-templates \
	$(CPPRTTI) $(CPPEX) $(CCDEFINE) $(CCINC) 
CCFLAGS = -xc -ansi -g -O $(CCDEFINE) $(CCINC)

else

CXXFLAGS = -xc++ -Wall -ansi -O2 -fpic -fno-implicit-templates \
	$(CPPRTTI) $(CPPEX) $(CCDEFINE) $(CCINC) 
CCFLAGS = -xc -ansi -O2 $(CCDEFINE) $(CCINC)

endif

ARFLAGS = ru
CPFLAGS = -f
YACCFLAGS = -d

