#!/bin/bash
/its1/GB_BT2/jianzuoyi/biosoft/gatk-4.0.0.0/gatk-launch --java-options -Xms8000m \
  HaplotypeCaller \
  -R /its1/GB_BT2/jianzuoyi/projects/Chicken/00.data/Ref/Gallus_gallus.Gallus_gallus-5.0.dna.toplevel.fa \
  -I /its1/GB_BT2/jianzuoyi/projects/Chicken/80.speedseq/Sample/10/10.bam \
  -O /its1/GB_BT2/jianzuoyi/projects/Chicken/50.gatk/sample10/sample10.g.vcf.gz \
  -contamination 0 \
  --max-alternate-alleles 3 \
  -ERC GVCF
