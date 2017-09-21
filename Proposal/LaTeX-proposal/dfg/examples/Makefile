DIRS = proposal report simple-proposal
all clean distclean: 
	@for d in $(DIRS); do (cd $$d && $(MAKE) -$(MAKEFLAGS) $@); done;

