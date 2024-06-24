# Load necessary library
library(stats)

# Read the genotype data, skipping the header
geno_data <- read.table("H938_Euro_chr6.geno", header = TRUE, stringsAsFactors = FALSE)

# Initialize a vector to store p-values
p_values <- numeric(nrow(geno_data))

# Loop through each SNP to calculate allele frequencies and perform binomial test
for(i in 1:nrow(geno_data)) {
  # Extract counts
  nA1A1 <- geno_data$nA1A1[i]
  nA1A2 <- geno_data$nA1A2[i]
  nA2A2 <- geno_data$nA2A2[i]
  
  # Calculate the number of A1 alleles (2 * homozygous + heterozygous) and total alleles
  count_A1 <- 2*nA1A1 + nA1A2
  total_alleles <- 2 * (nA1A1 + nA1A2 + nA2A2)
  
  # Perform binomial test assuming p=0.5
  if(total_alleles > 0) {
    test_result <- binom.test(x = count_A1, n = total_alleles, p = 0.5)
    # Save the p-value
    p_values[i] <- test_result$p.value
  } else {
    # Assign NA to p-values when the test is not applicable
    p_values[i] <- NA
  }
}

# Remove NA values from p-values before adjustment and multiple testing corrections
p_values <- na.omit(p_values)

# Adjust p-values for multiple testing
p_values_bonferroni <- p.adjust(p_values, method = "bonferroni")
p_values_bh <- p.adjust(p_values, method = "BH")

# Save p-values to a file with correct path
write.table(cbind(raw_p_values = p_values, bonferroni_adjusted_p_values = p_values_bonferroni, BH_adjusted_p_values = p_values_bh), 
            "p_values_adjusted.txt", row.names = FALSE, col.names = TRUE, quote = FALSE)

# Save p-values to a file in CSV format
write.csv(cbind(raw_p_values = p_values, bonferroni_adjusted_p_values = p_values_bonferroni, BH_adjusted_p_values = p_values_bh), 
          "p_values_adjusted.csv", row.names = FALSE, quote = FALSE)


# Print the counts of significant p-values
cat("Significant p-values before adjustment:", sum(p_values < 0.05), "\n")
cat("Significant p-values after Bonferroni correction:", sum(p_values_bonferroni < 0.05), "\n")
cat("Significant p-values after Benjamini-Hochberg correction:", sum(p_values_bh < 0.05), "\n")

# Define the content of the script as a string
script_content <- "

"

# Specify the path to the file where you want to save the script
script_path <- 'chr6_snp_analysis.R'

# Open a file connection for writing and then close it after writing
writeLines(script_content, con = script_path)


