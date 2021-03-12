#' Gera uma tibble com coeficientes de cônicas não rotacionadas
#'
#' As colunas da tibble gerada são
#' * Os coeficientes de
#'   * x^2 (`A`),
#'   * y^2 (`C`),
#'   * x (`D`),
#'   * y (`E`),
#' * O termo independente (`F`)
#' * O tipo de cônica (`tipo`): vazio, elipse, ponto, paralelas, parábola, reta, hipérbole, ou concorrentes
#' * A equação como um string em LaTeX, sem "$" (`eq`)
#'
#' @param faixa Vetor com valores permitidos para os coeficientes
#'
#' @return Tibble
#' @export
#'
#' @importFrom magrittr %>%
#'
gerar_conicas_df <- function(faixa = -5:5) {

  tidyr::expand_grid(
    A = faixa,
    C = faixa,
    D = faixa,
    E = faixa,
    F = faixa
  ) %>%
    dplyr::filter(A != 0 | C != 0) %>%
    classificar() %>%
    dplyr::mutate(eq = gerar_equacao(A, C, D, E, F))

}
