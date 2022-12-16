#!/bin/bash

#SBATCH --account=ctb-banire
#SBATCH --mail-user=amine.m.remita@gmail.com
#SBATCH --job-name=01_data_sum_plot
##SBATCH --job-name=02_mfg_sum_plot
#SBATCH --cpus-per-task=32
#SBATCH --mem=64000M
#SBATCH --time=03:00:00
#SBATCH --error=../exps/exp_jobs/tmp/%j.err
#SBATCH --output=../exps/exp_jobs/tmp/%j.out

module load StdEnv/2020
module load python/3.8
module load scipy-stack
module load imkl/2022.1.0

echo Running $SLURM_JOB_NAME $SLURM_JOB_ID
echo

virtualenv --no-download $SLURM_TMPDIR/env
source $SLURM_TMPDIR/env/bin/activate

pip install --no-index --upgrade pip

# Copy packages
# Update here the paths for pyvolve and nnTreeVB
cp -a /home/mremita/project/mremita/Thesis/Software/pyvolve/. $SLURM_TMPDIR/pyvolve/
cp -a /home/mremita/project/mremita/Thesis/Software/nnTreeVB/. $SLURM_TMPDIR/nnTreeVB/

pip install --no-index $SLURM_TMPDIR/pyvolve/
pip install --no-index $SLURM_TMPDIR/nnTreeVB/

# Gaussian mean-field evaluation
nntreevb_sum_plot_exps.py -c 01_mfg_data_models.ini -j 01_mfg_data_models_1

# Exponentionally simulated branch lengths
#nntreevb_sum_plot_exps.py -c 02_mfg_exp_data_jc69_l1k_t32.ini -j 02_mfg_exp_data_jc69_l1k_t32_1 

