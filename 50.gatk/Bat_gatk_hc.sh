gatk=/its1/GB_BT2/jianzuoyi/biosoft/gatk-4.0.0.0/gatk-launch
ref=/its1/GB_BT2/jianzuoyi/projects/Chicken/00.data/Ref/Gallus_gallus.Gallus_gallus-5.0.dna.toplevel.fa
intervals=/its1/GB_BT2/jianzuoyi/projects/Chicken/00.data/Ref/Gallus_gallus.Gallus_gallus-5.0.dna.toplevel.intervals
outdir=/its1/GB_BT2/jianzuoyi/projects/Chicken/50.gatk/Sample2
mkdir -p $outdir
while read bam
do
    dir=$(dirname $bam)
    sm=$(basename $bam .bam)
    echo "$gatk --java-options -Xms8000m \
  HaplotypeCaller \
  -R $ref \
  -I ${dir}/${sm}.bam \
  -O ${outdir}/${sm}.g.vcf.gz \
  -L $intervals \
  -ip 100 \
  -contamination 0 \
  --max-alternate-alleles 3 \
  -ERC GVCF"
done < input_bam.fofn
