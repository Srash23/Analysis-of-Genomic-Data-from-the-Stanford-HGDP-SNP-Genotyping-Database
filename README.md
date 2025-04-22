# SNP Allele Frequency Analysis with Multiple Testing Correction

This repository presents an end-to-end workflow for statistical analysis of SNP (Single Nucleotide Polymorphism) genotype data. The project applies binomial tests to detect deviations from expected allele frequencies, corrects for multiple testing using Bonferroni and Benjamini-Hochberg methods, and visualizes the p-value distributions to identify significant variants.

## Project Overview

The objective is to identify SNPs on **Chromosome 6** that exhibit significant deviation in allele frequencies from an expected 0.5 proportion. The analysis includes:

- Calculating allele counts per SNP
- Performing binomial tests
- Applying multiple testing correction (Bonferroni, BH)
- Visualizing p-value distributions and significant SNPs
- Generating quality control plots like QQ-plots and scatter plots

## Key Objectives

- Perform allele frequency analysis using binomial tests  
- Apply multiple testing correction (Bonferroni & Benjamini-Hochberg)  
- Visualize raw and adjusted p-value distributions  
- Filter and report highly significant SNPs for downstream interpretation  

## Input Files

| File                             | Description                                      |
|----------------------------------|--------------------------------------------------|
| `H938_Euro_chr6.geno`            | Genotype count data for SNPs on Chromosome 6     |
| `p_values_adjusted.csv`         | Output from R containing raw & adjusted p-values |

## Pipeline Summary

### Step 1: Allele Frequency Analysis in R
- Read genotype matrix with counts: `nA1A1`, `nA1A2`, `nA2A2`
- Calculate A1 allele counts and total alleles
- Perform binomial test for each SNP (null: p = 0.5)
- Apply Bonferroni and BH corrections
- Save results to `p_values_adjusted.csv`

### Step 2: Visualization in Python
- Load the corrected p-value table
- Generate:
  - Histogram of p-values
  - Scatter plot: Raw vs Adjusted p-values
  - QQ-plot for uniformity
- Summarize significant SNPs by thresholds

## Key Visualizations

### 1. Histogram of Raw and Adjusted P-Values  
Illustrates the skew in raw vs corrected significance distribution.
<img width="902" alt="Screenshot 2025-04-21 at 9 44 57 PM" src="https://github.com/user-attachments/assets/0df953a1-6cba-4204-8fa9-c3bfc6292379" />

### 2. Scatter Plot: Raw vs Adjusted  
Shows the magnitude of correction by Bonferroni and BH.
<img width="856" alt="Screenshot 2025-04-21 at 9 55 49 PM" src="https://github.com/user-attachments/assets/91f0fa4d-9bce-481f-8170-469d0fcb9895" />

### 3. QQ Plot  
Evaluates the uniformity of raw p-values under the null hypothesis.
<img width="535" alt="Screenshot 2025-04-21 at 9 56 07 PM" src="https://github.com/user-attachments/assets/79778c52-7c13-4cb6-a7ed-cd171cdcef74" />

## Summary Stats

| Metric                           | Count   |
|----------------------------------|---------|
| Total SNPs analyzed              | ~43,141 |
| Raw significant SNPs (p < 0.05)  | 38,805  |
| Bonferroni significant SNPs      | 32,196  |
| BH adjusted significant SNPs     | 38,562  |
| Highly significant (p < 1e-5)    | 33,126  |

## Tools Used

- **R**: `binom.test`, `p.adjust`, `write.csv`
- **Python**: `pandas`, `matplotlib`, `seaborn`, `scipy.stats`
- **Statistical Tests**: Binomial test, Bonferroni & BH correction

## Applications & Impact

- Identifying candidate SNPs for GWAS or eQTL studies  
- Demonstrating robust statistical testing across large-scale genomic data  
- Teaching reproducibility and visualization in statistical genomics

## License

MIT License
