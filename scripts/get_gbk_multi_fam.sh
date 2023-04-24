#!/usr/bin/env bash
#
# University of St Andrews 2022-2023
#
# Author:
# Emma EM Hobbs

# get_gbk_multi_fam.sh
# Retrieve the NCBI protein version accession and CAZy family annotations for all proteins 
# in the local CAZyme database that are annotated with more than 1 CAZy family

sqlite3 -header -csv Data/cazy_db/cazycsj "
WITH MULTI_Q (multi_gbk, multi_fam_count) AS (
    SELECT Genbanks.genbank_accession, COUNT(CazyFamilies.family) AS Num_of_Families
    FROM Genbanks
    INNER JOIN Genbanks_CazyFamilies ON Genbanks.genbank_id = Genbanks_CazyFamilies.genbank_id
    INNER JOIN CazyFamilies ON Genbanks_CazyFamilies.family_id = CazyFamilies.family_id
    GROUP BY Genbanks.genbank_accession
)
SELECT G.genbank_accession, F.family
FROM Genbanks AS G
INNER JOIN Genbanks_CazyFamilies AS GF ON G.genbank_id = GF.genbank_id
INNER JOIN CazyFamilies AS F ON GF.family_id = F.family_id
LEFT JOIN MULTI_Q ON G.genbank_accession = MULTI_Q.multi_gbk
WHERE (MULTI_Q.multi_fam_count > 1)
" > Data/cooccurring_families/genbank_acc_multi_fams.csv