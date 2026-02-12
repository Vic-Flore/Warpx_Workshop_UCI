#!/bin/bash

# Compiler environment hits
source ~/.bashrc

# Set C, C++, and Fortran compilers to Homebrew versions (AppleClang)
export CC=$(which clang)
export CXX=$(which clang++)
export FC=$(which gfortran)

# Set CUDA Host Compiler (if using CUDA)
export CUDAHOSTCXX=${CXX}

# Add Homebrew and MPI paths (if not already in your PATH)
export PATH="/opt/homebrew/bin:$PATH"
export LD_LIBRARY_PATH="/opt/homebrew/lib:$LD_LIBRARY_PATH"
export LIBRARY_PATH="/opt/homebrew/lib:$LIBRARY_PATH"
export CPATH="/opt/homebrew/include:$CPATH"

# Ensure OpenMP is properly recognized
export OMP_NUM_THREADS=$(sysctl -n hw.ncpu)
export OMP_PROC_BIND=spread
export OMP_PLACES=cores


# executable & inputs file or python interpreter & PICMI script here
EXE=/Users/victorflores/warpx_env/WarpX/build/bin/warpx.2d
INPUTS=/Users/victorflores/warpx_env/WarpX/Wake_Field_2D/inputs_2d

# run
mpirun -np 1 ${EXE} ${INPUTS} > output.txt
