# Example speedseq commands on a small slice of chromosome 20

# 1. Align with BWA
/its1/GB_BT2/jianzuoyi/biosoft/speedseq/bin/speedseq align \
    -o sample1 \
    -t 24 \
    -R "@RG\tID:sample1\tSM:sample1\tLB:lib1" \
    /its1/GB_BT2/jianzuoyi/projects/Chicken/00.data/Ref/Gallus_gallus.Gallus_gallus-5.0.dna.toplevel.fa \
    /its1/GB_BT2/jianzuoyi/projects/Chicken/00.data/F17KTSCCWLJ0666_GALbwiR/Clean/1/FCHFMH7CCXY_L6_wHAXPI063255-66_1.fq.gz \
    /its1/GB_BT2/jianzuoyi/projects/Chicken/00.data/F17KTSCCWLJ0666_GALbwiR/Clean/1/FCHFMH7CCXY_L6_wHAXPI063255-66_2.fq.gz
