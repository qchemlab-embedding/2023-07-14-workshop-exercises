#!/bin/bash -l
#SBATCH -J adf_test
#SBATCH -N 1
#SBATCH --ntasks-per-node=8
#SBATCH --mem-per-cpu=5GB
#SBATCH --time=01:00:00 
#SBATCH -A plgqctda2-cpu
#SBATCH -p plgrid-testing
#SBATCH --output="output.out"
#SBATCH --error="error.err"

scratch=$SCRATCH/adf_tests/simple
mkdir -p $scratch

cd $SLURM_SUBMIT_DIR

srun /bin/hostname

module purge
module load adf/2023.101

project=h2o_zora_b3lyp_dzp
$AMSBIN/ams < $project.adf > $project.out



