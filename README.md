
<!-- README.md is generated from README.Rmd. Please edit that file -->

# conicas

<!-- badges: start -->
<!-- badges: end -->

**conicas** é um pacote em R para gerar equações de cônicas com eixos
paralelos aos eixos cartesianos, na forma geral:

*A**x*<sup>2</sup> + *C**y*<sup>2</sup> + *D**x* + *E**y* + *F* = 0

Eu o desenvolvi para me ajudar a criar listas de exercícios de Geometria
Analítica.

## Instalação

Instale a versão do meu repositório no [GitHub](https://github.com/)
com:

``` r
# install.packages("devtools")
devtools::install_github("fnaufel/conicas")
```

## Exemplo

``` r
library(conicas)
```

-   Para gerar um *data frame* com muitas equações:

    ``` r
    df <- gerar_conicas_df()
    head(df)
    #> # A tibble: 6 x 7
    #>       A     C     D     E     F tipo   eq                    
    #>   <int> <int> <int> <int> <int> <chr>  <chr>                 
    #> 1    -5    -5    -5    -5    -5 vazio  -5x^2-5y^2-5x-5y-5 = 0
    #> 2    -5    -5    -5    -5    -4 vazio  -5x^2-5y^2-5x-5y-4 = 0
    #> 3    -5    -5    -5    -5    -3 vazio  -5x^2-5y^2-5x-5y-3 = 0
    #> 4    -5    -5    -5    -5    -2 elipse -5x^2-5y^2-5x-5y-2 = 0
    #> 5    -5    -5    -5    -5    -1 elipse -5x^2-5y^2-5x-5y-1 = 0
    #> 6    -5    -5    -5    -5     0 elipse -5x^2-5y^2-5x-5y = 0
    ```

-   Use o argumento `faixas` para passar um vetor de coeficientes
    permitidos:

    ``` r
    head(gerar_conicas_df(faixa = c(-1, 3, 5)))
    #> # A tibble: 6 x 7
    #>       A     C     D     E     F tipo   eq                 
    #>   <dbl> <dbl> <dbl> <dbl> <dbl> <chr>  <chr>              
    #> 1    -1    -1    -1    -1    -1 vazio  -x^2-y^2-x-y-1 = 0 
    #> 2    -1    -1    -1    -1     3 elipse -x^2-y^2-x-y+3 = 0 
    #> 3    -1    -1    -1    -1     5 elipse -x^2-y^2-x-y+5 = 0 
    #> 4    -1    -1    -1     3    -1 elipse -x^2-y^2-x+3y-1 = 0
    #> 5    -1    -1    -1     3     3 elipse -x^2-y^2-x+3y+3 = 0
    #> 6    -1    -1    -1     3     5 elipse -x^2-y^2-x+3y+5 = 0
    ```

-   Para sortear, do *data frame* gerado, uma certa quantidade de
    cônicas, de tipos específicos:

    ``` r
    eqs <- filtrar_conicas(
      df, 
      n = 10, 
      tipos = c('elipse' = 4, 'parábola' = 3, 'hipérbole' = 3),
      seed = 123
    )

    eqs
    #> # A tibble: 10 x 7
    #>        A     C     D     E     F tipo      eq                    
    #>    <int> <int> <int> <int> <int> <chr>     <chr>                 
    #>  1    -5    -2     2    -5    -1 elipse    -5x^2-2y^2+2x-5y-1 = 0
    #>  2     2     2    -2     2    -5 elipse    2x^2+2y^2-2x+2y-5 = 0 
    #>  3     2     2    -4    -4     3 elipse    2x^2+2y^2-4x-4y+3 = 0 
    #>  4     3     5     2     5     1 elipse    3x^2+5y^2+2x+5y+1 = 0 
    #>  5    -1     0    -5     4     4 parábola  -x^2-5x+4y+4 = 0      
    #>  6    -1     0    -4     4    -3 parábola  -x^2-4x+4y-3 = 0      
    #>  7     3     0    -3    -3    -4 parábola  3x^2-3x-3y-4 = 0      
    #>  8     3    -1    -3     5    -3 hipérbole 3x^2-y^2-3x+5y-3 = 0  
    #>  9     4    -2     5     2     2 hipérbole 4x^2-2y^2+5x+2y+2 = 0 
    #> 10    -5     3    -3     4    -3 hipérbole -5x^2+3y^2-3x+4y-3 = 0
    ```

    Se quiser que as mesmas cônicas sejam sempre retornadas por esta
    chamada, use um valor específico para `seed`, como acima.

-   Para formatar a lista de equações:

    ``` r
    gerar_lista(eqs)
    #> [1] "1. $\\quad -5x^2-2y^2+2x-5y-1 = 0$\n\n1. $\\quad 2x^2+2y^2-2x+2y-5 = 0$\n\n1. $\\quad 2x^2+2y^2-4x-4y+3 = 0$\n\n1. $\\quad 3x^2+5y^2+2x+5y+1 = 0$\n\n1. $\\quad -x^2-5x+4y+4 = 0$\n\n1. $\\quad -x^2-4x+4y-3 = 0$\n\n1. $\\quad 3x^2-3x-3y-4 = 0$\n\n1. $\\quad 3x^2-y^2-3x+5y-3 = 0$\n\n1. $\\quad 4x^2-2y^2+5x+2y+2 = 0$\n\n1. $\\quad -5x^2+3y^2-3x+4y-3 = 0$"
    ```

    Se quiser incluir as equações em um documento RMarkdown, use a opção
    `results = 'asis'` no *chunk* acima.

-   Veja a documentação da função `gerar_lista` para outras opções de
    formatação (sem numeração, sem LaTeX, com outros separadores).

-   Eis um exemplo de uma lista de exercícios gerada com este pacote.
    Clique na imagem para visitar o site:

[![](eqs.png)](https://fnaufel.github.io/static/GA/2020.2-lista1.html)
