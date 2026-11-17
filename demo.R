# Run from the repository root using Rscript demo.R.
# The setup and reporting wrap the join demonstrated in the interview slides.
library(dplyr)

deg <- read.csv("synthetic_de.csv", stringsAsFactors = FALSE)
annotation_gene <- read.csv("synthetic_annotation.csv", stringsAsFactors = FALSE)
lfc_column <- "log2FoldChange_merRNA_GP3_vs_WT_GP3"
padj_column <- "padj_merRNA_GP3_vs_WT_GP3"

analysis_data <- deg %>%
  select(EJ10_ID, all_of(c(lfc_column, padj_column))) %>%
  inner_join(annotation_gene, by = "EJ10_ID") %>%
  mutate(
    log2FC = suppressWarnings(as.numeric(.data[[lfc_column]])),
    padj = suppressWarnings(as.numeric(.data[[padj_column]]))
  )

print(analysis_data[, c("EJ10_ID", "BD_ID", "functional_annotation", "log2FC", "padj")],
      row.names = FALSE)
cat("DE IDs without annotation:",
    paste(setdiff(deg$EJ10_ID, annotation_gene$EJ10_ID), collapse = ", "), "\n")


