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
