#!/usr/bin/env bash
#
# University of St Andrews 2022-2023
#
# Author:
# Charlotte S Johns

# CE0_PL9_Diamond.sh

# Perform an all-vs-all seq comparison on the provided FASTA file.

echo 'Building database'
Diamond makedb \
    --in Data/CE0_PL9/CE0_PL9.fasta \
    --db Results/CE0_PL9/CE0_PL9diamond

echo 'Running DIAMOND'
Diamond blastp \
    --db Results/CE0_PL9/CE0_PL9diamond \
    --query Data/CE0_PL9/CE0_PL9.fasta \
    --out Results/CE0_PL9/CE0_PL9rundiamondfast.tsv \
	--outfmt 6 qseqid sseqid qlen qstart qend pident bitscore \
    --max-target-seqs 0 \
	--fast