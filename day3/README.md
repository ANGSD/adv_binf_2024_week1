# Computer exercises day 3

The sequencing files you will need to map are single-end NGS data two different pathogens.

## The data is located on emily.popgen.dk at /TEACHING/BIOINF23/adv_binf_2023_week1/day3

NOTE before you start:
You can either copy the files four sequencing files and the reference genome into your own directory or you can specify the full path of the file when you are performing the data analysis.


## PART 1  - Mapping Statistics

There are two fastq.gz files in the directory /TEACHING/BIOINF23/assignment1_mapping.

One is called l10.fastq.gz and contains single end reads of length 10, and one is called l30.fastq.gz and has reads of length 30. You will align both of these files and investigate the effect of read length on the resulting mapped reads. 

Both of these files are reads from the organism <i>Mycobacterium leprae</i>. 

You will also find the reference sequence to map against mleprae.fasta.gz.

Due to the simulation software used, the read ID contains the information of the positions for which the sequence originates. Once aligned, there can potentially be differences between the true chromosomal position and the position it is aligned to, we call this mis-alignment. e.g. @T0_RID0_S0_NZ_CP029543.1:2084294-2084323_length:30_R1 is a read (ID) originating from chromosome NZ_CP029543.1 from position 2084294-2084323

We can use this fact to investigate whether the reads generated are mapping to the correct position by
comparing the position in the read ID to the position in the bam file.

## Questions:

1. How large (in base pairs) is the bacterial reference genome?

2. Use bwa aln (and samse) to align the two fastq files to the bacterial reference (Hint: look at the exercises from https://github.com/ANGSD/adv_binf_2023_week1/tree/main/day2).

3. Sort and index the resulting files using samtools, and make sure they are saved in bam format. 

4. Filter out the unaligned reads and create new bam files that contain only mapped reads. Identify which flag to filter out on (https://broadinstitute.github.io/picard/explain-flags.html)

5. By looking at the reads aligning and the chromosomal positions, we can calculate how many reads are mapped correctly with a 0 nucleotide difference between the origin in the read ID and the mapping coordinate. The script /TEACHING/BIOINF23/adv_binf_2023_week1/day3/get_stats.sh takes a bam file and outputs two numbers - firstly the number of reads that map correctly (i.e. those where the start position in the bam file matches the read ID), and then the number that do not map correctly.

Use this script to find out how many reads map correctly and incorrectly in the two bam files 
~~~bash
/TEACHING/BIOINF23/adv_binf_2023_week1/day3/get_stats.sh l30.bam
or ./get_stats.sh l30.bam
~~~

6. Now create two new bam files where you filter the reads so we only retain reads with a mapping quality of greater than or equal to 1. (Hint: look at the exercises from https://github.com/ANGSD/adv_binf_2023_week1/tree/main/day2).

Repeat the above STEP 5 with the two new filtered bam files. How do the numbers differ?


## PART 2 - Data analysis:
In this part you are given two compressed FASTQ files in the directory /TEACHING/BIOINF23/day3/

One of these files is ancient, and one is modern. They are both reads from the pathogen <i>Pseudomonas aeruginosa</i> (reference genome fasta: paeruginosa.fasta.gz)

~~~bash
jessica.fastq.gz
fletcher.fastq.gz 
~~~

The goal is to ascertain which of the files (Jessica or Fletcher) belongs to the modern or ancient sample. For this exercise, you can look at the computer exercises from day1 and day2 for inspirations (https://github.com/ANGSD/adv_binf_2023_week1/tree/main/day1 and https://github.com/ANGSD/adv_binf_2023_week1/tree/main/day2) 

## Questions:

1. Perform, using fastp, adapter trimming on the provided sample sequence files. Make sure to discard reads under 30 bp (-l parameter).

2. How many reads contained adapters in both datasets? 

3. What is the mean length of the reads before and after trimming?

4. Perform bwa alignment using aln and samse. For each sample, sort the sam file, save it as a bam, and index it. Remember that the reference is NOT the same as the previous exercise. 
   
6. For each sample, create new bam files with only the aligned reads. What proportion of reads remain?
   
8. What is the mean depth of coverage for each sample? (use samtools depth test.bam|datamash mean 3)

9. Use mapDamage to identify the nucleotide misincorporation and fragmentation patterns for each sample 





