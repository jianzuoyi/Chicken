OUTDIR=Sample.SGE2
while read read1
do
    dir=$(dirname $read1)
    sm=$(basename $read1 _1.fq.gz)
    read2=${dir}/${sm}_2.fq.gz
    SAMPLE_DIR=${OUTDIR}/${sm}
    mkdir -p $SAMPLE_DIR
    sh=${SAMPLE_DIR}/call_snp.sh
    cp Template_call_snp.sh $sh
    sed -i "s|SAMPLE_NAME_XXXXXX|${sm}|" $sh
    sed -i "s|READ1_XXXXXX|${read1}|" $sh
    sed -i "s|READ2_XXXXXX|${read2}|" $sh
done < input_read1.fofn
