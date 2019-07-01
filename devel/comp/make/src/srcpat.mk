#
# File: srcpat.mk
#
# Contents: This file contains the expansions for the standard source files
#

OBJ_PATH = $(patsubst %, $(OBJ)/%.o, $(srcs))
TRAD_OBJ_PATH = $(patsubst %, $(OBJ)/%.ot, $(trad_srcs))
LEX_OBJ_PATH = $(patsubst %, $(OBJ)/%.ox, $(lex_srcs))
LEX_SRC_PATH = $(patsubst %, $(OBJ)/%.cx, $(lex_srcs))
YACC_SRC_PATH = $(patsubst %, $(OBJ)/%.tab.c, $(yacc_srcs))
YACC_H_PATH = $(patsubst %, $(OBJ)/%.tab.h, $(yacc_srcs))
YACC_OBJ_PATH = $(patsubst %, $(OBJ)/%.tab.o, $(yacc_srcs))
XDR_SRC_PATH = $(patsubst %, $(OBJ)/%_xdr.c, $(xdr_srcs))
XDR_H_PATH = $(patsubst %, $(OBJ)/%.h, $(xdr_srcs))
XDR_OBJ_PATH = $(patsubst %, $(OBJ)/%_xdr.o, $(xdr_srcs))
ESQL_SRC_PATH = $(patsubst %, $(OBJ)/%.ipp, $(esql_srcs))
ESQL_OBJ_PATH = $(patsubst %, $(OBJ)/%.oi, $(esql_srcs))
DEP_PATH = $(patsubst %, $(DEP)/%.d, $(srcs)) \
	$(patsubst %, $(DEP)/%.d, $(trad_srcs)) \
	$(patsubst %, $(DEP)/%.dx, $(lex_srcs)) \
	$(patsubst %, $(DEP)/%.tab.d, $(yacc_srcs)) \
	$(patsubst %, $(DEP)/%_xdr.d, $(xdr_srcs)) \
	$(patsubst %, $(DEP)/%.di, $(esql_srcs))


