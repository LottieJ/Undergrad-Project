#!/usr/bin/env bash
#
# University of St Andrews 2022-2023
#
# Author:
# Charlotte S Johns

# build_GH7.sh

# Add all the sequences for the family GH7 to the CAZy database cazycsj5 then extract the sequences to a fasta file.

# Download GH7 sequences.
cw_get_genbank_seqs Data/cazy_db/cazycsj csj5@st-andrews.ac.uk --families GH7

# Create fasta file of GH7 sequences from database.
cw_extract_db_seqs Data/cazy_db/cazycsj genbank --families GH7 --fasta_file GH7seqs/GH7.fasta