# N.B.  It is necessary to modify 'makefile.in' before using make.

include $(FEAPPVHOME4_1)/makefile.in

CLEANDIRS = elements program user main plot unix

feappv: archive
	(cd main; make feappv)
	@@echo "--> FEAPpv executable made <--"

archive:   
	(cd program; make archive)
	(cd elements; make archive)
	(cd plot; make archive)
	(cd unix; make archive)
	(cd user; make archive)
	@@echo "--> FEAPpv Archive updated <--"

install: archive feappv

clean:
	for i in $(CLEANDIRS); do (cd $$i; make clean); done
	if [ -f $(ARFEAPPV) ]; then rm $(ARFEAPPV); fi
	@@echo "--> FEAPpv cleaned <--"

