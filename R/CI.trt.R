#source("~/Desktop/implant/Sigma_epsilon.R")
#source("~/Desktop/implant/Var_bhat.R")
#source("~/Desktop/implant/Y.hat.matrix_1.R")
#source("~/Desktop/implant/function_C.R")
CI.trt = function(fit,L,alpha){
  X = fit$X
  Y_na = fit$Y_na
  total.time = fit$total.time
  K = fit$K
  order = fit$order
  d0 = fit$d0
  Phi = fit$Phi
  beta.hat = fit$bhat
  S = fit$S
  tps = fit$tps
  nf = ncol(Phi)/K
  est_fun = fit$est_fun
  n = dim(fit$Y_na)[1]
  cols = which(L[]!=0)
  ###C###
  for ( i in 1:1){
    C_temp= L[cols[i]]*C(K,nf,cols[i])
  }
  for ( i in 2:length(cols)){
  C_i_mat = L[cols[i]]*C(K,nf,cols[i])
      C_temp = rbind(C_temp,C_i_mat)
  }
  C_array = array(0,dim = c(K,nf*K,length(cols)))
  for ( i in 1:length(cols)){
    C_array[,,i] = C_temp[((i-1)*K+1):(i*K),]
  }
  C = apply(C_array, MARGIN=c(1, 2), sum)
###trt###
  for ( i in 1:1){
    trt_temp= L[cols[i]]*fit$est_fun[,cols[i]]
  }
  for ( i in 2:length(cols)){
    trt_i = L[cols[i]]*est_fun[,cols[i]]
    trt_temp = rbind(trt_temp,trt_i)
  }
  trt = apply(trt_temp, MARGIN = 2, sum)
  Y.hat.matrix = Y.hat.matrix_1(Y_na, Phi, beta.hat)
  Cov = Sigma_epsilon(Y_na,Y.hat.matrix,n)
  Var = Var_bhat(X,tps, total.time, K, order, d0, C,S, Cov)
  c.i.me = qnorm(alpha/2)*sqrt(Var)
  ci.up = trt - c.i.me
  ci.lw = trt + c.i.me
  return(list("trt" = trt,"ub" = ci.up, "lb" = ci.lw, "Cov" = Cov))
}
