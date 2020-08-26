#! /bin/bash
#SBATCH --array=0-1
#SBATCH -o qualite_fastq.%j.out
#SBATCH -e qualite_fastq.%j.err

module load fastqc

output_dir="QC"
FASTQ_FILES=(FASTQ/*.fastq.gz)

srun fastqc --quiet ${FASTQ_FILES[$SLURM_ARRAY_TASK_ID]} -o ${output_dir}
