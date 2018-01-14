#!/bin/bash
/its1/GB_BT2/jianzuoyi/biosoft/gatk-4.0.0.0/gatk-launch --java-options -Xms8000m \
  HaplotypeCaller \
  -R /its1/GB_BT2/jianzuoyi/projects/Chicken/00.data/Ref/Gallus_gallus.Gallus_gallus-5.0.dna.toplevel.fa \
  -I /its1/GB_BT2/jianzuoyi/projects/Chicken/20.processing_for_gatk/BAMs/10/10.aligned.duplicate_marked.sorted.bam \
  -O sample10.g.vcf.gz \
  -contamination 0 \
  --max-alternate-alleles 3 \
  -ERC GVCF
