
library(RSelenium)

# open cmd for set the drivers folders.
# run .jar file by cmd
# java -jar selenium-server-standalone-3.2.0.jar -port 4444

# Im use xpath for make click in a element. In the page the xpath change in numbers Result:0:checkValores for select other items.

# Make conection--------------------------------------------------
remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4444, browserName = "chrome")
remDr$open()
Sys.sleep(5)

#
url_data <- "http://www6.sistemaindustria.org.br/gpc/externo/listaResultados.faces?codPesquisa=100"

# load the page
remDr$navigate(url = "http://www6.sistemaindustria.org.br/gpc/externo/listaResultados.faces?codPesquisa=100")


# put click in [Valores] -----------------------------------------------------
Sys.sleep(1)                                                            ###
remDr$findElement(using = 'xpath', "//*[@id='listaResultadoForm:dtResult:0:checkValores']")$clickElement()

# put click in [Valores2] -----------------------------------------------------
Sys.sleep(1)                                                            ###
remDr$findElement(using = 'xpath', "//*[@id='listaResultadoForm:dtResult:1:checkValores']")$clickElement()

# download the select files                                   
Sys.sleep(1)
remDr$findElement(using = 'xpath', "//*[@id='listaResultadoForm:btnExportarExcel2']")$clickElement()

#the files appear in downloads folder.
