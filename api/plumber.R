#
# This is a Plumber API. You can run the API by clicking
# the 'Run API' button above.
#
# Find out more about building APIs with Plumber here:
#
#    https://www.rplumber.io/
#

library(plumber)
library(rmarkdown)

#' @apiTitle Plumber Example API

#* Listado de funciones disponibles
#* @get /
#' @html
function(){
  "<html>
    <h1>Listado de Métodos Disponibles:</h1>
    <ul>
      <li><strong>/echo?msg='mensaje'</strong> - Repetir mensaje entre comillas</li>
      <li><strong>/plot</strong> - Graficar histograma</li>
      <li><strong>/sum?a=1&b=2</strong> - Sumar dos números</li>
      <li><strong>/html?stock=BYMA.BA</strong> - Informe en HTML</li>
      <li><strong>/pdf?stock=BYMA.BA</strong> - Informe en PDF</li>
    </ul>
  </html>"
}

#* Repetir el Mensaje entre comillas
#* @get /echo
#' @param msg:character Mensaje
function(msg = "") {
    list(msg = paste0("El mensaje es: '", msg, "'"))
}

#* Graficar histograma
#* @get /plot
#' @png
function() {
    rand <- rnorm(100)
    hist(rand)
}

#* Devuelve la suma de dos numeros
#* @get /sum
#' @param a:numeric El primer numero
#' @param b:numeric El segundo numero
function(a, b) {
    as.numeric(a) + as.numeric(b)
}


#* Informe en PDF
#* @get /pdf
#' @serializer contentType list(type="application/pdf; charset=utf-8")
#' @param stock:character  Ticker obtenido desde Yahoo Finance
function(res, stock="BTC-USD"){
  temp <- tempfile(fileext = ".pdf")
  rmarkdown::render("InformePDF.Rmd", 
                    output_file = temp,
                    output_format = NULL,
                    params = list(stock = stock))
  readBin(temp,'raw', n = file.info(temp)$size)
}

#* Informe en HTML
#* @get /html
#' @serializer contentType list(type="application/html; charset=utf-8")
#' @param stock:character Ticker obtenido desde Yahoo Finance
function(res, stock="BTC-USD"){
  f <- rmarkdown::render("InformeHTML.Rmd", 
                         output_format = NULL,
                         params = list(stock = stock))
  include_html(f, res)
}

