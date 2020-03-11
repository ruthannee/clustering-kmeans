dataset <- read.table(file = "C:/Users/Anne/Desktop/TCC/datasets/datasetPronto.csv", sep = ";", stringsAsFactors = FALSE, header = TRUE)
dataset <- dataset[,-c(1,7)] #BAIRRO E CURSO_GRADUACAO

renomear <- c("sexo", "faixa_etaria", "estado_nasc", "estado_civil", "cidade_nasc", "inst_origem", "classe_bairro")
names(dataset) <-  renomear

funcao <- function(dados, dataset, coluna){
  for(i in 1:length(dados)){
    dataset[which(dataset[,coluna]==dados[i]),coluna]<-i
  }
  dataset
}
funcao2 <- function(dataset){
  for(i in 1:ncol(dataset)){
    dados <- unique(sort(dataset[,i]))
    dataset <- funcao(dados,dataset,i)
  }
  dataset
}
convert_to_integer <- function(dataset){
  for(i in 1:ncol(dataset)){
    dataset[,i] <- as.numeric(dataset[,i])
  }
  dataset
}

dataset <- funcao2(dataset)
dataset <- convert_to_integer(dataset)

unique(dataset[,1])
unique(dataset[,2])
unique(dataset[,3])
unique(dataset[,4])
unique(dataset[,5])
unique(dataset[,6])
unique(dataset[,7])

#VALIDAÇÃO DE AGRUPAMENTO (SILHUETA, DUNN, CONECTIVIDADE)
library("clValid")
clMethods = c("hierachical", "kmeans", "model", "sota", "clara")
intern <- clValid(dataset, nClust = 2:4, clMethods = clMethods, validation = "internal", maxitems = 303,  metric = "euclidean")
summary(intern)
windows()
plot(intern, main = "Teste de Silhueta")

#CALINSKI-HARABASZ
library("fpc")
library(factoextra)
library(ggplot2)

k <- kmeans(dataset, 3, iter.max=1000) #3 teve o maior CH
indice <- calinhara(dataset, k$cluster)
indice
fviz_cluster(k, data = dataset, geom = "point",show.clust.cent = TRUE, ellipse.type = "norm", main = "Cluster plot", ggtheme = theme_bw(), stand = FALSE)
#+stat_ellipse()

k$size
k$centers
k$cluster