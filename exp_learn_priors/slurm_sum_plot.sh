#!/bin/bash

#SBATCH --account=ctb-banire
#SBATCH --mail-user=amine.m.remita@gmail.com

##SBATCH --job-name=01_exp_sum_plot
##SBATCH --job-name=02_2exp_sum_plot
##SBATCH --job-name=03_rates_sum_plot
##SBATCH --job-name=04_freqs_sum_plot
#SBATCH --job-name=05_fit_sum_plot

#SBATCH --cpus-per-task=24

##SBATCH --mem=32000M
##SBATCH --mem=64000M
#SBATCH --mem=240000M
##SBATCH --mem=450000M

#SBATCH --time=01:00:00

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
# 64G/1 hour
#nntreevb_sum_plot_exps.py -c 01_mfg_exp_data_jc69.ini -j 01_mfg_exp_data_jc69_1

# MFG, data grid, 2exp for extern & intern branch lenths
# 32G/1 hour
#nntreevb_sum_plot_exps.py -c 02_mfg_2exp_blens_jc69.ini -j 02_mfg_2exp_blens_jc69_2

# MFG, data grid, different kappa values for rate estimation
# 64G/1 hour
#nntreevb_sum_plot_exps.py -c 03_mfg_gtr_rates_dhky.ini -j 03_mfg_gtr_rates_dhky_1
#nntreevb_sum_plot_exps.py -c 03_mfg_gtr_rates_dhky.ini -j 03_mfg_gtr_rates_dhky_all_lpd
#nntreevb_sum_plot_exps.py -c 03_mfg_gtr_rates_dhky_l1k_t16.ini -j 03_mfg_gtr_rates_dhky_l1k_t16

# MFG, data grid, different frequencies values for estimation
# 64G/1 hour
#nntreevb_sum_plot_exps.py -c 04_mfg_gtr_freqs_dhky.ini -j 04_mfg_gtr_freqs_dhky_1
#nntreevb_sum_plot_exps.py -c 04_mfg_gtr_freqs_dhky.ini -j 04_mfg_gtr_freqs_dhky_all_lpd
##nntreevb_sum_plot_exps.py -c 04_mfg_gtr_freqs_dhky_l1k_t16.ini -j 04_mfg_gtr_freqs_dhky_l1k_t16

# MFG, JC69 data, exponentionally simulated branch lengths, keep fit iteration results
# 80G/1 hour
#nntreevb_sum_plot_exps.py -c 05_mfg_exp_jc69_keep_fit.ini -j 05_mfg_exp_jc69_keep_fit_1
# 240G/1h
nntreevb_sum_plot_exps.py -c 05_mfg_exp_jc69_keep_fit.ini -j 05_mfg_exp_jc69_keep_fit_l1k_t64
##nntreevb_sum_plot_exps.py -c 05_mfg_exp_jc69_keep_fit_l1k_t16.ini -j 05_mfg_exp_jc69_keep_fit_l1k_t16

