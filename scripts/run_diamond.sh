#!/usr/bin/env bash
#
# University of St Andrews 2022-2023
#
# Author:
# Charlotte S Johns

# Diamond_GH7.sh

# Perform an all-vs-all seq comparison on the provided FASTA file.
# The argument $1 should be the number of protein sequence IDs; eg) '100', '300', etc.

echo 'Building database'
Diamond makedb \
    --in Data/$1seqs.fasta \
    --db Results/Diamond_out/$1seqsdiamond

# run diamond

echo 'Running DIAMOND'
time Diamond blastp \
    --db Results/Diamond_out/$1seqsdiamond \
    --query Data/$1seqs.fasta \
    --out Results/Diamond_out/$1rundiamondfast.tsv \
	--outfmt 6 qseqid sseqid qlen bitscore \
    --max-target-seqs 0 \
	--fast

# mid-sensitive
time Diamond blastp \
    --db Results/Diamond_out/$1seqsdiamond \
    --query Data/$1seqs.fasta \
    --out Results/Diamond_out/$1rundiamondmidsensitive.tsv \
	--outfmt 6 qseqid sseqid qlen bitscore \
    --max-target-seqs 0 \
	--mid-sensitive

# sensitive
time Diamond blastp \
    --db Results/Diamond_out/$1seqsdiamond \
    --query Data/$1seqs.fasta \
    --out Results/Diamond_out/$1rundiamondsensitive.tsv \
	--outfmt 6 qseqid sseqid qlen bitscore \
    --max-target-seqs 0 \
	--sensitive