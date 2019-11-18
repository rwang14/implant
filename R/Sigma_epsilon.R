#source("~/Desktop/implant/Sigma_i.R")
Sigma_epsilon = function(Y_na,Y.hat.matrix,n){
  m = matrix(NA, nrow = nrow(Y_na) , ncol = 1)
  for ( i in 1: n){
    m[i] = length(which(!is.na(Y_na[i,])))
  }
  Sigma = matrix(0, nrow = sum(m[]), ncol = sum(m[]))
  for ( i in 1:1){
    Sigma[(1:m[i]),(1:m[i])] = Sigma_i(i,Y_na,Y.hat.matrix)
  }
  for ( i in 2:nrow(m)){
    Sigma[(sum(m[1:(i-1)])+1):sum(m[1:i]),(sum(m[1:(i-1)])+1):sum(m[1:i])] = Sigma_i(i,Y_na,Y.hat.matrix)
  }
  return(Sigma)
}

