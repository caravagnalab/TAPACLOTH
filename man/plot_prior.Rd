% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_prior.R
\name{plot_prior}
\alias{plot_prior}
\title{Visualize prior distribution for a gene (tumor-specific or pancancer).}
\usage{
plot_prior(x, gene, tumor_type)
}
\arguments{
\item{x}{A prior distribution in the format required for \code{INCOMMON},
such as \code{INCOMMON::pcawg_priors}.}
}
\value{
An object or a list of objects of class \code{'ggplot2'}.
}
\description{
Visualize prior distribution for a gene (tumor-specific or pancancer).
}
