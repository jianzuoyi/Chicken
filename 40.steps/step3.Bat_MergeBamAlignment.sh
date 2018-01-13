shdir=step3.shell
rm -rf $shdir
mkdir $shdir
while read bam
do
    dir=$(dirname $bam)
    sm=$(basename $bam .unmapped.bam)
    echo $sm
    unmerged_bam=${dir}/${sm}.unmapped.bam.unmerged.bam
    output=${dir}/${sm}.unmapped.aligned.unsorted.bam
    echo $unmerged_bam
    echo $output
    sh=${shdir}/MergeBamAlignment.${sm}.sh
    echo $sh
    cp Template/MergeBamAlignment.sh $sh
    sed -i "s|UNMAPPED_UNMERGED_BAM|$unmerged_bam|" $sh
    sed -i "s|RAW_UNMAPPED_BAM|$bam|" $sh
    sed -i "s|OUTPUT_BAM|$output|" $sh
done < input_bam.fofn
