include $(FEAPPVHOME5_1)/makefile.in

OBJECTS =  $(FEAPPVHOME5_1)/main/feappv.o

vfeap: $(OBJECTS) $(ARFEAPPV) $(ARVFEAPPV)
	ranlib $(ARVFEAPPV)
	$(FF) -Wl,-no_pie -o vfeappv $(OBJECTS) \
	$(ARVFEAPPV) $(ARFEAPPV) $(LDOPTIONS)
	dsymutil vfeappv

# UBUNTU and other GCC loader type machines (unchecked)
# Replace $(ARVFEAPPV) \ by:
#    -L$(FEAPPVHOME5_1)/vem \
#    -Wl,-whole-archive -lfeappvvem_g -Wl,-no-whole-archive \

clean:
	rm -f *.o
	rm -f *genmod.mod
	rm -f *genmod.f90

fclean:
	rm -f vfeappv
	rm -r -f vfeap*.dSYM
	@@echo "--> VEM Feappv cleaned <--"

%.o: %.f
	$(FF) -c $(FFOPTFLAG) -I$(FINCLUDE) $< -o $@

%.o: %.f90
	$(FF) -c $(FFOPTFLAG) -I$(FINCLUDE) $< -o $@

%.o: %.c
	$(CC) -c $(CCOPTFLAG) -I$(CINCLUDE) $< -o $@
