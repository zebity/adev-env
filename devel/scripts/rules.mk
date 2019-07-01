#
# File: rules.mk
#
# Contents: This file defines the various rules required to make the targets
#

include $(mk)/proj_tools.mk

#
# Rules to generate dependencies
#
$(DEP)/%.d: %.cpp
	@echo "Generating dependency for: $<"
	@$(CXX) $(CXXDEPFLAGS) $< |  \
	sed 's|\($(*F)\)\.o[ :]*|$(OBJ)\/\1.o $(DEP)\/\1.d: |g' > $@

$(DEP)/%.d: %.cc
	@echo "Generating dependency for: $<"
	@$(CXX) $(CXXDEPFLAGS) $< |  \
	sed 's|\($(*F)\)\.o[ :]*|$(OBJ)\/\1.o $(DEP)\/\1.d: |g' > $@

$(DEP)/%.d: %.c
	@echo "Generating dependency for: $<"
	@$(CC) $(CCDEPFLAGS) $< |  \
	sed 's|\($(*F)\)\.o[ :]*|$(OBJ)\/\1.o $(DEP)\/\1.d: |g' > $@

$(DEP)/%.dx: $(OBJ)/%.cx
	@echo "Generating dependency for: $<"
	@$(CC) $(CCDEPFLAGS) $< |  \
	sed 's|\($(*F)\)\.cx\.o[ :]*|$(OBJ)\/\1.ox $(DEP)\/\1.dx: |g' > $@

$(DEP)/%.tab.d: $(OBJ)/%.tab.c
	@echo "Generating dependency for: $<"
	@$(CC) $(CCDEPFLAGS) $< |  \
	sed 's|\($(*F)\)\.tab\.o[ :]*|$(OBJ)\/\1.tab.o $(DEP)\/\1.tab.d: |g' > $@

$(DEP)/%_xdr.d: $(OBJ)/%_xdr.c
	@echo "Generating dependency for: $<"
	$(CC) $(CCDEPFLAGS) $< |  \
	sed 's|\($(*F)\)_xdr\.o[ :]*|$(OBJ)\/\1_xdr.o $(DEP)\/\1_xdr.d: |g' > $@

$(DEP)/%.di: $(OBJ)/%.ipp
	@echo "Generating dependency for: $<"
	@$(CXX) $(CXXDEPFLAGS) $< |  \
	sed 's|\($(*F)\)\.ipp\.o[ :]*|$(OBJ)\/\1.oi $(DEP)\/\1.di: |g' > $@

#
# Rule to run the C++ compiler
#
$(OBJ)/%.o: %.cc
	@echo "Compile: $<"
	@echo " $(CXXFLAGS)"
	@$(CXX) $(CXXFLAGS) -c $< -o $@ 

$(OBJ)/%.o: %.cpp
	@echo "Compile: $<"
	@echo " $(CXXFLAGS)"
	@$(CXX) $(CXXFLAGS) -c $< -o $@ 

$(OBJ)/%.oi : $(OBJ)/%.ipp
	@echo "Compile: $<"
	@echo " $(CXXFLAGS)"
	@$(CXX) $(CXXFLAGS) -c $< -o $@ 

#
# Rule to run the C compiler
#
$(OBJ)/%.o : %.c
	@echo "Compile: $<"
	@echo " $(CCFLAGS)"
	@$(CC) $(CCFLAGS) -c $< -o $@ 

$(OBJ)/%.ot : %.c
	@echo "Compile: $<"
	@echo " -traditional $(filter-out -ansi, $(CCFLAGS))"
	@$(CC) -traditional $(filter-out -ansi, $(CCFLAGS)) -c $< -o $@

$(OBJ)/%.ox : $(OBJ)/%.cx
	@echo "Compile: $<"
	@echo " $(CCFLAGS)"
	@$(CC) $(CCFLAGS) -c $< -o $@

$(OBJ)/%.tab.o : $(OBJ)/%.tab.c
	@echo "Compile: $<"
	@echo " $(CCFLAGS)"
	@$(CC) $(CCFLAGS) -c $< -o $@

$(OBJ)/%_xdr.o : $(OBJ)/%_xdr.c
	@echo "Compile: $<"
	@echo " -traditional $(filter-out -ansi, $(CCFLAGS))"
	@$(CC) -traditional $(filter-out -ansi, $(CCFLAGS)) -c $< -o $@

#
# Rule to run yacc
#
$(OBJ)/%.tab.c $(OBJ)/%.tab.h: %.y
	@echo "Generating Parser/Header $(OBJ)/$(*F).tab.[ch] from $<"
	@$(YACC) $(YACCFLAGS) -b $(*F) $<
	@sed 's|y\.tab\.h|$(*F).tab.h|g' $(*F).tab.c > $(OBJ)/$(*F).tab.c
	@rm $(*F).tab.c
	@mv $(*F).tab.h $(OBJ)/$(*F).tab.h

#
# Rule to run lex
#
$(OBJ)/%.cx: %.l
	@echo "Generating Lexer $@ from $<" 
	@$(LEX) $(LEXFLAGS) -t $< > $@

#
# Rule to run the rpc compiler
#
$(OBJ)/%_xdr.c $(OBJ)/%.h: %.x
	$(RPCGEN) -c $< > $(OBJ)/$(*F)_xdr.c
	$(RPCGEN) -h $< > $(OBJ)/$(*F).h

#
# Rule to run ingres SQL compiler
#
$(OBJ)/%.ipp : %.sc
	$(ESQLC) -o -f$(OBJ)/$(*F).ipp $<


