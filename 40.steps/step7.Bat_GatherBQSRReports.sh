#!/bin/bash

while read bam
do
    dir=$(dirname $bam)
    sm=$(basename $bam .unmapped.bam)
    input=${dir}/${sm}.recal_data.csv
    output=${dir}/${sm}.GatherBQSRReports.recal_data.csv
    echo "/its1/GB_BT2/jianzuoyi/biosoft/gatk-4.0.0.0/gatk-launch --java-options -Xms3000m \
  GatherBQSRReports \
  -I $input -O $output"
done < input_bam.fofn
