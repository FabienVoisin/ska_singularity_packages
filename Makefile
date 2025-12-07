#This is the makefile equivalent of the setupscript.sh

#Default value
MPI ?= pawsey
MPIVERSION ?=4.1.8
ifeq ($(MPI),pawsey)
	include makefile.pawsey
else 
	include makefile.generic
endif

