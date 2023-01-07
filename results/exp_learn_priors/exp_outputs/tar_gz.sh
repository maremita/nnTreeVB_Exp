#!/bin/bash

#SBATCH --account=ctb-banire
#SBATCH --mail-user=amine.m.remita@gmail.com
#SBATCH --job-name=targz
#SBATCH --cpus-per-task=24
#SBATCH --mem=32000M
#SBATCH --time=05:00:00
#SBATCH --error=../exp_jobs/tmp/%j.err
#SBATCH --output=../exp_jobs/tmp/%j.out

tar -zcf 01_mfg_exp_data_jc69_1.tar.gz 01_mfg_exp_data_jc69_1/
tar -zcf 02_mfg_2exp_blens_jc69_1.tar.gz 02_mfg_2exp_blens_jc69_1/
tar -zcf 03_mfg_gtr_rates_dhky_l1k_t32_1.tar.gz 03_mfg_gtr_rates_dhky_l1k_t32_1/
tar -zcf 04_mfg_gtr_freqs_dhky_l1k_t32_1.tar.gz 04_mfg_gtr_freqs_dhky_l1k_t32_1/
