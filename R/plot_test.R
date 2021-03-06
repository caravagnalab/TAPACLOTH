#'Plotting function for class \code{'TAPACLOTH'}.
#' @description
#' Produces a list of plots, one for each mutation in the input, displaying the
#' results of classification.
#' @param x An obj of class \code{'TAPACLOTH'}.
#' @import CNAqc
#' @import ggplot2
#' @import ggsci 
#' @import ggridges 
#' @importFrom dplyr filter mutate rename select %>% 
#' @return An object of class \code{'TAPACLOTH'} containing a list of ggplot2
#' plots named `plot_test` inside `classifier`.
#' @export
plot_test = function(x) {
  stopifnot(inherits(x, "TAPACLOTH"))
  x = idify(x)
  plotmodels = lapply(models_avail(x), function(model) {
    plotlist = lapply(get_data(x) %>% pull(id), function(ID) {
      ## Get data for mutation and model used
      mdata = get_classifier(x, model = model) %>% 
        idify() %>% 
        get_data() %>% 
        dplyr::filter(id == ID)
      ## Get sample purity
      purity = get_purity(x)
      ## Format data for plot
      y = lapply(1:(mdata %>% nrow()),
                 function(i) {
                   k = mdata[i,]$karyotype
                   m = mdata[i,]$multiplicity
                   if ((model %>% tolower()) == "binomial") {
                     p = dbinom(
                       x = 1:get_DP(x, ID),
                       size = get_DP(x, ID),
                       prob = m * get_purity(x) / (2 * (1 - get_purity(x)) + get_purity(x) * get_ploidy(k))
                     )
                   }
                   if ((model %>% tolower()) == "beta-binomial") {
                     p = VGAM::dbetabinom(
                       x = 1:get_DP(x, ID),
                       size = get_DP(x, ID),
                       rho = get_rho(x),
                       prob = m * get_purity(x) / (2 * (1 - get_purity(x)) + get_purity(x) * get_ploidy(k))
                     )
                   }
                   tibble(
                     nv = 1:get_DP(x, ID),
                     p = p,
                     karyotype = mdata[i,]$karyotype,
                     multiplicity = mdata[i,]$multiplicity,
                     outcome = mdata[i,]$outcome,
                     l_a = mdata[i,]$l_a,
                     r_a = mdata[i,]$r_a
                   )
                 }) %>% do.call(rbind, .)
      y = y %>%
        dplyr::mutate(
          class = case_when(
            outcome == "FALSE" & multiplicity == 1 ~ "FAIL1",
            outcome == "FALSE" & multiplicity == 2 ~ "FAIL2",
            outcome == "TRUE" ~ karyotype,
          )
        ) #ifelse(outcome == "FAIL", "FAIL", karyotype))
      ## Build plot
      plt = ggplot2::ggplot() +
        ggridges::geom_density_ridges(
          data = y %>% dplyr::filter(nv >= l_a & nv <= r_a),
          mapping = ggplot2::aes(
            x = nv,
            y = karyotype,
            height = p,
            fill = class
          ),
          stat = "identity",
          alpha = 0.8
        )
      
      if ((model %>% tolower()) == "beta-binomial") {
        model_string = bquote("Test using Beta-Binomial model with " * rho * " = " *
                                .(get_rho(x)))
      } else{
        model_string = bquote("Test using Binomial model")
      }
      
      plt +
        ggplot2::scale_fill_manual(
          values = c(
            "FAIL1" = "#BEBEBE66",
            "FAIL2" = "#BEBEBE66",
            "1:0" = "steelblue",
            "1:1" = "#228B22CC",
            "2:0" =  "turquoise4",
            "2:1" = "#FFA500CC",
            "2:2" = "firebrick3"
          ),
          limits = c(unique(y$class)),
          guide = "none"
        ) +
        ggplot2::geom_vline(xintercept = get_NV(x, mutation_id = ID), linetype = "longdash") +
        CNAqc:::my_ggplot_theme() +
        ggplot2::coord_cartesian(clip = "off") +
        ggplot2::labs(
          x = 'NV',
          y = "Pr(X = NV)",
          caption = model_string,
          title = paste0(ID," ; Gene ", get_gene(x, ID)),
          subtitle = bquote(
            "DP = " * .(unique(mdata$DP)) * '; ' * pi * ' = ' * .(get_purity(x)) * ', ' ~ alpha *
              ' = ' * .(get_alpha(x, model))
          )
        )
    })
    names(plotlist) = get_classifier(x, model) %>% 
      idify() %>% 
      get_data() %>% 
      pull(id) %>% 
      unique()
    return(plotlist)
  })
  names(plotmodels) = models_avail(x)
  for(model in names(plotmodels)) {
    x$classifier[[model]]$plot_test = plotmodels[[model]]
  }
  return(x)
}


