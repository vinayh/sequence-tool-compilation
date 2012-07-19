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
if QUAL == 2:
	PHRED = "phred64"

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
#if TRIM == 1:
		
#if TRIM == 2:
#if TRIM == 3:
#if TRIM == 4:
#if TRIM == 5:
#if TRIM == 6:
#if TRIM == 7:
#if TRIM == 8:
#if TRIM == 9:
#if TRIM == 10:
