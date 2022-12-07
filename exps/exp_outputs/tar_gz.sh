#!/bin/bash

#SBATCH --account=ctb-banire
#SBATCH --mail-user=amine.m.remita@gmail.com
#SBATCH --job-name=targz
#SBATCH --cpus-per-task=24
#SBATCH --mem=32000M
#SBATCH --time=04:00:00
#SBATCH --error=../exp_jobs/tmp/%j.err
#SBATCH --output=../exp_jobs/tmp/%j.out


#tar -zcf 03_mfg_nn_jc69_l1k_t32_4.tar.gz 03_mfg_nn_jc69_l1k_t32_4/
#tar -zcf 04_mff_nn_jc69_l1k_t32_4.tar.gz 04_mff_nn_jc69_l1k_t32_4/

tar -zcf 06_mff_data_jc69_l1k_t32_1.tar.gz 06_mff_data_jc69_l1k_t32_1/
tar -zcf 06_mfg_data_jc69_l1k_t32_1.tar.gz 06_mfg_data_jc69_l1k_t32_1/

