# Introduction
import os
os.system('clear')
print "FastQ Paired/Single End Sequence Analyzer for Python"
print "Made by Vinay Hiremath"
print "Licensed under GPL"

# Getting values for various initial variables
FASTQ1 = raw_input("Enter path of first FastQ file: ")
FASTQ2 = raw_input("Enter path of second FastQ file: ")
P_R1 = raw_input("Enter path of desired paired read 1 file: ")
U_R1 = raw_input("Enter path of desired UNpaired read 1 file: ")
P_R2 = raw_input("Enter path of desired paired read 2 file: ")
U_R2 = raw_input("Enter path of desired UNpaired read 2 file: ")
TRIM_LOG = raw_input("Enter path of desired trim log: ")
THERADS = raw_input("Enter number of threads to be used: ")

# Menu for quality format
print ""
print "1. Phred33"
print "2. Phred64"
QUAL = raw_input("Format of quality descriptors: ")
if QUAL == 1:
	PHRED = "phred33"
elif QUAL == 2:
	PHRED = "phred64"
else:
	print "Invalid option!"

# Trimmomatic steps
os.system('clear')
print "Starting Trimmomatic steps..."

print ""
print "1. ILLUMINACLIP"
print "2. SLIDINGWINDOW"
print "3. LEADING"
print "4. TRAILING"
print "5. CROP"
print "6. HEADCROP"
print "7. MINLENGTH"
print "8. TOPHRED33"
print "9. TOPHRED64"
print "10. SKIP/CONTINUE"
TRIM = raw_input("Step: ")

TRIM_FLAGS, THREADS, PHRED, TRIM_LOG, FASTQ1, FASTQ2, P_R1, U_R1, P_R2, U_R2 = 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
trimmomatic = 'java -classpath trimmomatic.jar org.usadellab.trimmomatic.TrimmomaticPE %s -threads %s -%s -trimlog %s %s %s %s %s %s %s' % (TRIM_FLAGS, THREADS, PHRED, TRIM_LOG, FASTQ1, FASTQ2, P_R1, U_R1, P_R2, U_R2)

def trim_flags():
	print "Starting..."
	TRIM_FLAGS = raw_input("Enter any optional manual flags: ")

TRIM = 10
for x in xrange(1-100):
	if TRIM == 1:
		trim_flags()
		os.system('%s ILLUMINACLIP') % trimmomatic
		continue
	elif TRIM == 2:
		SLIDINGWINDOW_WINDOW = raw_input("Specify window size (number of bases to average across): ")
		SLIDINGWINDOW_QUALITY = raw_input("Specify required quality: ")
		trim_flags()
		os.system('%s SLIDINGWINDOW:%s:%s') % (trimmomatic, SLIDINGWINDOW_WINDOW, SLIDINGWINDOW_QUALITY)
		continue
	elif TRIM == 3:
		LEADING_QUALITY = raw_input("Specify minimum quality: ")
		trim_flags()
		os.system('%s LEADING:%s') % (trimmomatic, LEADING_QUALITY)
		continue
	elif TRIM == 4:
		TRAILING_QUALITY = raw_input("Specify minimum quality: ")
		trim_flags()
		os.system('%s TRAILING:%s') % (trimmomatic, TRAILING_QUALITY)
		continue
	elif TRIM == 5:
		CROP_VALUE = raw_input("Specify number of bases to keep (from start of read): ")
		trim_flags()
		os.system('%s CROP:%s') % (trimmomatic, CROP_VALUE)
		continue
	elif TRIM == 6:
		HEADCROP_VALUE = raw_input("Specify number of bases to crop (from start of read): ")
		trim_flags()
		os.system('%s HEADCROP:%s') % (trimmomatic, HEADCROP_VALUE)
		continue
	elif TRIM == 7:
		MINLENGTH_VALUE = raw_input("Specify minimum length of reads to keep: ")
		trim_flags()
		os.system('%s MINLENGTH:%s') % (trimmomatic, MINLENGTH_VALUE)
		continue
	elif TRIM == 8:
		trim_flags()
		TRIM_FLAGS = raw_input("Enter any optional manual flags: ")
		os.system('%s TOPHRED33') % (trimmomatic, U_R2)
		continue
	elif TRIM == 9:
		trim_flags()
		TRIM_FLAGS = raw_input("Enter any optional manual flags: ")
		os.system('%s TOPHRED64') % (trimmomatic, U_R2)
		continue
	elif TRIM == 10:
		break
	else:
		print "Invalid option!"

# Assembly or report generation steps


ASSEMBLY_CHOICE = raw_input("Start assembly (y or n)? ")
for x in xrange(1-100):
	if ASSEMBLY_CHOICE == "y":
		print "HOUSE"
		os.system('clear')
		tophat_path = raw_input("Enter path to tophat: ")
		bowtie_dir = raw_input("Enter path of directory containing bowtie2 tools: ")
		genome_path = raw_input("Enter path to reference genome (FastA): ")
		tophat_flags = raw_input("Enter any optional manual flags: ")
		os.system('%s/bowtie2-build %s') % (bowtie_dir, genome_path)
		tophat_flags = raw_input("Enter any optional manual flags for tophat: ")
		os.system('%s %s -p %s %s %s') % (tophat_path, tophat_flags, THREADS, FASTQ1, FASTQ2)
	elif ASSEMBLY_CHOICE == "n":
		break
	else:
		print "Invalid option!"
		continue


