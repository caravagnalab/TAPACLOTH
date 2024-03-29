% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{pcawg_priors}
\alias{pcawg_priors}
\title{Priors from PCAWG}
\format{
A data frame with 4466 rows and 4 columns:
\describe{
\item{gene}{Name of the gene (Hugo Symbol).}
\item{tumor_type}{Tumor type.}
\item{label}{INCOMMON class (\if{html}{\out{<total number of copies>}}N (Mutated: \if{html}{\out{<mutation multiplicity>}}N)).}
\item{p}{Gene and tumor type specific prior probability.}
}
}
\source{
Validated copy number calls from PCAWG: https://doi.org/10.5281/zenodo.6410935
}
\usage{
data(pcawg_priors)
}
\description{
Prior distribution of copy number and mutation multiplicity from PCAWG.
}
\examples{
data(pcawg_priors)
pcawg_priors
}
\keyword{datasets}
