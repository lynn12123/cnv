library(seqCNA) 
data(seqsumm_HCC1143) 
head(seqsumm_HCC1143)
dim(seqsumm_HCC1143)
tail(seqsumm_HCC1143)
## 200Kb windows to calculate the GC content and counts.
rco = readSeqsumm(tumour.data=seqsumm_HCC1143) 
rco = applyFilters(rco, trim.filter=1, mapq.filter=2)
rco = runSeqnorm(rco) 
rco = runGLAD(rco) 
plotCNProfile(rco) 
rco = applyThresholds(rco, seq(-0.8,4,by=0.8), 1)
plotCNProfile(rco)
summary(rco) 
head(rco@output)
writeCNProfile(rco,'./')
