#' Formata a equação de uma cônica
#'
#' @param A Coeficiente
#' @param C Coeficiente
#' @param D Coeficiente
#' @param E Coeficiente
#' @param F Coeficiente
#'
#' @return String com a equação
#' @importFrom glue glue
#' @importFrom stringr str_replace_all str_replace
#'
gerar_equacao <- function(A, C, D, E, F) {

  eq <- glue::glue('{A}x^2+{C}y^2+{D}x+{E}y+{F} = 0') %>%
    stringr::str_replace_all('\\+\\-', '-') %>%
    stringr::str_replace_all(
      c(
        '0x\\^2' = '',
        '\\+0y\\^2' = '',
        '\\+0x' = '',
        '\\+0y' = ''
      )
    ) %>%
    stringr::str_replace_all(
      c(
        '1x' = 'x',
        '1y' = 'y'
      )
    ) %>%
    stringr::str_replace('^\\+', '') %>%
    stringr::str_replace('\\+0', '')

  eq

}
