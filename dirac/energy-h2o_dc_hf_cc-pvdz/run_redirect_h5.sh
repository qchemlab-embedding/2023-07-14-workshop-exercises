#!/bin/bash -l
#SBATCH -J dirac_test
#SBATCH -N 1
#SBATCH --ntasks-per-node=8
#SBATCH --mem-per-cpu=5GB
#SBATCH --time=01:00:00 
#SBATCH -A plgqctda2-cpu
#SBATCH -p plgrid-testing
#SBATCH --output="output.out"
#SBATCH --error="error.err"

inp=dc_hf_cc-pvdz.inp
mol=h2o.xyz
scratch=$SCRATCH/dirac_tests/workshops/workshop_14july2023
mkdir -p $scratch

export data_dir=$PLG_GROUPS_STORAGE/plggqcembed/dirac_tests/workshops_data/workshop_14july2023
mkdir -p $data_dir

cd $SLURM_SUBMIT_DIR

srun /bin/hostname

module purge
module load dirac/23.0-intel-2021b
pam-dirac --scratch=$scratch --noarch --noh5 --get="CHECKPOINT.h5=$data_dir/CHECKPOINT.h5" --mw=900 --aw=1900 --mpi=$SLURM_NPROCS --inp=$inp --mol=$mol


