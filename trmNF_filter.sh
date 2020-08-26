#!/bin/bash
#SBATCH -o trmNF_filter.%j.out  #stdout
#SBATCH -e trmNF_filter.%j.err  #stderr

module load bedtools
module load samtools

#filtre des genes trmNF
srun grep trmNF GFF/GCF_000009045.1_ASM904v1_genomic.gff | awk '$3=="gene"' > GFF/trmNF.gff3

#bedtools intersect
srun samtools index MAPPING/SRR10390685_sorted.bam
srun bedtools intersect -a MAPPING/SRR10390685_sorted.bam -b GFF/trmNF.gff3 -f 0.5 > MAPPING/SRR10390685_on_trmNF.bam
srun samtools view -c MAPPING/SRR10390685_on_trmNF.bam
