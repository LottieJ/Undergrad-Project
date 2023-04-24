#!/usr/bin/env bash
#
# University of St Andrews 2022-2023
#
# Author:
# Charlotte S Johns

# BLASTP_GH7.sh

# Perform BLAST analysis on GH7 protein sequnces.
# The argument $1 should be the number of protein sequence IDs followed by 'seqs'; eg) '100seqs', '300seqs', etc.

time blastp \
	-query Data/$1.fasta \
	-subject Data/$1.fasta \
	-out Results/BLASTP_out/$1_blastp_out.tsv \
	-outfmt "6 qseqid sseqid qlen bitscore"