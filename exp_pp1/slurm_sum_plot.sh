#!/bin/bash

#SBATCH --account=ctb-banire
#SBATCH --mail-user=amine.m.remita@gmail.com
#SBATCH --job-name=07_mff_sum_plot
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

# Gaussian mean-field
#nntreevb_sum_plot_exps.py -c 01_data.ini -j 01_data_1

# Flexible mean-field
#nntreevb_sum_plot_exps.py -c 02_data.ini -j 02_data

# Gaussian MF, JC69 data, JC69 var model,  NN based encoder for branches
#nntreevb_sum_plot_exps.py -c 03_mfg_nn_jc69_l1k_t32.ini -j 03_mfg_nn_jc69_l1k_t32_4

# Flexible MF (gamma), JC69 data, JC69 var model,  NN based encoder for branches
#nntreevb_sum_plot_exps.py -c 04_mff_nn_jc69_l1k_t32.ini -j 04_mff_nn_jc69_l1k_t32_4

# 
#nntreevb_sum_plot_exps.py -c 05_mfg_jc69_l1k_t32_nn_hp.ini -j 05_mfg_jc69_l1k_t32_nn_hp

# Gamma distribution based branch length simulation
#nntreevb_sum_plot_exps.py -c 06_mfg_data_jc69_l1k_t32.ini -j 06_mfg_data_jc69_l1k_t32_2

#nntreevb_sum_plot_exps.py -c 06_mff_data_jc69_l1k_t32.ini -j 06_mff_data_jc69_l1k_t32_2

# Exponentionally simulated branch lengths
#nntreevb_sum_plot_exps.py -c 07_mfg_exp_data_jc69_l1k_t32.ini -j 07_mfg_exp_data_jc69_l1k_t32_1

nntreevb_sum_plot_exps.py -c 07_mff_exp_data_jc69_l1k_t32.ini -j 07_mff_exp_data_jc69_l1k_t32_1
