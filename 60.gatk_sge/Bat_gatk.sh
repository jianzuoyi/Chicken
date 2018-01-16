while read bam
do
    dir=$(dirname $bam)
    sm=$(basename $bam .bam)
    bai=${dir}/${sm}.bai
    shdir=samples/${sm}
    mkdir -p $shdir
    cp Template_GATK_SGE/application.conf $shdir
    cp Template_GATK_SGE/run_gatk4.sh $shdir
    cp Template_GATK_SGE/haplotypecaller-gvcf-gatk4.wgs.inputs.json $shdir
    cp Template_GATK_SGE/makefile $shdir
    sed -i "s|BAM_XXXXXX|$bam|" ${shdir}/haplotypecaller-gvcf-gatk4.wgs.inputs.json
    sed -i "s|BAI_XXXXXX|$bai|" ${shdir}/haplotypecaller-gvcf-gatk4.wgs.inputs.json
done < input_bam.fofn
