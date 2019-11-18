C = function(K,nf,j){
  Cmat = matrix(0,nrow = K, ncol = nf*K)
  for ( i in 1:K){
    Cmat[i,(j-1)*K+i] = 1
  }
  return(Cmat)
}