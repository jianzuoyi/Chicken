#!/bin/bash

shdir=shell
json=processing-for-variant-discovery-gatk4.chicken.wgs.inputs.json

while read bam_list
do
    sm=$(basename $bam_list _bam.list)
    echo $sm
    echo $bam_list
    outdir=${shdir}/${sm}
    mkdir -p $outdir
    cp makefile $outdir
    cp application.conf $outdir
    cp run_process_data.sh $outdir
    cp $json $outdir
    sed -i "s|SAMPLE_NAME|${sm}|" $outdir/$json
    sed -i "s|BAM_LIST|${bam_list}|" $outdir/$json
done < input_bam.list.list
