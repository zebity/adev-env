#
# File: Makefile
#
# Contents: Make the utilities for the development envionment
#
#

DEV_ENV_SHELL = /usr/local/bin/dev-env
DEV_ENV_CFG   = /usr/local/etc/dev-env.cfg
DEV_ENV_SH    = ../../../env/proj-cshrc
# DEV_ENV_SHELL = ~/bin/dev-env
# DEV_ENV_CFG   = ~/etc/dev-env.cfg

exports = dev-env.dir dev-env.env dev-env.mak new-proj \
	proj-cshrc upd-proj

srcs = 

targ = 

ifeq ($(strip $(NOT_BOOTSTRAP)),)
#
# Ensure the the development environment bootstraps ok.
#
export NOT_BOOTSTRAP = yes

all:
	$(MAKE) all

install:
	$(MAKE) install

clean:
	$(MAKE) clean

uninstall: unbootstrap
	$(MAKE) uninstall

unbootstrap:
	-rm $(DEV_ENV_SHELL)
	-rm $(DEV_ENV_CFG)
	-rm $(DEV_ENV_SH)

bootstrap: $(DEV_ENV_SHELL) $(DEV_ENV_CFG) $(DEV_ENV_SH)

$(DEV_ENV_SHELL): dev-env
	cp  $< $@
	chmod a-w $@

$(DEV_ENV_CFG): dev-env.cfg
	cp  $< $@
	chmod a-w $@

$(DEV_ENV_SH): proj-cshrc
	cp  $< $@
	chmod a-w $@

else
#
# Normal build
#

include $(mk)/scripts.mk

endif
