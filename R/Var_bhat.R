Var_bhat = function(X,tps, total.time, K, order, d0, C,S, Cov){
  #The dimension of the Phi should depend on the number of time points you are interested in, so self-defined?
  nf_col = matrix(NA, nrow = 1 , ncol = ncol(X) )
  for ( j in 1: ncol(X)){
    nf_col[,j] = length(unique(X[,j]))-1
  }
  #nf is the number of dummy variables
  nf = sum(nf_col) + 1
  basis = create.bspline.basis(c(0,total.time), K, norder = order)
  BS = eval.basis(tps,basis,d0)
  Var_mat = BS%*% C %*% S %*% Cov %*% t(S) %*% t(C) %*% t(BS)
  Var = diag(Var_mat)
  return(Var)
}
