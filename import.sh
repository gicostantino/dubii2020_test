#!/bin/bash
#SBATCH -o import_slurm.%j.out  #stdout
#SBATCH -e import_slurm.%j.err  #stderr
#SBATCH --cpus-per-task 8

#création espace de travail
mkdir GFF
mkdir REF
mkdir FASTQ
mkdir QC
mkdir CLEANING
mkdir MAPPING

#import des données
cd GFF
srun wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/009/045/GCF_000009045.1_ASM904v1/GCF_000009045.1_ASM904v1_genomic.gff.gz
srun gunzip GCF_000009045.1_ASM904v1_genomic.gff.gz
cd ../REF
srun wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/009/045/GCF_000009045.1_ASM904v1/GCF_000009045.1_ASM904v1_genomic.fna.gz
srun gunzip GCF_000009045.1_ASM904v1_genomic.fna.gz
cd ../FASTQ
module load sra-tools
srun --cpus-per-task 8 fasterq-dump -S -p SRR10390685 --outdir . --threads 8
pigz -p8 SRR10390685_1.fastq
pigz -p8 SRR10390685_2.fastq
