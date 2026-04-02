# Create DESeqDataSet from your prepared matrix
dds <- DESeqDataSetFromMatrix(countData = read_counts_table,
                              colData = sample_sheet_data,

# Run DeSeq2
dds <- DESeq(dds)

# Obtain the results
res <- results(dds, contrast=c("Tissue.Type","Tumor","Normal"))
