#' Sorteia linhas (de um determinado tipo) da tibble de cônicas
#'
#' @param df Tibble de cônicas
#' @param n_itens Qtde de linhas a sortear
#' @param tipo_desejado Tipo desejado
#' @param seed Para gerador de números aleatórios
#'
#' @return Tibble com linhas sorteadas
#' @importFrom dplyr filter slice_sample
#'
sortear_conicas_um_tipo <- function(df, n_itens, tipo_desejado, seed = NULL) {

  if (!is.null(seed)) set.seed(seed)

  n_itens <- ceiling(n_itens)

  df %>%
    dplyr::filter(tipo == tipo_desejado) %>%
    dplyr::slice_sample(n = n_itens)

}
