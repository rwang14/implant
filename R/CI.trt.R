#source("~/Desktop/implant/Sigma_epsilon.R")
#source("~/Desktop/implant/Var_bhat.R")
#source("~/Desktop/implant/Y.hat.matrix_1.R")
#source("~/Desktop/implant/function_C.R")
#library(fda)

CI.trt.diff = function(fit, j1,j2,alpha){
  if (j1 == j2){
    stop('j1 should be different from j2')
  }
  if (j1 != j2){
 # X,Y_na,trt,tps, total.time, K, order, d0, Phi, beta.hat, j1,j2, S, alpha){
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
  n = dim(fit$Y_na)[1]
  C1 = C(K,nf,j1)
  if (j2 == 1){
    C2 = 0
    trt = fit$est_fun[,j1]
  }
  else{
    C2 = C(K,nf,j2)
    trt = fit$est_fun[,j1]-fit$est_fun[,j2]
  }
  C = C1-C2
  }
  Y.hat.matrix = Y.hat.matrix_1(Y_na, Phi, beta.hat)
  Cov = Sigma_epsilon(Y_na,Y.hat.matrix,n)
  Var = Var_bhat(X,tps, total.time, K, order, d0, C,S, Cov)
  c.i.me = qnorm(alpha/2)*sqrt(Var)
  ci.up = trt - c.i.me
  ci.lw = trt + c.i.me
  return(list("trt" =  trt, "ub" = ci.up, "lb" = ci.lw))
}


#ci = CI.trt(X,Y_na,Y.hat.matrix, trt = b2, tps = as.vector(sort(unique(T.vec))),total.time = 60,
 #K = 10, order = 4,d0 = 0, C = C2,S = S, alpha = 0.05)

#plot(x = tt, y = b2, type = "l")
#lines(x = tt, y = ci$ub, type = "l", col = "red")
#lines(x = tt, y = ci$lb, type = "l", col = "blue")
