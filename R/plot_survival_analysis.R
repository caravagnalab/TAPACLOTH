#' Visualise survival analysis based on INCOMMON classes.
#'
#' @param x A list of objects of class \code{'INCOMMON'} containing the classification results for
#' multiple samples, as produced by using function `classify`.
#' @param tumor_type The selected tumour type.
#' @param gene The selected gene.
#' @param cox_covariates A character vector listing the covariates to be used in the multivariarte regression.
#' @return An object or a list of class \code{'ggplot2'} showing Kaplan-Meier curves and 
#' Cox regression forest plot.
#' @export
#' @importFrom dplyr filter mutate rename select %>%
#' @importFrom survminer ggsurvplot
#' @importFrom patchwork wrap_plots plot_layout

plot_survival_analysis = function(x, tumor_type, gene, cox_covariates = c('age', 'sex', 'tmb')){
  
  km_fit = kaplan_meier_fit(x, tumor_type, gene)
  
  fit = km_fit$fit[[1]]
  data = km_fit$data[[1]]
  
  stopifnot(inherits(fit, 'survfit'))
  
  names(fit$strata) = gsub(fit$strata %>% names(), pattern='group=',replacement='')
  
  km_plot = survminer::ggsurvplot(
    fit = fit,
    censor = F,
    conf.int = F,
    data = data,
    ylab = "Overall Survival",
    xlab = "Time (months)",
    fontsize = 4,
    risk.table = TRUE,
    risk.table.col = "strata",
    table.fontsize = 0.1,
    ggtheme = CNAqc:::my_ggplot_theme(cex = .8),
    tables.theme = CNAqc:::my_ggplot_theme(cex = .8),
    palette = surv_colors(unique(data$gene_role))
  ) 
  
  km_plot$plot$data$tumor_type = unique(data$tumor_type)
  km_plot$data.survplot$tumor_type = unique(data$tumor_type)
  
  km_plot$plot = km_plot$plot + ggplot2::xlab('') + ggplot2::guides(color = 'none') + ggplot2::facet_wrap(~tumor_type)
  km_plot$table = km_plot$table + ggplot2::ylab('') + ggplot2::theme(legend.position = 'none')
  
cox_fit = cox_fit(x, gene, tumor_type, cox_covariates)

forest_plot = forest_plot(cox_fit)

patchwork::wrap_plots(km_plot$plot, 
                      km_plot$table, 
                      forest_plot)+
  patchwork::plot_layout(heights = c(2.5,1,2))
}
