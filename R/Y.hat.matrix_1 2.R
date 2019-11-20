Y.hat.matrix_1 = function(Y_na, Phi, beta.hat){
  Y.hat = Phi %*% beta.hat
  Y.hat.matrix = matrix(NA,nrow = dim(Y_na)[1], ncol = dim(Y_na)[2])
  s = 1
  for ( i in 1: dim(Y_na)[1]){
    for ( j in 1: dim(Y_na)[2]){
      if(!is.na(Y_na[i,j])){
        Y.hat.matrix[i,j] = Y.hat[s]
        s = s+1
      }
      else{
        Y.hat.matrix[i,j] = NA
      }
    }
  }
  return(Y.hat.matrix)
}