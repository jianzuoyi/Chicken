# Example speedseq commands on a small slice of chromosome 20

OUTDIR=/its1/GB_BT2/jianzuoyi/projects/Chicken/80.speedseq/Sample.SGE
SAMPLE_NAME=F1
SAMPLE_DIR=${OUTDIR}/${SAMPLE_NAME}
mkdir -p $SAMPLE_DIR
OUTBASE=${SAMPLE_DIR}/${SAMPLE_NAME}
# 1. Align with BWA
/its1/GB_BT2/jianzuoyi/biosoft/speedseq/bin/speedseq align \
    -o $OUTBASE \
    -t 10 \
    -R "@RG\tID:${SAMPLE_NAME}\tSM:${SAMPLE_NAME}\tLB:${SAMPLE_NAME}" \
    /its1/GB_BT2/jianzuoyi/projects/Chicken/00.data/Ref/Gallus_gallus.Gallus_gallus-5.0.dna.toplevel.fa \
    /its1/GB_BT2/jianzuoyi/projects/Chicken/20.processing_for_gatk/merge_data/F1/F1_1.fq.gz \
    /its1/GB_BT2/jianzuoyi/projects/Chicken/20.processing_for_gatk/merge_data/F1/F1_2.fq.gz
# Example speedseq commands on a small slice of chromosome 20

# 2. Detect SNVs and indels
/its1/GB_BT2/jianzuoyi/biosoft/speedseq/bin/speedseq var \
    -o $OUTBASE \
    -t 24 \
    /its1/GB_BT2/jianzuoyi/projects/Chicken/00.data/Ref/Gallus_gallus.Gallus_gallus-5.0.dna.toplevel.fa \
    ${OUTBASE}.bam
