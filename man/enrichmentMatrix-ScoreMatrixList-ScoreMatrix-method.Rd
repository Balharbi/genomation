% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/enrichmentMatrix.R
\docType{methods}
\name{enrichmentMatrix,ScoreMatrixList,ScoreMatrix-method}
\alias{enrichmentMatrix,ScoreMatrixList,ScoreMatrix-method}
\title{Compute an enrichment of IP (stored in ScoreMatrixList object) over control (stored in ScoreMatrix object)}
\usage{
\\S4method{enrichmentMatrix}{ScoreMatrixList,ScoreMatrix}(IP, control)
}
\arguments{
\item{IP}{\code{\link{ScoreMatrixList}} object storing IP samples}

\item{control}{\code{\link{ScoreMatrix}} storing control sample}
}
\value{
\code{ScoreMatrixList} object
}
\description{
This is an \code{enrichmentMatrix} function for IP \code{ScoreMatrixList} object and control \code{ScoreMatrix} object, 
that enables to normalize ChIP-seq signals with respect to IgG or input DNA control.
}
\note{
The function computes an enrichment of IP over control as follow:
Suppose both IP and control are ScoreMatrix objects that have same dimensions. 
Then, the enrichment is calculated usign a formula: log2((IP + 1) / (control + 1)).
}
\examples{
#load IP and control BAM files and create ScoreMatrix objects
library('genomationData')
data(promoters)
bam.file_IP_1 <- system.file("extdata", 
"wgEncodeSydhTfbsH1hescZnf143IggrabAlnRep1.chr21.bam", package = "genomationData")
IP_1 <- ScoreMatrix(target = bam.file_IP_1, windows = promoters, type = 'bam')

bam.file_IP_2 <- system.file("extdata", 
"wgEncodeBroadHistoneH1hescSuz12051317AlnRep1.chr21.bam", package = "genomationData")
IP_2 <- ScoreMatrix(target=bam.file_IP_2, windows = promoters, type = 'bam')

bam.file_c <- system.file("extdata", 
"wgEncodeBroadHistoneH1hescCtcfStdAlnRep1.chr21.bam", package = "genomationData")
control <- ScoreMatrix(target = bam.file_c, windows = promoters, type = 'bam')

# create a ScoreMatrixList object storing IP ScoreMatrix objects
sml_IP <- ScoreMatrixList(list(IP1 = IP_1, IP2 = IP_2))
 
# compute an enrichment of IP over control
enrichmentMatrix(sml_IP, control)

}
\seealso{
\code{\link{ScoreMatrixList}}, \code{\link{ScoreMatrix}}
}
