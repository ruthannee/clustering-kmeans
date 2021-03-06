dataset <- read.table(file = "C:/Users/Anne/Desktop/TCC/datasets/datasetPronto.csv", sep = ";", stringsAsFactors = FALSE, header = TRUE)
dataset <- dataset[,-c(1,7)] #BAIRRO E CURSO_UCSAL
#N�O � NECESS�RIO A COLUNA DE BAIRROS, VISTO QUE J� FORAM CLASSIFICADOS NO ATRIBUTO "CLASSE"

renomear <- c("sexo", "faixa_etaria", "estado_nasc", "estado_civil", "cidade_nasc", "inst_origem", "classe_bairro")
names(dataset) <-  renomear

barplot(table(dataset$sexo), col=c("blue","red"), space=0.2, width=c(0.2,0.2),
        main="Sexo",
        xlab="G�neros", ylab="N� de Pessoas") 

barplot(table(dataset$faixa_etaria), col=c("blue","red", "yellow", "green", "black"), space=0.2, width=c(0.2,0.2),
        main="Faixa et�ria",
        xlab="Faixas et�rias", ylab="N� de Pessoas") 
#####

pie(table(dataset$sexo),col=c("lightblue","lightpink"),
    main="Gr�fico de g�neros: sexo")
text(locator(n=1),
     paste(round(prop.table(table(dataset$sexo))[1],
                 digits=2)*100,"%"))
text(locator(n=1),
     paste(round(prop.table(table(dataset$sexo))[2],
                 digits=2)*100,"%"))

#########################
#PLOTAGEM USADA NO TCC
barplot(table(k$size),
        height = c(17, 75, 211),
        col=c("cyan2", "deepskyblue3", "steelblue4"),
        main="Clusters",
        ylab="Inst�ncias",
        ylim = c(0, 303), legend.text = c("17", "75", "211"),
        names.arg=c("Grupo 1", "Grupo 2", "Grupo 3"))