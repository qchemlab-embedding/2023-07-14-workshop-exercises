#!/bin/bash -l
#SBATCH -J pyadf_test
#SBATCH -N 1
#SBATCH --ntasks-per-node=8
#SBATCH --mem-per-cpu=5GB
#SBATCH --time=01:00:00 
#SBATCH -A plgqctda2-cpu
#SBATCH -p plgrid-testing
#SBATCH --output="output.out"
#SBATCH --error="error.err"

scratch=$SCRATCH/pyadf/workshops/workshop_14july2023/water_dimer
mkdir -p $scratch

export data_dir=$PLG_GROUPS_STORAGE/plggqcembed/pyadf/workshops/workshop_14july2023/water_dimer
mkdir -p $data_dir

srun /bin/hostname

module purge
module use /net/pr2/projects/plgrid/plggqcembed/groupmodules
module load pyadf-master

cd $SLURM_SUBMIT_DIR
geom=coordinates
project=water_dimer
config=`pwd`/jobrunner.conf
pyadf --jobrunnerconf $config $project.pyadf

