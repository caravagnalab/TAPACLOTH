% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/test_setup.R
\name{test_setup}
\alias{test_setup}
\title{Compute parameters and distribution for null hypothesis.}
\usage{
test_setup(
  coverage = 500,
  purity = 1,
  rho = 0.01,
  alpha_level = 0.01,
  model = "binomial"
)
}
\arguments{
\item{coverage}{The sequencing coverage at the locus of mutation.}

\item{purity}{Sample purity.}

\item{rho}{The overdisperion parameter for "Beta-Binomial" model.}

\item{alpha_level}{The confidence level of the test.}

\item{model}{Model used for the test, either "Binomial" or "Beta-Binomial".}
}
\value{
A list.
}
\description{
Compute parameters and distribution for null hypothesis.
}
\examples{
null_model = test_setup(coverage = 500, purity = 1.0, rho = 0.01, alpha_level = 0.01, model = 'binomial') 
print(null_model)
}
