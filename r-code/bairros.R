#BAIRROS (INCOMPLETO)
dados <- read.table(file = "C:/Users/Anne/Desktop/TCC/datasets/dataset.csv", sep = ";", stringsAsFactors = FALSE, header = TRUE)
library(stringi)
dados$Bairro <- toupper(dados$Bairro)
dados$Bairro <- stri_trans_general(dados$Bairro, "Latin-ASCII")
dados$Bairro[grep("TORORA", dados$Bairro, ignore.case = FALSE)] <- "TORORO"

library(xlsx)
renda <- read.xlsx2(file = "C:/Users/Anne/Desktop/TCC/datasets/RPC.xlsx", sheetIndex = 1)
renda <- renda[, -c(2, 3, 4)]
head(renda)

renda$BAIRROS <- toupper(renda$BAIRROS)
renda$BAIRROS <- stri_trans_general(renda$BAIRROS, "Latin-ASCII")
head(renda$BAIRROS)

write(unique(sort(dados$Bairro)), file = "bairrosDados.csv")
write(unique(sort(renda$BAIRROS)), file = "bairrosRPC.csv")

bairrosDados <- read.table(file = "C:/Users/Anne/Desktop/TCC/datasets/bairrosDados.csv", sep = ";")
bairrosRPC <- read.table(file = "C:/Users/Anne/Desktop/TCC/datasets/bairrosRPC.csv", sep = ";")
db <- merge(bairrosRPC, bairrosDados, all = TRUE)

library(plyr)
ddply(db, bairrosDados$V1, numcolwise(sum))

###########################################################

classeC <- renda$BAIRROS[renda$Classe == "C"]
classeC
classeD <- renda$BAIRROS[renda$Classe == "D"]
classeD
classeE <- renda$BAIRROS[renda$Classe == "E"]
head(classeE)

###########################################################