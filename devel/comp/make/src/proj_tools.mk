#
# File: proj_tools.mk
#
# Contents: This file defines the various project tools to be used
#

include $(mk)/proj_opts.mk 

ENV_DIR := $(wildcard ./env_lib.mk)
ifeq ($(strip $(ENV_DIR)),)
    include $(mk)/env_lib.mk
else
    include ./env_lib.mk
endif

ENV_DIR := $(wildcard ./env_inc.mk)
ifeq ($(strip $(ENV_DIR)),)
    include $(mk)/env_inc.mk
else
    include ./env_inc.mk
endif

ENV_DIR := $(wildcard ./env_tools.mk)
ifeq ($(strip $(ENV_DIR)),)
    include $(mk)/env_tools.mk
else
    include ./env_tools.mk
endif

AR = ar
CC = gcc
CP = cp
CHMOD = chmod
CXX = gcc
ESQLC = esqlc
PURIFY = purify
RANLIB = ranlib
RPCGEN = rpcgen

ifeq ($(DO_PURE),yes)
CXXLINK = $(PURIFY) $(CXX)
CCLINK = $(PURIFY) $(CC)
else
CXXLINK = $(CXX)
CCLINKER = $(CC)
endif

