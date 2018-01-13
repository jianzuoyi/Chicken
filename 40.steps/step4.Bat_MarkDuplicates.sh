#
# one task need 10 cpus and 30G mem
#
while read bam
do
    dir=$(dirname $bam)
    sm=$(basename $bam .unmapped.bam)
  #  echo $sm
    unsorted_bam=${dir}/${sm}.unmapped.aligned.unsorted.bam
   # echo $unsorted_bam
    output=${dir}/${sm}.aligned.unsorted.duplicates_marked.bam
    duplicate_metrics=${dir}/${sm}.duplicate_metrics
   # echo $output
echo "java -Dsamjdk.compression_level=5 -Xms4000m -jar /its1/GB_BT2/jianzuoyi/biosoft/gatk-4.0.0.0/picard.jar \
  MarkDuplicates \
  INPUT=$unsorted_bam \
  OUTPUT=$output \
  METRICS_FILE=$duplicate_metrics \
  VALIDATION_STRINGENCY=SILENT \
  OPTICAL_DUPLICATE_PIXEL_DISTANCE=2500 \
  ASSUME_SORT_ORDER="queryname" \
  CREATE_MD5_FILE=true"
done < input_bam.fofn
