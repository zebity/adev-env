#
# File: Makefile
#
# Contents: This is the MDE bootscrap make file.  We have to first put
#           in the scripts.mk makefile before we can do any thing else.
#
# Programmer: John Hartley
#

exports = bdexe.mk bdlib.mk clexe.mk cllib.mk env_inc.mk env_lib.mk \
	env_tools.mk exe.mk \
	header.mk lib.mk make.mk man.mk proj_opts.mk proj_tools.mk \
	rules.mk scripts.mk srcpat.mk shlib.mk  template.mk

srcs = 

targ = make-all

CHMODFLAGS = 444

ifeq ($(strip $(NOT_BOOTSTRAP)),)
#
# Assume Bookstrap make
#
export NOT_BOOTSTRAP = yes

all clean install uninstall:
	$(MAKE) $@

bootstrap: $(mk)/scripts.mk

$(mk)/scripts.mk: scripts.mk
	-rm -f $@
	cp $< $@
	chmod $(CHMODFLAGS) $@

else
#
# Normal Make
#

include $(mk)/scripts.mk

endif
