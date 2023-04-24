#!/usr/bin/env bash
#
# University of St Andrews 2022-2023
#
# Authors:
# Emma EM Hobbs and Charlotte S Johns

sqlite3 Data/cazy_db/cazycsj -header -csv 'select G.genbank_accession, F.family
from Genbanks as G
inner join Genbanks_CazyFamilies as GF on G.genbank_id = GF.genbank_id
inner join CazyFamilies as F on GF.family_id = F.family_id
where (F.family = "CE0") or (F.family = "PL9")' > Data/CE0_PL9/CE0_PL9_accessions.csv
