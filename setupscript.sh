#!/bin/bash
MPI=$1
MPIVERSION=$2

##Create folder associate with MPI version
if [[ ! -d toolchain_${MPI}_${MPIVERSION} ]]
then
	mkdir toolchain_${MPI}_${MPIVERSION}
fi


sed -e "s|\#\#MPI\#\#|${MPI}|g" -e "s|\#\#MPIVERSION\#\#|${MPIVERSION}|g"  spack-openmpi.template > toolchain_${MPI}_${MPIVERSION}/spack-${MPI}_${MPIVERSION}.singularity

sed -e "s|\#\#MPI\#\#|${MPI}|g" -e "s|\#\#MPIVERSION\#\#|${MPIVERSION}|g"  spack-casacore_3.7.1.template > toolchain_${MPI}_${MPIVERSION}/spack-casacore_3.7.1_${MPI}_${MPIVERSION}.singularity

sed -e "s|\#\#MPI\#\#|${MPI}|g" -e "s|\#\#MPIVERSION\#\#|${MPIVERSION}|g"  spack-wsclean-3.6-casacore-template > toolchain_${MPI}_${MPIVERSION}/spack-wsclean-3.6-casacore_3.7.1_${MPI}_${MPIVERSION}.singularity
if [[ ! -f toolchain_${MPI}_${MPIVERSION}/spack-${MPI}_${MPIVERSION}.sif ]] 
then
	singularity build  toolchain_${MPI}_${MPIVERSION}/spack-${MPI}_${MPIVERSION}.sif toolchain_${MPI}_${MPIVERSION}/spack-${MPI}_${MPIVERSION}.singularity
fi


if [[ ! -f toolchain_${MPI}_${MPIVERSION}/spack-casacore_3.7.1_${MPI}_${MPIVERSION}.sif ]] 
then
	singularity build  toolchain_${MPI}_${MPIVERSION}/spack-casacore_3.7.1_${MPI}_${MPIVERSION}.sif  toolchain_${MPI}_${MPIVERSION}/spack-casacore_3.7.1_${MPI}_${MPIVERSION}.singularity
fi
 
if [[ ! -f toolchain_${MPI}_${MPIVERSION}/spack-wsclean-3.6-casacore_3.7.1-${MPI}_${MPIVERSION}.sif ]] 
then
	singularity build  toolchain_${MPI}_${MPIVERSION}/spack-wsclean-3.6-casacore_3.7.1-${MPI}_${MPIVERSION}.sif   toolchain_${MPI}_${MPIVERSION}/spack-wsclean-3.6-casacore_3.7.1_${MPI}_${MPIVERSION}.singularity
fi
