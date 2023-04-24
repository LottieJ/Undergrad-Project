#!/usr/bin/env bash
#
# University of St Andrews 2022-2023
#
# Author:
# Charlotte S Johns

# CE0_PL9.sh

# Download CE0 and PL9 protein sequences to local CAZy database from NCBI

cw_get_genbank_seqs Data/cazy_db/cazycsj5 csj5@st-andrews.ac.uk --families CE0,PL9

cw_extract_db_seqs cazycsj5 genbank --families CE0,PL9 --fasta_file Data/CE0_PL9/CE0_PL9.fasta