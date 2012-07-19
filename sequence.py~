# Introduction
print "FastQ Paired/Single End Sequence Analyzer for Python"
print "Made by Vinay Hiremath, Licensed under GPL"

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


# Initialize running of .jar file
import os
# Trimmomatic steps
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

for x in xrange(1:1000):
###
if TRIM == 1:
	print "Starting..."
	TRIM_FLAGS = raw_input("Enter any optional manual flags: ")
	os.system('java -classpath trimmomatic.jar org.usadellab.trimmomatic.TrimmomaticPE %s -threads %s -%s -trimlog %s %s %s %s %s %s %s ILLUMINACLIP') % (TRIM_FLAGS, THREADS, PHRED, TRIM_LOG, FASTQ1, FASTQ2, P_R1, U_R1, P_R2, U_R2)
	continue
###
elif TRIM == 2:
	print "Starting..."
	SLIDINGWINDOW_WINDOW = raw_input("Specify window size (number of bases to average across): ")
	SLIDINGWINDOW_QUALITY = raw_input("Specify required quality: ")
	TRIM_FLAGS = raw_input("Enter any optional manual flags: ")
	print "java -classpath trimmomatic.jar org.usadellab.trimmomatic.TrimmomaticPE %s -threads %s -%s -trimlog %s %s %s %s %s %s %s SLIDINGWINDOW:%s:%s') % (TRIM_FLAGS, THREADS, PHRED, TRIM_LOG, FASTQ1, FASTQ2, P_R1, U_R1, P_R2, U_R2, SLIDINGWINDOW_WINDOW, SLIDINGWINDOW_QUALITY"
	os.system('java -classpath trimmomatic.jar org.usadellab.trimmomatic.TrimmomaticPE %s -threads %s -%s -trimlog %s %s %s %s %s %s %s SLIDINGWINDOW:%s:%s') % (TRIM_FLAGS, THREADS, PHRED, TRIM_LOG, FASTQ1, FASTQ2, P_R1, U_R1, P_R2, U_R2, SLIDINGWINDOW_WINDOW, SLIDINGWINDOW_QUALITY)
###
elif TRIM == 3:
	print "Starting..."
	LEADING_QUALITY = raw_input("Specify minimum quality: ")
	TRIM_FLAGS = raw_input("Enter any optional manual flags: ")
	os.system('java -classpath trimmomatic.jar org.usadellab.trimmomatic.TrimmomaticPE %s -threads %s -%s -trimlog %s %s %s %s %s %s %s LEADING:%s') % (TRIM_FLAGS, THREADS, PHRED, TRIM_LOG, FASTQ1, FASTQ2, P_R1, U_R1, P_R2, U_R2, LEADING_QUALITY)
	continue
###
elif TRIM == 4:
	print "Starting..."
	TRAILING_QUALITY = raw_input("Specify minimum quality: ")
	TRIM_FLAGS = raw_input("Enter any optional manual flags: ")
	os.system('java -classpath trimmomatic.jar org.usadellab.trimmomatic.TrimmomaticPE %s -threads %s -%s -trimlog %s %s %s %s %s %s %s TRAILING:%s') % (TRIM_FLAGS, THREADS, PHRED, TRIM_LOG, FASTQ1, FASTQ2, P_R1, U_R1, P_R2, U_R2, TRAILING_QUALITY)
	continue
###
elif TRIM == 5:
	print "Starting..."
	CROP_VALUE = raw_input("Specify number of bases to keep (from start of read): ")
	TRIM_FLAGS = raw_input("Enter any optional manual flags: ")
	os.system('java -classpath trimmomatic.jar org.usadellab.trimmomatic.TrimmomaticPE %s -threads %s -%s -trimlog %s %s %s %s %s %s %s CROP:%s') % (TRIM_FLAGS, THREADS, PHRED, TRIM_LOG, FASTQ1, FASTQ2, P_R1, U_R1, P_R2, U_R2, CROP_VALUE)
	continue
###
elif TRIM == 6:
	print "Starting..."
	HEADCROP_VALUE = raw_input("Specify number of bases to crop (from start of read): ")
	TRIM_FLAGS = raw_input("Enter any optional manual flags: ")
	os.system('java -classpath trimmomatic.jar org.usadellab.trimmomatic.TrimmomaticPE %s -threads %s -%s -trimlog %s %s %s %s %s %s %s HEADCROP:%s') % (TRIM_FLAGS, THREADS, PHRED, TRIM_LOG, FASTQ1, FASTQ2, P_R1, U_R1, P_R2, U_R2, HEADCROP_VALUE)
	continue
###
elif TRIM == 7:
	print "Starting..."
	MINLENGTH_VALUE = raw_input("Specify minimum length of reads to keep: ")
	TRIM_FLAGS = raw_input("Enter any optional manual flags: ")
	os.system('java -classpath trimmomatic.jar org.usadellab.trimmomatic.TrimmomaticPE %s -threads %s -%s -trimlog %s %s %s %s %s %s %s MINLENGTH:%s') % (TRIM_FLAGS, THREADS, PHRED, TRIM_LOG, FASTQ1, FASTQ2, P_R1, U_R1, P_R2, U_R2, MINLENGTH_VALUE)
	continue
###
elif TRIM == 8:
	print "Starting..."
	TRIM_FLAGS = raw_input("Enter any optional manual flags: ")
	os.system('java -classpath trimmomatic.jar org.usadellab.trimmomatic.TrimmomaticPE %s -threads %s -%s -trimlog %s %s %s %s %s %s %s TOPHRED33') % (TRIM_FLAGS, THREADS, PHRED, TRIM_LOG, FASTQ1, FASTQ2, P_R1, U_R1, P_R2, U_R2)
	continue
###
elif TRIM == 9:
	print "Starting..."
	TRIM_FLAGS = raw_input("Enter any optional manual flags: ")
	os.system('java -classpath trimmomatic.jar org.usadellab.trimmomatic.TrimmomaticPE %s -threads %s -%s -trimlog %s %s %s %s %s %s %s TOPHRED64') % (TRIM_FLAGS, THREADS, PHRED, TRIM_LOG, FASTQ1, FASTQ2, P_R1, U_R1, P_R2, U_R2)
	continue
###
elif TRIM == 10:
	break
###
else
	print "Invalid option!"


print "Done!"
