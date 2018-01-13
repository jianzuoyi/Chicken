#!/bin/bash

OUTDIR=/its1/GB_BT2/jianzuoyi/projects/Chicken/20.processing_for_gatk/BAMs

find /its1/GB_BT2/jianzuoyi/projects/Chicken/20.processing_for_gatk/merge_data -type d | tail -n +2 > all.merge.dir.fofn
#find /its1/GB_BT2/jianzuoyi/projects/Chicken/00.data/F17KTSCCWLJ0666_GALbwiR/Clean/ -type d | tail -n +2 > all.merge.dir.fofn

while read dir
do
    sm=$(echo $dir | awk -F '/' '{print $9}')
    out_dir=${OUTDIR}/${sm}
    mkdir -p $out_dir
    read1=$(find $dir -type f -name '*_1.fq.gz')
    read2=$(find $dir -type f -name '*_2.fq.gz')
    echo $read1 $read2 $sm $out_dir | awk '{print "picard FastqToSam FASTQ="$1" FASTQ2="$2" OUTPUT="$4"/"$3".unmapped.bam READ_GROUP_NAME="$3" SAMPLE_NAME="$3" LIBRARY_NAME=Lib"$3" PLATFORM_UNIT=HiSeq PLATFORM=Illumina SEQUENCING_CENTER=BGI && touch "$4"/"$3".done"}'
#awk '{print "picard FastqToSam FASTQ="$1" FASTQ2="$2" OUT="$1".unmapped.bam"}'
done < all.merge.dir.fofn
