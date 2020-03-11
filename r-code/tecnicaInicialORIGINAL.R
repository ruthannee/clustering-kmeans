install.packages("xlsx")
library(xlsx)

dados <- read.xlsx(file = "C:/Users/Anne/Desktop/TCC/datasets/dadosAlunosTI.xlsx", sheetIndex = 1)
head(dados)

#DELETANDO VARIAVEIS
dados <- dados[,-c(1, 4, 6, 8:15, 18:19, 22:23)]
head(dados)

#SEXO
levels(dados$Sexo)
levels(dados$Sexo) <- c("FEMININO", "MASCULINO")
head(dados$Sexo)
head(dados$Sexo[26])

#IDADE
install.packages("lubridate")
library(lubridate)

nasc <- as.Date(dados$Data.Nascimento, format("%d/%m/%Y"))
head(nasc)
anoSO <- year(Sys.Date()) #ano atual (do SO)
anoSO

anoNascimento <- year(nasc)
head(anoNascimento)
idade <- (anoNascimento - anoSO) * (-1)
head(idade)

dados$Data.Nascimento <- idade

dados$Data.Nascimento[idade >= 15 & idade <= 19]<- "Entre 15 a 19 anos"
dados$Data.Nascimento[idade >= 20 & idade <= 24]<- "Entre 20 a 24 anos"
dados$Data.Nascimento[idade >= 25 & idade <= 29]<- "Entre 25 a 29 anos"
dados$Data.Nascimento[idade >= 30 & idade <= 34]<- "Entre 30 a 34 anos"
dados$Data.Nascimento[idade > 34]<- "Acima de 34 anos"

head(dados$Data.Nascimento)

############################################################
#INSTITUIÇÕES DE ENSINO
is.factor(dados$ESCOLA.DE.Origem)
dados$ESCOLA.DE.Origem <- as.character(dados$ESCOLA.DE.Origem)

dados$ESCOLA.DE.Origem[is.na(dados$ESCOLA.DE.Origem)] <- "NAO INFORMADO"

vetorNI <- c(0, "OUTRA ESCOLA", "OUTROS", "ENEM")
dados$ESCOLA.DE.Origem[grep(paste(vetorNI,collapse="|"), dados$ESCOLA.DE.Origem, ignore.case = TRUE)] <- "NAO INFORMADO"

vetorPB <- c("ESTADUAL", "POLICIA", "MUNICIPAL", "FEDERAL", "IFBA", "CARONINI", "MODELO", "POLIVALENTE", "MILITAR", "GASTAO", "ISAIAS ALVES", "BALBINO", "MODELO", "HUMBERTO DE CAMPOS", "LUIZ PINTO DE CARVALHO", "DE NAZARE", "PEDRA ALTA")
dados$ESCOLA.DE.Origem[grep(paste(vetorPB,collapse="|"), dados$ESCOLA.DE.Origem, ignore.case = TRUE)] <- "PUBLICA"

vetorPT <- c("APOGEU", "INTEGRAL", "SACRAMENTINAS", "SALESIANO", "SARTRE", "COC", "MARISTA", "IMPACTO", "CANDIDO", "ADVENTISTA", "EDUCANDARIO", "OLIVEIRA BRITO", "SAO", "NOSSA", "COMTE", "LINCE", "CEP", "COLEGIO DA CIDADE", "ACADEMICO IV", "INSTITUTO SOC", "INIVERSICO", "TECNICA ELETROMECANICA", "ELETRO-MECANICA DA BAHIA", "CALMON", "OMEGA", "SESI", "VERSAILLES", "GUADALUPE", "DARCI", "DRUMMOND", "ANTONIO VIEIRA", "DIRECAO", "DOM JOSE THOMAZ", "DA CIDADE", "SAGRADO", "CASTRO ALVES", "VITORIA-REGIA", "LUZ DO SABER", "RECANTO VERDE", "OFICINA", "SANTO ANTONIO DE JESUS", "AGUIA", "ANANDA", "CENTRO EDUCACIONAL PARAI", "ANA TERESA")
dados$ESCOLA.DE.Origem[grep(paste(vetorPT,collapse="|"), dados$ESCOLA.DE.Origem, ignore.case = TRUE)] <- "PRIVADA"

###########################################################
#BAIRROS (INCOMPLETO)
library(stringi)
dados$Bairro <- toupper(dados$Bairro)
dados$Bairro <- stri_trans_general(dados$Bairro, "Latin-ASCII")
dados$Bairro[grep("TORORA", dados$Bairro, ignore.case = FALSE)] <- "TORORO"

###########################################################
#CIDADES DE NASCIMENTO
dados$Cidade <- toupper(dados$Cidade)
dados$Cidade <- stri_trans_general(dados$Cidade, "Latin-ASCII")
unique(dados$Cidade)

vetorCI <- c("SALVADOR", "LAURO DE FREITAS")
dados$Cidade[!dados$Cidade %in% vetorCI]<- "OUTRAS CIDADES"

###########################################################
#ESTADO CIVIL
dados$Estado_civil <- stri_trans_general(dados$Estado_civil, "Latin-ASCII")

dados$Estado_civil[dados$Estado_civil == "SOLTEIRA"]<- "SOLTEIRO"
dados$Estado_civil[dados$Estado_civil == "CASADA"]<- "CASADO"

unique(dados$Estado_civil)

###########################################################
#CURSO
unique(dados$Curso_UCSAL)
dados$Curso_UCSAL <- stri_trans_general(dados$Curso_UCSAL, "Latin-ASCII")
dados$Curso_UCSAL[grep("ANALISE", dados$Curso_UCSAL, ignore.case = TRUE)] <- "ADS"
dados$Curso_UCSAL[grep("ENGENHARIA", dados$Curso_UCSAL, ignore.case = TRUE)] <- "BES"
dados$Curso_UCSAL[grep("SISTEMAS", dados$Curso_UCSAL, ignore.case = TRUE)] <- "SI"

###########################################################
#BAIRROS
#comparar as planilhas e limpar os dados
write(unique(sort(dados$Bairro)), file = "bairrosDados.csv")
write(unique(sort(renda$BAIRROS)), file = "bairrosRPC.csv")

bairrosDados <- read.table(file = "C:/Users/Anne/Desktop/TCC/bairrosDados.csv", sep = ";")
bairrosRPC <- read.table(file = "C:/Users/Anne/Desktop/TCC/bairrosRPC.csv", sep = ";")
datasets <- merge(bairrosDados, bairrosRPC)
###

write.table(dados, file="dataset.csv", sep=";", row.names = FALSE)