#' Acrescenta coluna com os tipos das cônicas
#'
#' @param coefs Tibble com 5 colunas: `A`, `C`, `D`, `E`, `F`
#'
#' @return Tibble original, com coluna `tipo` adicionada
#'
classificar <- function(coefs) {

  coefs %>%
    dplyr::mutate(
      lambda = D^2 / (4 * A) + E^2 / (4 * C) - F,
      mu1 = D^2 / (4 * A) - F,
      mu2 = D^2 / (4 * C) - F
    ) %>%
    dplyr::mutate(
      tipo = ''
    ) %>%
    dplyr::rowwise(everything()) %>%
    dplyr::mutate(
      tipo = computar_tipo(A, C, D, E, F, lambda, mu1, mu2)
    ) %>%
    dplyr::summarise(.groups = 'drop') %>%
    dplyr::select(!c(lambda, mu1, mu2))

}

