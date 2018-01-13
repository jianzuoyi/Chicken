#!/bin/bash
set -o pipefail
java -Dsamjdk.compression_level=5 -Xms4000m -jar /its1/GB_BT2/jianzuoyi/biosoft/gatk-4.0.0.0/picard.jar \
  SortSam \
  INPUT=INPUT_BAM \
  OUTPUT=/dev/stdout \
  SORT_ORDER="coordinate" \
  CREATE_INDEX=false \
  CREATE_MD5_FILE=false \
| \
java -Dsamjdk.compression_level=5 -Xms500m -jar /its1/GB_BT2/jianzuoyi/biosoft/gatk-4.0.0.0/picard.jar \
  SetNmAndUqTags \
  INPUT=/dev/stdin \
  OUTPUT=OUTPUT_BAM \
  CREATE_INDEX=true \
  CREATE_MD5_FILE=true \
  REFERENCE_SEQUENCE=/its1/GB_BT2/jianzuoyi/projects/Chicken/00.data/Ref/Gallus_gallus.Gallus_gallus-5.0.dna.toplevel.fa
