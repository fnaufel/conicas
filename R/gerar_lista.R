#' Formata as equações das cônicas
#'
#' @param df Tibble com as cônicas
#' @param num Numerar as equações?
#' @param tex Formatar as equações em LaTeX?
#' @param sep Separador de equações
#'
#' @return String com a lista de equações
#' @export
#' @importFrom glue glue_data
#'
gerar_lista <- function(df, num = TRUE, tex = TRUE, sep = '\n\n') {

  s <- '{eq}'

  if (tex) {
    s <- paste0('$\\quad ', s, '$')
  }

  if (num) {
    s <- paste0('1. ', s)
  }

  df %>%
    glue::glue_data(s) %>%
    paste(collapse = sep)

}
