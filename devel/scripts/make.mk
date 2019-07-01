#
# File: make.mk
#
# Contents: The make.mk target is used to provide multiple make files
#           within a single component. 
#
# Designer: John Hartley.
#

include $(mk)/rules.mk

MAKE_ALL = $(patsubst %, %.all, $(make_list))
MAKE_INSTALL = $(patsubst %, %.install, $(make_list))
MAKE_UNINSTALL = $(patsubst %, %.uninstall, $(make_list))
MAKE_CLEAN = $(patsubst %, %.clean, $(make_list))
MAKE_PREPARE = $(patsubst %, %.prepare, $(make_list))

.PHONY: $(make_list) $(MAKE_ALL) $(MAKE_INSTALL) $(MAKE_UNINSTALL) \
	$(MAKE_CLEAN) $(MAKE_PREPARE)

all : $(MAKE_ALL)

clean: $(MAKE_CLEAN)

install: $(MAKE_INSTALL)

uninstall: $(MAKE_UNINSTALL)

prepare: $(MAKE_PREPARE)

$(MAKE_ALL):
	$(MAKE) -f $(basename $@ .all)

$(MAKE_CLEAN):
	$(MAKE) -f $(basename $@ .clean) clean

$(MAKE_INSTALL):
	$(MAKE) -f $(basename $@ .install) install

$(MAKE_UNINSTALL):
	$(MAKE) -f $(basename $@ .uninstall) uninstall

$(MAKE_PREPARE):
	$(MAKE) -f $(basename $@ .prepare) prepare

# $(make_install_list):
# $(make_clean_list):
# $(make_all_list):


