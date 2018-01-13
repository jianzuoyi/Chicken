#!/bin/bash
#set -vex
OUTDIR=/its1/GB_BT2/jianzuoyi/projects/Chicken/20.processing_for_gatk/merge_data

while read dir
do
    sm=$(echo $dir | awk -F '/' '{print $10}')
    echo $sm
    out_dir=${OUTDIR}/${sm}
    read1=${sm}_1.fq.gz
    read2=${sm}_2.fq.gz
    echo "mkdir $out_dir;cd $dir;ls *_1.fq.gz | xargs zcat | gzip -c > ${out_dir}/$read1;ls *_2.fq.gz | xargs zcat | gzip -c > ${out_dir}/$read2"
done < all.dir.fofn
