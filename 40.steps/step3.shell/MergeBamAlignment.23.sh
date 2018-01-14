#!/bin/bash
# set the bash variable needed for the command-line
bash_ref_fasta=/its1/GB_BT2/jianzuoyi/projects/Chicken/00.data/Ref/Gallus_gallus.Gallus_gallus-5.0.dna.toplevel.fa
java -Dsamjdk.compression_level=5 -Xms3000m -jar /its1/GB_BT2/jianzuoyi/biosoft/gatk-4.0.0.0/picard.jar \
  MergeBamAlignment \
  VALIDATION_STRINGENCY=SILENT \
  EXPECTED_ORIENTATIONS=FR \
  ATTRIBUTES_TO_RETAIN=X0 \
  ALIGNED_BAM=/its1/GB_BT2/jianzuoyi/projects/Chicken/20.processing_for_gatk/BAMs/23/23.unmapped.bam.unmerged.bam \
  UNMAPPED_BAM= /its1/GB_BT2/jianzuoyi/projects/Chicken/20.processing_for_gatk/BAMs/23/23.unmapped.bam \
  OUTPUT=/its1/GB_BT2/jianzuoyi/projects/Chicken/20.processing_for_gatk/BAMs/23/23.unmapped.aligned.unsorted.bam \
  REFERENCE_SEQUENCE=$bash_ref_fasta \
  PAIRED_RUN=true \
  SORT_ORDER="unsorted" \
  IS_BISULFITE_SEQUENCE=false \
  ALIGNED_READS_ONLY=false \
  CLIP_ADAPTERS=false \
  MAX_RECORDS_IN_RAM=2000000 \
  ADD_MATE_CIGAR=true \
  MAX_INSERTIONS_OR_DELETIONS=-1 \
  PRIMARY_ALIGNMENT_STRATEGY=MostDistant \
  PROGRAM_RECORD_ID="bwamem" \
  PROGRAM_GROUP_VERSION="0.7.15-r1140" \
  PROGRAM_GROUP_COMMAND_LINE="bwa mem -K 100000000 -v 3 -t 24 -p -Y $bash_ref_fasta" \
  PROGRAM_GROUP_NAME="bwamem" \
  UNMAPPED_READ_STRATEGY=COPY_TO_TAG \
  ALIGNER_PROPER_PAIR_FLAGS=true \
  UNMAP_CONTAMINANT_READS=true
