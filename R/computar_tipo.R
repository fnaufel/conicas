#' Computa o tipo de uma cônica
#'
#' Tipos:
#' * concorrentes
#' * elipse
#' * hipérbole
#' * paralelas
#' * parábola
#' * ponto
#' * reta
#' * vazio
#'
#' @param A Coeficiente
#' @param C Coeficiente
#' @param D Coeficiente
#' @param E Coeficiente
#' @param F Coeficiente
#' @param lambda lambda
#' @param mu1 mu1
#' @param mu2 mu2
#'
#' @return String com tipo da cônica
#'
computar_tipo <- function(A, C, D, E, F, lambda, mu1, mu2) {

  if (A * C > 0) {
    if (A * lambda > 0) {
      retval <- 'elipse'
    } else if (lambda == 0) {
      retval <- 'ponto'
    }
    else {
      retval <- 'vazio'
    }
  }

  if (A * C < 0) {
    if (A * lambda != 0) {
      retval <- 'hipérbole'
    } else if (lambda == 0) {
      retval <- 'concorrentes'
    }
  }

  if (A != 0 & C == 0) {
    if (A * E < 0) {
      retval <- 'parábola'
    } else if (A * E > 0) {
      retval <- 'vazio'
    } else {
      if (A * mu1 >= 0) {
        if (4 * F == D^2) {
          retval <- 'reta'
        } else {
          retval <- 'paralelas'
        }
      } else {
        retval <- 'vazio'
      }
    }
  }

  if (A == 0 & C != 0) {
    if (C * D < 0) {
      retval <- 'parábola'
    } else if (C * D > 0) {
      retval <- 'vazio'
    } else {
      if (C * mu2 >= 0) {
        if (4 * F == E^2) {
          retval <- 'reta'
        } else {
          retval <- 'paralelas'
        }
      } else {
        retval <- 'vazio'
      }
    }
  }

  retval

}
