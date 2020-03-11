#LIMPEZA DOS BAIRROS
dados <- read.table(file = "C:/Users/Anne/Desktop/TCC/datasets/datasetOK.csv", sep = ";", stringsAsFactors = FALSE, header = TRUE)

library(stringi)
dados$Bairro <- toupper(dados$Bairro)
dados$Bairro <- stri_trans_general(dados$Bairro, "Latin-ASCII")

library(xlsx)
classes <- read.table(file = "C:/Users/Anne/Desktop/TCC/datasets/RPC.csv",sep=";",header = TRUE, stringsAsFactors = FALSE)
classes$BAIRROS <- toupper(classes$BAIRROS)
classes$BAIRROS <- stri_trans_general(classes$BAIRROS, "Latin-ASCII")
head(classes)

a <- merge(dados, classes, by.x = "Bairro", by.y = "BAIRROS",  all = TRUE)

vetorNI <- c("ARACATIBA", "BRASILIA", "BOM DESPACHO", "CAJI", "CAMACARI", "CAMACARI DE DENTRO", "CANDEIAS", "CATU DE ABRANTES", "CIA", "DOIS DE JULHO", "GLEBA C", "GLEBA E", "JOCKEI CLUB", "LAURO DE FREITAS", "MACHADO", "PEDRA ALTA", "PIACAVEIRA", "PITANGA", "PITANGUEIRAS", "POLITEAMA", "RECANTO DOS PASSAROS", "RIACHINHO", "RUA OSCAR PINHEIRO", "SAO JOSE", "SIEIRO", "SIMOES FILHO", "TAPIRAIPE")
a$Classe[grep(paste(vetorNI, collapse = "|"), a$Bairro, ignore.case = TRUE)] <- "CNI" #CNI = Classe Não Identificada

a <- na.omit(a)

write.table(a, file="datasetPronto.csv", sep=";", row.names = FALSE)
#row.names está eliminando a coluna de IDs