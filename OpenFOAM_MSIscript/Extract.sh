#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=2gb
#SBATCH -t 01:00:00

tar -xvf openfoam-OpenFOAM-v2012.tar.gz