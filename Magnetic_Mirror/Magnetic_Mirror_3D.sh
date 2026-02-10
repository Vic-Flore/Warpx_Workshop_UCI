#!/bin/bash

# Compiler environment
source ~/.bashrc

# Compilers
export CC=$(which clang)
export CXX=$(which clang++)
export FC=$(which gfortran)

# CUDA host compiler (if relevant)
export CUDAHOSTCXX=${CXX}

# Homebrew paths
export PATH="/opt/homebrew/bin:$PATH"
export LD_LIBRARY_PATH="/opt/homebrew/lib:$LD_LIBRARY_PATH"
export LIBRARY_PATH="/opt/homebrew/lib:$LIBRARY_PATH"
export CPATH="/opt/homebrew/include:$CPATH"

# ---- OpenMP (macOS-safe) ----
unset OMP_PROC_BIND
unset OMP_PLACES
export OMP_NUM_THREADS=$(sysctl -n hw.physicalcpu)

# Executable & inputs
EXE=/Users/victorflores/warpx_env/WarpX/build/bin/warpx.3d
INPUTS=/Users/victorflores/warpx_env/WarpX/Single_Particle_Motion/Magnetic_Mirror/inputs_3d

# Run (single MPI rank)
mpirun -np 1 ${EXE} ${INPUTS} > output.txt
