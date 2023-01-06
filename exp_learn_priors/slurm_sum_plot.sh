#!/bin/bash

#SBATCH --account=ctb-banire
#SBATCH --mail-user=amine.m.remita@gmail.com
#SBATCH --job-name=01_exp_sum_plot
##SBATCH --job-name=02_2exp_sum_plot
#SBATCH --cpus-per-task=24
#SBATCH --mem=230000M
#SBATCH --time=04:00:00
#SBATCH --error=../results/exp_learn_priors/exp_jobs/tmp/%j.err
#SBATCH --output=../results/exp_learn_priors/exp_jobs/tmp/%j.out

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

# MFG, data grid, exponentionally simulated branch lengths
nntreevb_sum_plot_exps.py -c 01_mfg_exp_data_jc69.ini -j 01_mfg_exp_data_jc69_1 

# MFG, data grid, 2exp for extern & intern branch lenths
#nntreevb_sum_plot_exps.py -c 02_mfg_2exp_blens_jc69.ini -j 02_mfg_2exp_blens_jc69_1

