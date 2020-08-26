#! /bin/bash
#SBATCH -o cleaning_slurm.%j.out
#SBATCH -e cleaning_slurm.%j.err
#SBATCH --cpus-per-task 8

module load fastp

srun --cpus-per-task 8 fastp --in1 FASTQ/SRR10390685_1.fastq.gz --in2 FASTQ/SRR10390685_2.fastq.gz -l 100 --out1 CLEANING/SRR10390685_1.cleaned.fastq.gz --out2 CLEANING/SRR10390685_2.cleaned.fastq.gz --unpaired1 CLEANING/SRR10390685_singletons.fastq.gz --unpaired2 CLEANING/SRR10390685_singletons.fastq.gz -w 1 -h fastp.html -t 8
