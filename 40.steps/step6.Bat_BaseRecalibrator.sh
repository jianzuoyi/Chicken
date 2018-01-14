#!/bin/bash

ref=/its1/GB_BT2/jianzuoyi/projects/Chicken/00.data/Ref/Gallus_gallus.Gallus_gallus-5.0.dna.toplevel.fa
vcf=/its1/GB_BT2/jianzuoyi/projects/Chicken/00.data/Ref/ftp.ensembl.org/pub/release-91/variation/gvf/gallus_gallus/gallus_gallus.SNP.vcf.gz

while read bam
do
    dir=$(dirname $bam)
    sm=$(basename $bam .unmapped.bam)
    input_bam=${dir}/${sm}.aligned.duplicate_marked.sorted.bam
    echo "/its1/GB_BT2/jianzuoyi/biosoft/gatk-4.0.0.0/gatk-launch --java-options "-Xms4000m" \
     BaseRecalibrator \
     -R $ref \
     -I $input_bam \
     --use-original-qualities \
     -O ${dir}/${sm}.recal_data.csv \
     -known-sites $vcf"
done < input_bam.fofn
