library(Matrix)
library(rhdf5)

data <- readRDS("Cerebrum_gene_count.RDS")
h5createFile("Cerebrum_gene_count.h5")
sample_range <- 0:9
for (i in sample_range){
    s_out = paste("sample", i, sep="")
    print(s_out)
    s_data = paste(s_out, '/data', sep="")
    s_colnames = paste(s_out, "/colnames", sep="")
    pos <- as.numeric(readLines(paste("positions", i, ".txt", sep="")))
    h5createGroup("Cerebrum_gene_count.h5", s_out)
    sampled_data <- data[,pos]
    full_sampled_data <- as.matrix(sampled_data)
    h5write(full_sampled_data, "Cerebrum_gene_count.h5", s_data)
    h5write(colnames(full_sampled_data), "Cerebrum_gene_count.h5", s_colnames)
}
