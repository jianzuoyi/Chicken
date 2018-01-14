java -Dconfig.file=application.conf -Dbackend.shared-filesystem.localization.1=copy -jar $cromwell run \
-i processing-for-variant-discovery-gatk4.chicken.wgs.inputs.json \
-m metadata.txt \
/its1/GB_BT2/jianzuoyi/pipeline/DNASeq/GATK4/gatk4-data-processing/processing-for-variant-discovery-gatk4.wdl
