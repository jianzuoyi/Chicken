shdir=step5.shell

mkdir $shdir

while read bam
do
    dir=$(dirname $bam)
    sm=$(basename $bam .unmapped.bam)
    echo $dir
    echo $sm
    input_bam=${dir}/${sm}.aligned.unsorted.duplicates_marked.bam
    output_bam=${dir}/${sm}.aligned.duplicate_marked.sorted.bam
    sh=${shdir}/${sm}.SortSam.sh
    cp Template/SortSam.sh $sh
    sed -i "s|INPUT_BAM|$input_bam|" $sh
    sed -i "s|OUTPUT_BAM|$output_bam|" $sh
done < input_bam.fofn
