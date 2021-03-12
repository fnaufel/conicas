#' Sorteia equações de tipos especificados, nas quantidades especificadas
#'
#' @param conicas Tibble com dados sobre as cônicas
#' @param n Total de cônicas a escolher
#' @param seed Para gerador de números aleatórios
#' @param tipos Vetor com quantidades de cônicas para cada tipo (nomes são tipos)
#'
#' @return Tibble com as cônicas escolhidas
#' @export
#'
filtrar_conicas <- function(
  conicas,
  n = 48,
  tipos = c(
      'elipse' = n/6,
      'hipérbole' = n/6,
      'parábola' = n/6,
      'paralelas' = n/4,
      'concorrentes' = n/4
  ),
  seed = NULL
) {

  tipos_desejados <- names(tipos)
  qtdes_desejadas <- unname(tipos)

  purrr::map2_dfr(
    qtdes_desejadas,
    tipos_desejados,
    ~sortear_conicas_um_tipo(conicas, .x, .y, seed)
  )

}
