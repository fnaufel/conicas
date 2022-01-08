#' Sorteia equações de tipos especificados, nas quantidades especificadas
#'
#' @param conicas Tibble com dados sobre as cônicas
#' @param n Total de cônicas a escolher
#' @param seed Para gerador de números aleatórios
#' @param tipos Vetor com quantidades de cônicas para cada tipo (nomes são tipos)
#'
#' @return Tibble com as cônicas escolhidas
#' @importFrom purrr map2_dfr
#' @importFrom dplyr slice_head
#' @export
#'
filtrar_conicas <- function(
  conicas,
  n = 48,
  tipos = c(
      'elipse' = ceiling(n/6),
      'hipérbole' = ceiling(n/6),
      'parábola' = ceiling(n/6),
      'paralelas' = ceiling(n/4),
      'concorrentes' = ceiling(n/4)
  ),
  seed = NULL
) {

  tipos_desejados <- names(tipos)
  qtdes_desejadas <- unname(tipos)

  purrr::map2_dfr(
    qtdes_desejadas,
    tipos_desejados,
    ~sortear_conicas_um_tipo(conicas, .x, .y, seed)
  ) %>%
    dplyr::slice_head(n = n)

}
