#' Genomic data of the MSK-MetTropism cohort
#' @docType Data
#'
#' @description This table contains sample names and corresponding read counts data from the MSK-MetTropism cohort.
#'
#' @usage data(MSK_genomic_data)
#'
#' @format A tibble with 224939 rows and 10 columns:
#'
#' @source MSK-MET at cBioPortal https://www.cbioportal.org/study/summary?id=msk_met_2021
#' @examples
#' data(MSK_genomic_data)
#' MSK_genomic_data
"MSK_genomic_data"

#' Genomic data of the MSK-MetTropism cohort
#' @docType Data
#'
#' @description This table contains sample names and corresponding clinical data from the MSK-MetTropism cohort.
#'
#' @usage data(MSK_clinical_data)
#'
#' @format A tibble with 25659 rows and 15 columns:
#'
#' @source MSK-MET at cBioPortal https://www.cbioportal.org/study/summary?id=msk_met_2021
#' @examples
#' data(MSK_clinical_data)
#' MSK_clinical_data
"MSK_clinical_data"

#' Priors from PCAWG
#' @docType data
#'
#' @usage data(pcawg_priors)
#'
#' @description Prior distribution of copy number and mutation multiplicity from PCAWG.
#'
#' @format A data frame with 4466 rows and 4 columns:
#' \describe{
#'   \item{gene}{Name of the gene (Hugo Symbol).}
#'   \item{tumor_type}{Tumor type.}
#'   \item{label}{INCOMMON class (<total number of copies>N (Mutated: <mutation multiplicity>N)).}
#'   \item{p}{Gene and tumor type specific prior probability.}
#' }
#' @source Validated copy number calls from PCAWG: https://doi.org/10.5281/zenodo.6410935
#' @examples
#' data(pcawg_priors)
#' pcawg_priors
"pcawg_priors"

#' Gene roles from COSMIC Cancer Gene Census
#' @docType Data
#'
#' @description This table contains gene roles in cancer, as obtained from the COSMIC Cancer
#' Gene Census v98. Data were curated such that each gene in list is assigned
#' either TSG or oncogene.
#'
#' @usage data(cancer_gene_census)
#'
#' @format A data frame with 733 rows and 2 columns:
#' \describe{
#'   \item{gene}{Name of the gene (Hugo Symbol)}
#'   \item{gene_role}{Tumour Suppressor Gene (TSG) or oncogene}
#' }
#' @source COSMIC Cancer Gene Census: https://cancer.sanger.ac.uk/census
#' @examples
#' data(cancer_gene_census)
#' cancer_gene_census
"cancer_gene_census"
