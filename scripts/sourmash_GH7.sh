#!/usr/bin/env bash
#
# University of St Andrews 2022-2023
#
# Author:
# Charlotte S Johns

# Sourmash_GH7_100seqs.sh
# Create Soumash signatures of 100 *.fasta sequences and compare them.
# use kmers: 6, 8, 10
# The argument $1 should be the number of protein sequence IDs; eg) '100', '300', etc.

mkdir Results/Sourmash_out/$1out

mkdir Results/Sourmash_signatures/GH7k6_$1seqs_sigs
time sourmash sketch protein -p k=6 Data/Sourmash/sourmash_$1/*.fasta --outdir Results/Sourmash_signatures/GH7k6_$1seqs_sigs --force
time sourmash compare Results/Sourmash_signatures/GH7k6_$1seqs_sigs/*.fasta.sig -o Results/Sourmash_out/$1out/all$1k6.dist

mkdir Results/Sourmash_signatures/GH7k8_$1seqs_sigs
time sourmash sketch protein -p k=8 Data/Sourmash/sourmash_$1/*.fasta --outdir Results/Sourmash_signatures/GH7k8_$1seqs_sigs --force
time sourmash compare Results/Sourmash_signatures/GH7k8_$1seqs_sigs/*.fasta.sig -o Results/Sourmash_out/$1out/all$1k8.dist

mkdir Results/Sourmash_signatures/GH7k10_$1seqs_sigs
time sourmash sketch protein -p k=10 Data/Sourmash/sourmash_$1/*.fasta --outdir Results/Sourmash_signatures/GH7k10_$1seqs_sigs --force
time sourmash compare Results/Sourmash_signatures/GH7k10_$1seqs_sigs/*.fasta.sig -o Results/Sourmash_out/$1out/all$1k10.dist
