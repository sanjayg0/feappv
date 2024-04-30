include $(FEAPPVHOME5_1)/makefile.in

OBJECTS = $(FEAPPVHOME5_1)/main/feappv.o \
	ale_elas.o \
	elmlib.o \
	flcn2d.o \
	flu2d1.o \
	flu2d2.o \
	flu2d3.o \
	flu3d1.o \
	flu3d3.o \
	flu3d9.o \
	fluid2d.o \
	fluid3d.o \
	incom.o \
	incom2d.o \
	influid.o \
	modlfl.o \
	newtonian.o \
	pelnum.o \
	pstab2d.o \
	pstab3d.o \
	stream_2d.o \
	strnr2d.o \
	strnr3d.o

#feap: $(OBJECTS) $(SOURCES) $(FINCLUDE) $(ARFEAPPV)
feappv: $(OBJECTS) $(SOURCES) $(ARFEAPPV)
	ranlib $(ARFEAPPV)
	$(FF) -o feappv $(OBJECTS) $(ARFEAPPV) $(LDOPTIONS)
	dsymutil feappv

.f.o:
	$(FF) -c $(FFOPTFLAG) -I$(FINCLUDE) $*.f -o $*.o
#(%.o):%.f
	#@if $(FF) -c $(FFOPTFLAG) -I$(FINCLUDE) $< -o $*.o; then echo $*.o >> $(FL); else false; fi;
#	@echo "Building $*.o"

(%.o): %.f90
	@if $(FF) -c -I$(FINCLUDE) $(FFOPTFLAG) $< -o $*.o; then echo $*.o >> $(FL); else false; fi;
	@echo "Building $*.o"

(%.o): %.c
	@if $(CC) -c -I$(FINCLUDE) -I$(CINCLUDE) $(CCOPTFLAG) $< -o $*.o; then echo $*.o >> $(FL); else false; fi;
	@echo "Building $*.o"

clean:
	rm -f *.o
	rm -f *genmod.f90
	rm -f *genmod.mod

fclean:
	rm -f feappv
	rm -r -f feappv*.dSYM

