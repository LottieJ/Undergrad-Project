# Undergrad-Project
This repository includes scripts and notebooks associated with the University of St Andrews BL4201 project of Charlotte Johns.

To repeat the analysis, run all scripts from the root project directory.

## Data

The Data folder contains GH7 protein sequence FASTA files, number_cazy.csv containing the number of CAZymes in each family in the local CAZy database, cooccurring_families contains files relating to identifying CAZymes with multiple catalytic domains and CE0_PL9 contains CE0 and PL9 sequence accessions.

## Results

The results folder contains raw time data for running the tools in Times.xlsx as well as output directories for running each tool which contain output data files and PNG files of clustermaps. 
CE0_PL9 contains files relating to CE0 and PL9 analysis and visualisation.

## Build a local CAZyme database

Using `cazy_webscraper` (version 2.2.7) the bash script build_cazy.sh was run to build a local CAZy database and create the output CSV file `Data/number_cazy.csv`, using the following command: [Build CAZy](https://lottiej.github.io/Undergrad-Project/scripts/build_cazy.sh)

```bash
bash scripts/build_cazy.sh
```

From the output the CAZy family GH7 was chosen for further analysis.

## Create sequence datasets

The bash script build_GH7.sh was ran to download GH7 protein sequences and extract them to a FASTA file `Data/GH7seqs/GH7.fasta`, using the command:

```bash
bash scripts/build_GH7
```

The jupyter notebook [Random Select](https://lottiej.github.io/Undergrad-Project/notebooks/Random_Select.html) was used to create randmly selected datasets of GH7 100, 300, 500, 1,000, 3,000, 5,000 and 10,000 sequences.

Original datasets can be found in `Data/*seqs.fasta`.

## Compute sequence diversity in 100 GH7 protein sequences dataset

The bash script BLASTP_GH7.sh was used with the argument '100seqs' to run BLAST+ (version 2.7.1+) and create the output file `Results/BLASTP_out/100seqs_blastp_out.tsv`, using the command:

```bash
bash scripts/BLASTP_GH7.sh 100seqs
```

The bash script run_diamond.sh was used with the argument '100' to run DIAMOND (version 2.1.4) at the sensitivity levels fast, Mid-sensitive and Sensitive and create TSV files found in `Results/Diamond_out`, using the command:

```bash
bash scripts/run_diamond.sh 100
```

The bash script Sourmash_GH7.sh was used with the argument '100' to run Sourmash (version 4.0.0a2) to create the DIST files for each k-mer size, found in `Results/Sourmash_out/100out`.

```bash
bash scripts/Sourmash_GH7.sh 100
```

## Compare accuracy of tools by visualising sequence diversity

Clustermaps to visualise sequence diversity were plotted using the python packages `seaborne` (version 0.11.2), `pandas` (version 0.23.4) and `numpy` (version 1.18.1).

[BLASTP](https://lottiej.github.io/Undergrad-Project/notebooks/BLASTP_Plot_GH7.html) was run to plot matrix of BSR.

[Sourmash](https://lottiej.github.io/Undergrad-Project/notebooks/Sourmash_Plot_GH7.html) was run to plot matrix of Jaccard indexes for each of kmer sizes 6, 8 and 10.

[DIAMOND](https://lottiej.github.io/Undergrad-Project/notebooks/Diamond_Plot_GH7.html) was run to plot matrix of BSR for each of the levels of DIAMOND sensitivity: Fast, Mid-sensitive and Sensitive.

Output clustermaps are saved as PNG files in each tools output file in `Results`.

## Benchmark speed of all tools

Record real time outputs to the terminal by running:
BLASTP_GH7.sh with the arguments ‘100seqs’, ‘300 seqs’, ‘500 seqs’, ‘1000 seqs’, ‘3000 seqs’, ‘5000 seqs’, and ‘10000 seqs’.
Sourmash_GH7.sh and run_diamond.sh  with the arguments ‘100’, ‘300’, ‘500’, ‘1000’, ‘3000’, ‘5000’, and ‘10000’.

```bash
bash scripts/BLASTP_GH7.sh 100seqs
bash scripts/BLASTP_GH7.sh 300seqs
bash scripts/BLASTP_GH7.sh 500seqs
bash scripts/BLASTP_GH7.sh 1000seqs
bash scripts/BLASTP_GH7.sh 3000seqs
bash scripts/BLASTP_GH7.sh 5000seqs
bash scripts/BLASTP_GH7.sh 10000seqs
bash scripts/run_diamond.sh 100
bash scripts/run_diamond.sh 300
bash scripts/run_diamond.sh 500
bash scripts/run_diamond.sh 1000
bash scripts/run_diamond.sh 3000
bash scripts/run_diamond.sh 5000
bash scripts/run_diamond.sh 10000
bash scripts/Sourmash_GH7.sh 100
bash scripts/Sourmash_GH7.sh 300
bash scripts/Sourmash_GH7.sh 500
bash scripts/Sourmash_GH7.sh 1000
bash scripts/Sourmash_GH7.sh 30000
bash scripts/Sourmash_GH7.sh 5000
bash scripts/Sourmash_GH7.sh 10000
```

Times for running sourmash sketch an sourmash compare will be printed out separately. Run times were recorded in triplicate.

## Co-occurring families
get_fam_annotations
### Get CAZy family-subfamily pairs

The script `get_fam_subfam.sh` was ran to download every pair of CAZy familes and subfamiles from the local CAZyme database.

```bash
bash scripts/get_fam_subfam.sh
```

This generated a CSV file listing a unique pair of CAZy family and subfamily per row, and written to `Data/cooccurring_families/cazy_fam_subfams.csv`.

### Get CAZy family annotations for CAZymes with multiple domains

All CAZy family annotations for CAZymes annotated with more than one CAZy family in the local CAZyme database were obtain by running `get_gbk_multi_fam.sh`.

```bash
bash scripts/get_gbk_multi_fam.sh
```

Every unique pair of NCBI protein version accession and CAZy family were written on a separate line in the output CSV file `Data/cooccurring_families/genbank_acc_multi_fams.csv`.

### Identify families that have and have not been divided into subfamilies

The Jupyter notebook [Co-occurring CAZy Families](https://lottiej.github.io/Undergrad-Project/notebooks/identify_cooccuring_cazy_familes.html) was ran using the input of `cazy_fams_subfams.csv` to split the CAZy families up depending on whether they contained subfamilies, and write the out-put to `Data/cooccurring_families/fams_with_subfams` and `Data/cooccurring_families/fams_withOUT_subfams` respectively.

### Identify groups of CAZy families that appear in the same protein together

The notebook [Co-occurring CAZy Families](https://lottiej.github.io/Undergrad-Project/notebooks/identify_cooccuring_cazy_familes.html) was used to go through `data/cooccurring_families/genbank_acc_multi_fams.csv` and find proteins that contained multiple CAZyme families. The number of proteins containing that groups of CAZyme families was recorded and written to the output file `cooccurring_fams.csv`.

The notebook then used the `cooccurring_fams.csv` file to find the families containing multiple catalytic domains and write them out to `multi_cat_domains_groups.csv`.

### Get CE0 and PL9 family annotations

The bash script get_fam_annotations.sh was run to retrieve CE0 and PL9 annotations using the command:

```bash
bash scripts/get_fam_annotations.sh
```

This produced the out-put `Data/CE0_PL9/CE0_PL9_accessions.csv`.

### Run DIAMOND Fast on CE0 and PL9

The bash script CE0_PL9.sh was ran to download CE0 and PL9 family protein sequences from NCBI to the local CAZy database, then extracted to a FASTA file `Results/CE0_Pl9/CE0_Pl9.fasta`; using the command:

```bash
bash scripts/CEO_PL9.sh
```

The bash script CE0_PL9_Diamond.sh was used to run DIAMOND Fast analysis on the `CE0_PL9.fasta` file.

```bash
bash scripts/CE0_PL9_Diamond.sh
```

This created the file `CE0_PL9rundiamondfast.tsv` which was used to run the Juypter notebook [CE0 and PL9](https://lottiej.github.io/Undergrad-Project/notebooks/CE0_PL9.html) to plot clustermaps of the normalised bitscores, query cover and percentage identity for these families. Proteins that contained both CE0 and PL9 domains were identified and written to Cooccurring.csv. Proteins of interest that showed a BSR >1 to the proteins containing both CAZyme family domains were identified then plotted on clustermaps of their BSR values and query cover values.
