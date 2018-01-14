#!/bin/bash
#set -vex
OUTDIR=/its1/GB_BT2/jianzuoyi/projects/Chicken/20.processing_for_gatk/merge_data

while read dir
do
    sm=$(echo $dir | awk -F '/' '{print $10}')
#    echo $sm
    out_dir=${OUTDIR}/${sm}
    read1=${sm}_1.fq.gz
    read2=${sm}_2.fq.gz
    echo "mkdir -p $out_dir;cd $dir; cat *_1.fq.gz > ${out_dir}/$read1;cat *_2.fq.gz > ${out_dir}/$read2"
done < all.dir.fofn
