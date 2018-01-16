#!/bin/bash
  /its1/GB_BT2/jianzuoyi/biosoft/gatk-4.0.0.0/gatk-launch --java-options "-Xms3000m" \
    ApplyBQSR \
    -R /its1/GB_BT2/jianzuoyi/projects/Chicken/00.data/Ref/Gallus_gallus.Gallus_gallus-5.0.dna.toplevel.fa \
    -I SAMPLE.aligned.duplicate_marked.sorted.bam_XXXXXX \
    -O SAMPLE.aligned.duplicates_marked.recalibrated.bam_XXXXXX \
    -bqsr SAMPLE.recal_data.csv_XXXXXX \
    --static-quantized-quals 10 --static-quantized-quals 20 --static-quantized-quals 30 \
    --use-original-qualities \
    --create-output-bam-md5 \
    --add-output-sam-program-record
