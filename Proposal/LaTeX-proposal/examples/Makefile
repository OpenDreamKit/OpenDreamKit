MAKEDIRS 	= eu dfg

# targets for repository maintenance
all clean distclean: 
	@for d in $(MAKEDIRS); do (cd $$d && $(MAKE) -$(MAKEFLAGS) $@) done
