bam=$1
base=$(basename $bam .bam)
samtools view -F 4 $bam -b > $base.mapped.bam

samtools view $base.mapped.bam  | cut -f1 | cut -f5 -d '_'|cut -d ':' -f2|cut -f1 -d '-' > $base.readId.txt
samtools view $base.mapped.bam |cut -f4 > $base.mapCoord.txt
correct=$(paste $base.readId.txt $base.mapCoord.txt  | awk '{print $2-$1}'| sort -n | uniq -c | grep -w '0'|awk '{sum+=$1} END{ print sum}')
incorrect=$(paste $base.readId.txt $base.mapCoord.txt  | awk '{print $2-$1}'| sort -n | uniq -c | grep -vw '0'|awk '{sum+=$1} END{ print sum}')

echo $correct $incorrect

