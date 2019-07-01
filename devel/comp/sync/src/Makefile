# Project : MDE
#
# Description :
#
# This file is a makefile template.
#

# The files that need to be published along with the target should be named
# here.  
#
# Example the target libDB.a needs to be shipped with db.h and transaction.h .
# That situation would look like this.
#
# exports = db.h transaction.h
#
exports = mocom10_get_script \
          mocom10_put_script \
          overnight_synch_script \
          remote_checkin \
          remote_host_get_script \
          remote_host_put_script


# The sources that are used in the compilation are listed here
# The sources should be named without their extensions.
# example the source fred.cpp would simply look like this :
#
# srcs = fred
#
srcs = 

# The final target that needs to be produced is placed here. Simply place the
# name here without the .a extension for a library etc. The appropriate
# extension is placed on the target. 
#
# Example: for a library named libFred.a, do the following:
#
# targ = Fred
# 
targ = 


# Only one file can be included at once.

# Replace the make.exe command with the appropriate file for the target you
# wish to build.
#
# Possible targets : make.shlib make.lib make.scripts make.headers make.make
#
include $(makefiles)/make.scripts


