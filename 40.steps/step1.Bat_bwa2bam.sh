#!/bin/bash
set -o pipefail
set -e
# set the bash variable needed for the command-line
bash_ref_fasta=/its1/GB_BT2/jianzuoyi/projects/Chicken/00.data/Ref/Gallus_gallus.Gallus_gallus-5.0.dna.toplevel.fa
threads=24
while read bam
do
    echo "java -Dsamjdk.compression_level=5 -Xms3000m -jar /its1/GB_BT2/jianzuoyi/biosoft/gatk-4.0.0.0/picard.jar \
   SamToFastq \
 	INPUT=$bam \
 	FASTQ=/dev/stdout \
 	INTERLEAVE=true \
 	NON_PF=true \
 | \
/its1/GB_BT2/jianzuoyi/biosoft/gatk-4.0.0.0/bwa mem -K 100000000 -v 3 -t $threads -p -Y $bash_ref_fasta /dev/stdin - \
 | \
samtools view -1 - > ${bam}.unmerged.v2.bam"
done < input_bam.fofn
