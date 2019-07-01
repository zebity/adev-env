#
# Project : MDE
#
# Description :
#
# This file is to be included whenever the target is to be a library
#

# Include the rules.
include $(makefiles)/rules.i

# Pattern substitutions to reflect the name and location of the components.
targ_pathname = $(targ:%=lib%.so)
obj_pathname = $(srcs:%=$(OBJS)/$(PROJECT_OS_TYPE)/%.o)
dependancy_pathname = $(srcs:%=$(DEPS)/$(PROJECT_OS_TYPE)/%.d)

$(targ_pathname) : $(obj_pathname)
	@echo Creating shared library...
	@$(CC) -shared $(obj_pathname) -o $(targ_pathname)
	@mv -f $(targ_pathname) $(TARG)/$(PROJECT_OS_TYPE)

.PHONY : install clean
install : $(targ_pathname)
	@echo Installing library $(targ_pathname)... 
	@-cp $(TARG)/$(PROJECT_OS_TYPE)/$(targ_pathname) $(lib)
	@-cp $(exports) $(i)

clean :
	@echo Cleaning up the component...
	@rm -f $(targ_pathname) $(obj_pathname) $(dependancy_pathname)

# Include dependancies
include $(dependancy_pathname)

