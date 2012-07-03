#!/bin/bash
clear

echo "FastQ Paired/Single End Sequence Analyzer"
echo "Made by Vinay Hiremath, Licensed under GPL"
echo

echo -n "Enter path of first FastQ file: "
read -e FASTQ1
echo -n "Enter path of second FastQ file: "
read -e FASTQ2
echo

echo -n "Enter path of desired paired read 1 file: "
read -e P_R1
echo -n "Enter path of desired UNpaired read 1 file: "
read -e U_R1
echo -n "Enter path of desired paired read 2 file: "
read -e P_R2
echo -n "Enter path of desired UNpaired read 2 file: "
read -e U_R2
echo -n "Enter path of desired trim log: "
read -e TRIM_LOG
echo -n "Enter number of threads to be used: "
read -e THREADS

PS3='Pick a quality scale: '
phred_options=("phred33" "phred64")
select PHRED_CHOICE in "${phred_options[@]}"
do
    case $PHRED_CHOICE in
    	"phred33")
			PHRED=phred33
			break
			;;
		"phred64")
			PHRED=phred64
			break
			;;
	esac
done

PS3='Pick a step: '
select TRIM_CHOICE in ILLUMINACLIP SLIDINGWINDOW LEADING TRAILING CROP HEADCROP MINLENGTH TOPHRED33 TOPHRED64 SKIP/CONTINUE
do
	case "$TRIM_CHOICE" in
		"ILLUMINACLIP")
			echo "Starting"
			echo -n "If desired, enter manual flags to be used: "
			read -e TRIM_FLAGS
			java -classpath trimmomatic.jar org.usadellab.trimmomatic.TrimmomaticPE $TRIM_FLAGS -threads $THREADS $PHRED -trimlog $TRIM_LOG $FASTQ1 $FASTQ2 $P_R1 $U_R1 $P_R2 $U_R2 ILLUMINACLIP
			;;
		"SLIDINGWINDOW")
			echo -n "Specify window size (number of bases to average across): "
			read -e SLIDINGWINDOW_WINDOW
			echo -n "Specify required quality: "
			read -e SLIDINGWINDOW_QUALITY
			echo -n "If desired, enter manual flags to be used: "
			read -e TRIM_FLAGS
			echo "Starting..."
			java -classpath trimmomatic.jar org.usadellab.trimmomatic.TrimmomaticPE $TRIM_FLAGS -threads $THREADS -$PHRED -trimlog $TRIM_LOG $FASTQ1 $FASTQ2 $P_R1 $U_R1 $P_R2 $U_R2 SLIDINGWINDOW:$SLIDINGWINDOW_WINDOW:$SLIDINGWINDOW_QUALITY
			;;
		"LEADING")
			echo -n "Specify min quality: "
			read -e LEADING_VALUE
			echo -n "If desired, enter manual flags to be used: "
			read -e TRIM_FLAGS
			echo "Starting..."
			java -classpath trimmomatic.jar org.usadellab.trimmomatic.TrimmomaticPE $TRIM_FLAGS -threads $THREADS -$PHRED -trimlog $TRIM_LOG $FASTQ1 $FASTQ2 $P_R1 $U_R1 $P_R2 $U_R2 LEADING:$LEADING_VALUE
			;;
		"TRAILING")
			echo -n "Specify min quality"
			read -e TRAILING_VALUE
			echo -n "If desired, enter manual flags to be used: "
			read -e TRIM_FLAGS
			echo "Starting"
			java -classpath trimmomatic.jar org.usadellab.trimmomatic.TrimmomaticPE $TRIM_FLAGS -threads $THREADS -$PHRED -trimlog $TRIM_LOG $FASTQ1 $FASTQ2 $P_R1 $U_R1 $P_R2 $U_R2 TRAILING:$TRAILING_VALUE
			;;
		"CROP")
			echo -n "Specify number of bases to keep (from start of read): "
			read -e CROP_VALUE
			echo -n "If desired, enter manual flags to be used: "
			read -e TRIM_FLAGS
			echo "Starting..."
			java -classpath trimmomatic.jar org.usadellab.trimmomatic.TrimmomaticPE $TRIM_FLAGS -threads $THREADS -$PHRED -trimlog $TRIM_LOG $FASTQ1 $FASTQ2 $P_R1 $U_R1 $P_R2 $U_R2 CROP:$CROP_VALUE
			;;
		"HEADCROP")
			echo -n "Specify number of bases to remove (from start of read): "
			read -e HEADCROP_VALUE
			echo -n "If desired, enter manual flags to be used: "
			read -e TRIM_FLAGS
			echo "Starting..."
			java -classpath trimmomatic.jar org.usadellab.trimmomatic.TrimmomaticPE $TRIM_FLAGS -threads $THREADS -$PHRED -trimlog $TRIM_LOG $FASTQ1 $FASTQ2 $P_R1 $U_R1 $P_R2 $U_R2 HEADCROP:$HEADCROP_VALUE
			;;
		"MINLENGTH")
			echo -n "Specify min length of reads to be kept: "
			read -e MINLENGTH_VALUE
			echo -n "If desired, enter manual flags to be used: "
			read -e TRIM_FLAGS
			echo "Starting..."
			java -classpath trimmomatic.jar org.usadellab.trimmomatic.TrimmomaticPE $TRIM_FLAGS -threads $THREADS -$PHRED -trimlog $TRIM_LOG $FASTQ1 $FASTQ2 $P_R1 $U_R1 $P_R2 $U_R2 MINLENGTH:$MINLENGTH_VALUE
			;;
		"TOPHRED33")
			echo "Starting..."
			echo -n "If desired, enter manual flags to be used: "
			read -e TRIM_FLAGS
			java -classpath trimmomatic.jar org.usadellab.trimmomatic.TrimmomaticPE $TRIM_FLAGS -threads $THREADS -$PHRED -trimlog $TRIM_LOG $FASTQ1 $FASTQ2 $P_R1 $U_R1 $P_R2 $U_R2 TOPHRED33
			;;
		"TOPHRED64")
			echo "Starting..."
			echo -n "If desired, enter manual flags to be used: "
			read -e TRIM_FLAGS
			java -classpath trimmomatic.jar org.usadellab.trimmomatic.TrimmomaticPE $TRIM_FLAGS -threads $THREADS -$PHRED -trimlog $TRIM_LOG $FASTQ1 $FASTQ2 $P_R1 $U_R1 $P_R2 $U_R2 TOPHRED64
			;;
		"SKIP/CONTINUE")
			echo "Continuing..."
			break
			;;
	esac
done

echo "Visual report will now be generated..."
PS3='Pick a tool: '
phred_options=("tophat, bowtie" "prinseq-lite, prinseq-graphs")
select VISUAL_CHOICE in "${visual_options[@]}"
do
	case $VISUAL_CHOICE in
		"tophat, bowtie")
			echo -n "Enter path to tophat"
			read -e TOPHAT_PATH
			echo -n "Enter path to the directory containing bowtie(2), bowtie(2)-align, bowtie(2)-inspect, and bowtie(2)-build: "
			read -e BOWTIE_DIR
			export $PATH=$BOWTIE_DIR
































			echo -n "Enter path to reference FastA for bowtie(2)-build: "
			read -e "REF_PATH"
			echo -n "If desired, enter manual flags to be used: "
			read -e TOPHAT_FLAGS
			$BOWTIE_DIR/bowtie2-build $REF_PATHs
			$TOPHAT_PATH $TOPHAT_FLAGS $FASTQ1 $FASTQ2
            samtools build tophat_out/accepted_hits.bam
			break
			;;
		"prinseq-lite, prinseq-graphs")
			PHRED=phred64
			break
			;;
	esac
done