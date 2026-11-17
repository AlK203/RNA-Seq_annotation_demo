# Joining RNA-seq results to gene annotations in R

This example demonstrates how differential-expression results for a mutant-versus-wild-type contrast can be joined to gene annotations using a shared gene identifier. Both CSV files contain entirely synthetic IDs, annotations and values.

## Run the example

1. Open R or RStudio and set the working directory to the folder containing this README.
2. Install the required package once with `install.packages("dplyr")`.
3. Run `source("demo.R")` in the R console or `Rscript demo.R` in a terminal from the same directory.

## Read the output

The join retains DEMO_001, DEMO_002 and DEMO_003. DEMO_004 occurs only in the differential-expression file and is reported as unmatched. DEMO_005 occurs only in the annotation file. DEMO_003 is retained despite its adjusted p-value of 0.2 because this step matches identifiers. Significance filtering and enrichment are later steps.

## Files

| File | Purpose |
| --- | --- |
| demo.R | Runs the join and reports unmatched DE IDs |
| synthetic_de.csv | Synthetic fold changes and adjusted p-values |
| synthetic_annotation.csv | Synthetic mapping and functional labels |

