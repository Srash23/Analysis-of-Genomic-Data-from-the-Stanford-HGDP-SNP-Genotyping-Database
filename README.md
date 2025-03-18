# CHR6 SNP Analysis

## Exploring Genetic Variation in Chromosome 6

### Introduction

This project focuses on the analysis of genomic data extracted from the Stanford HGDP SNP Genotyping Database, specifically targeting chromosome 6 (chr6) in individuals of European descent (H938 Euro). The primary objective is to examine genetic variation and population structure using computational and statistical methods.

### Why This Study is Important

Understanding genetic variation in chromosome 6 is critical for exploring its role in disease susceptibility, immune system function, and evolutionary patterns. SNPs within this chromosome are known to be associated with autoimmune disorders and other complex diseases. By applying statistical and computational methods, we aim to identify meaningful genetic patterns and potential disease-linked SNPs.

### Workflow

![_- visual selection](https://github.com/user-attachments/assets/024e9bcc-d76f-4c48-829c-ebe70bd1796c)

### Results

After applying multiple testing corrections to the dataset:

1. 38,805 SNPs were significant before correction.

2. 32,196 SNPs remained significant after Bonferroni correction.

3. 38,562 SNPs remained significant after the Benjamini-Hochberg correction.

4. When applying a stricter threshold (p < 1e-5), 33,126 SNPs were retained.

### Discussion

The large number of significant SNPs suggests that chromosome 6 contains multiple regions of interest, potentially linked to disease-associated genes. The Benjamini-Hochberg correction retained most of the SNPs, allowing for further investigation while controlling the false discovery rate. In contrast, the Bonferroni correction, being highly conservative, removed a substantial number of SNPs, potentially eliminating true positives.

### Conclusion

The analysis confirms that chromosome 6 harbors significant genetic variation that may be relevant for further functional and disease-related studies. However, additional validation using external datasets (e.g., GWAS, ClinVar) is required to confirm the biological significance of these findings.

### Future Steps

1. Functional Annotation of SNPs – Mapping significant SNPs to known genes and regulatory elements.

2. Validation with External Datasets – Comparing results with GWAS and ClinVar to identify disease-associated SNPs.

3. Pathway Analysis – Investigating whether identified SNPs are enriched in known biological pathways.

4. Machine Learning for Prioritization – Using computational models to rank SNPs based on their potential biological impact.

