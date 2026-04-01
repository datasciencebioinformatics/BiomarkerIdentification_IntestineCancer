### Filter to keep only the STAR - Counts data
star_gene_counts_sample_sheet_file=$project_folder"gdc_sample_sheet_star_gene_counts.tsv"
star_gene_counts_manifest_file=$project_folder"gdc_manifest_star_gene_counts.tsv"

# Filter the list
head -n 1 $Sample_sheet_file  >  $star_gene_counts_sample_sheet_file
cat $Sample_sheet_file | grep "rna_seq.augmented_star_gene_counts.tsv" >> $star_gene_counts_sample_sheet_file

# Take the head
head -n 1 $Manifest_file  >  $star_gene_counts_manifest_file
cat $Manifest_file | grep "rna_seq.augmented_star_gene_counts.tsv"   >> $star_gene_counts_manifest_file
