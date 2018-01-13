OUTDIR=BAMs
mkdir -p $OUTDIR


while read bam
do
    sm=$(basename $bam .unmapped.bam)
    echo $sm
    echo $bam > ${OUTDIR}/${sm}_bam.list
done < input_bam.fofn
