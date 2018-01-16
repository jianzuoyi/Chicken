java -Dconfig.file=application.conf -Dbackend.shared-filesystem.localization.1=soft-link -jar $cromwell run \
-i haplotypecaller-gvcf-gatk4.wgs.inputs.json \
-m metadata.txt \
/its1/GB_BT2/jianzuoyi/pipeline/DNASeq/GATK4/gatk4-germline-snps-indels/haplotypecaller-gvcf-gatk4.wdl
