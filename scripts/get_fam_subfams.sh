#!/usr/bin/env bash
#
# University of St Andrews 2022-2023
#
# Author:
# Emma EM Hobbs

# get_fam_subfams.sh
# Retrieve every pair of parent CAZy family and child CAZy subfamily from the local CAZyme database

sqlite3 -header -csv Data/cazy_db/cazycsj "SELECT F.family, F.subfamily
FROM CazyFamilies AS F
" > Data/cooccurring_families/cazy_fam_subfams.csv