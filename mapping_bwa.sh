#!/bin/bash
#SBATCH -o mapping_bwa.%j.out  #stdout
#SBATCH -e mapping_bwa.%j.err  #stderr
#SBATCH --cpus-per-task 4

#modules
module load bwa
module load samtools

#indexation
srun bwa index REF/GCF_000009045.1_ASM904v1_genomic.fna

#bwa
srun --cpus-per-task=4 bwa mem REF/GCF_000009045.1_ASM904v1_genomic.fna CLEANING/SRR10390685_1.cleaned.fastq.gz CLEANING/SRR10390685_2.cleaned.fastq.gz -t 3 | samtools view -hbS - > MAPPING/SRR10390685.bam
