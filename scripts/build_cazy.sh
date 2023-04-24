#!/usr/bin/env bash
#
# University of St Andrews 2022-2023
#
# Author:
# Charlotte S Johns

# build_cazy.sh

# Build a database of all CAZymes then create a .csv file of the number of unique NCBI protein accessions for each CAZy family. 

# Build CAZy database
cazy_webscraper csj5@st-andrews.ac.uk -o Data/cazy_db/cazycsj

# get CAZy family frequencies

time sqlite3 -header -csv Data/cazy_db/cazycsj "SELECT COUNT(DISTINCT G.genbank_accession) AS Num_of_CAZymes, F.family AS Family
FROM Genbanks AS G
INNER JOIN Genbanks_CazyFamilies AS GF ON G.genbank_id = GF.genbank_id
INNER JOIN CazyFamilies AS F ON GF.family_id = F.family_id
GROUP BY F.family
" > Data/number_cazy.csv