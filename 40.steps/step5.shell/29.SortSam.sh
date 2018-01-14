#!/bin/bash
set -o pipefail
java -Dsamjdk.compression_level=5 -Xms4000m -jar /its1/GB_BT2/jianzuoyi/biosoft/gatk-4.0.0.0/picard.jar \
  SortSam \
  INPUT=/its1/GB_BT2/jianzuoyi/projects/Chicken/20.processing_for_gatk/BAMs/29/29.aligned.unsorted.duplicates_marked.bam \
  OUTPUT=/dev/stdout \
  SORT_ORDER="coordinate" \
  CREATE_INDEX=false \
  CREATE_MD5_FILE=false \
| \
java -Dsamjdk.compression_level=5 -Xms500m -jar /its1/GB_BT2/jianzuoyi/biosoft/gatk-4.0.0.0/picard.jar \
  SetNmAndUqTags \
  INPUT=/dev/stdin \
  OUTPUT=/its1/GB_BT2/jianzuoyi/projects/Chicken/20.processing_for_gatk/BAMs/29/29.aligned.duplicate_marked.sorted.bam \
  CREATE_INDEX=true \
  CREATE_MD5_FILE=true \
  REFERENCE_SEQUENCE=/its1/GB_BT2/jianzuoyi/projects/Chicken/00.data/Ref/Gallus_gallus.Gallus_gallus-5.0.dna.toplevel.fa
