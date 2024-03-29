% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/filtrar_conicas.R
\name{filtrar_conicas}
\alias{filtrar_conicas}
\title{Sorteia equações de tipos especificados, nas quantidades especificadas}
\usage{
filtrar_conicas(
  conicas,
  n = 48,
  tipos = c(elipse = ceiling(n/6), hipérbole = ceiling(n/6), parábola = ceiling(n/6),
    paralelas = ceiling(n/4), concorrentes = ceiling(n/4)),
  seed = NULL
)
}
\arguments{
\item{conicas}{Tibble com dados sobre as cônicas}

\item{n}{Total de cônicas a escolher}

\item{tipos}{Vetor com quantidades de cônicas para cada tipo (nomes são tipos)}

\item{seed}{Para gerador de números aleatórios}
}
\value{
Tibble com as cônicas escolhidas
}
\description{
Sorteia equações de tipos especificados, nas quantidades especificadas
}
