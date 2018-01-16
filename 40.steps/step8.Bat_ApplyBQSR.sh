while read bam
do
    dir=$(dirname $bam)
    sm=$(basename $bam .unmapped.bam)
    sorted_bam=${dir}/${sm}.aligned.duplicate_marked.sorted.bam
    recalibrated_bam=${dir}/${sm}.aligned.duplicates_marked.recalibrated.bam
    recal_data_csv=${dir}/${sm}.GatherBQSRReports.recal_data.csv
    sh=step8.shell/ApplyBQSR_${sm}.sh
    cp Template/ApplyBQSR.sh $sh
    sed -i "s|SAMPLE.aligned.duplicate_marked.sorted.bam_XXXXXX|$sorted_bam|" $sh
    sed -i "s|SAMPLE.aligned.duplicates_marked.recalibrated.bam_XXXXXX|${recalibrated_bam}|" $sh
    sed -i "s|SAMPLE.recal_data.csv_XXXXXX|$recal_data_csv|" $sh
    #echo $sorted_bam
    #echo $recalibrated_bam
    #echo $recal_data_csv
done < input_bam.fofn
