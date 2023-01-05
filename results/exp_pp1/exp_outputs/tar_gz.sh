#!/bin/bash

#SBATCH --account=ctb-banire
#SBATCH --mail-user=amine.m.remita@gmail.com
#SBATCH --job-name=targz
#SBATCH --cpus-per-task=24
#SBATCH --mem=32000M
#SBATCH --time=04:00:00
#SBATCH --error=../exp_jobs/tmp/%j.err
#SBATCH --output=../exp_jobs/tmp/%j.out


tar -zcf 01_mfg_data_models_1.tar.gz 01_mfg_data_models_1/
#tar -zcf 02_mfg_exp_data_jc69_l1k_t32_1.tar.gz 02_mfg_exp_data_jc69_l1k_t32_1/
