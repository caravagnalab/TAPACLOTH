% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/compute_posterior.R
\name{compute_posterior}
\alias{compute_posterior}
\title{Compute model posterior and entropy}
\usage{
compute_posterior(
  NV,
  DP,
  gene,
  priors = NULL,
  tumor_type,
  purity,
  entropy_cutoff,
  rho = 0.01,
  karyotypes
)
}
\arguments{
\item{NV}{Number of reads with the variant.}

\item{DP}{Sequencing coverage of the mutated genome site.}

\item{gene}{Gene name or symbol.}

\item{priors}{Prior distribution.}

\item{tumor_type}{Tumor type of the sample.}

\item{purity}{Purity of the sample.}

\item{entropy_cutoff}{Cut-off on entropy for Tier-1/Tier-2 distinction.}

\item{karyotypes}{Karyotypes to be included among the possible classes.}
}
\value{
A table including ploidy, multiplicity, posterior probability,
and classification entropy.
}
\description{
Compute model posterior and entropy
}
\examples{
compute_posterior(
NV = 170,
DP = 200,
gene = 'TP53',
priors = NULL,
tumor_type = 'BRCA',
purity = 0.9,
entropy_cutoff = 0.2,
rho = 0.01,
karyotypes = c("1:0", "1:1", "2:0", "2:1", "2:2")
)
}
