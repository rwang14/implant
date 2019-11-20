#library(MASS)
#library(fda)
#source("~/Desktop/implant/input.list.R")
fanova_mean = function(Y.na.mat, X, tt, formula, K.int = 6, order = 4,
                       #interact = 0, #p = 2,
                       d0 = 0, d1 = 2, d2 = 2, lower = -10, upper = 15){

  data.time = rbind(tt,Y.na.mat)
  T_na = Y.na.mat
  for ( i in 1:dim(Y.na.mat)[1]){
    for (j in 1:dim(Y.na.mat)[2]){
      if(is.na(Y.na.mat[i,j])){
        T_na[i,j] = NA
      }
      else{
        T_na[i,j] = data.time[1,j]
      }
    }
  }


  Y = input.list(data = Y.na.mat, Time_na = as.matrix(T_na), p = 0)$Y

  T = input.list(data = Y.na.mat, Time_na = as.matrix(T_na), p = 0)$T

  Y.vec = Reduce(c,Y)

  T.vec = Reduce(c,T)

  n = length(Y)

  #tt = sort(as.numeric(unique(T.vec)))
  #J = length(tt)	# number of time points
  ### basis functions ###
  order = order # In default, order = 4, cubic splines, for second derivative, using order 6 rather than 4
  total.time = max(tt)
  knots = total.time*(1:K.int)/(1+K.int)
  # K is the number of basis functions in a spline basis system
  K = length(knots) + order # number of basis functions
  basis = create.bspline.basis(c(0,total.time), K, norder = order)

  #design_matrix = NULL
  #if (interact == 1) {
   # design_matrix = model.matrix(as.formula(paste("~.^", p, sep='')), data = X)
 # }
  #if (interact == 0){
    design_matrix = model.matrix(as.formula(formula), data = X)
  #}
  ## evaluate original, the first, and second derivatives of basis functions ##
  #dimension of BS is the length of tt by K
  #BS = eval.basis(tt,basis,d0)
  ## penalty matrix ###
  Omega = inprod(basis,basis,d1,d2)	# for second derivative, using 4 rather than 2, 2 means the original function

  ### Design matrix ###
  # if(regular == 1)
  #{
  #dimension of BS is the length of tt by K, i.e. just one dummy variable, r1
  # BS = eval.basis(tt,basis,d0)
  #Xmat = design_matrix %x% BS
  #}

  #if(regular == 0){
  BS = eval.basis(T[[1]],basis,d0)
  for ( i in 2: n ){
    BSnew = eval.basis(T[[i]],basis,d0)
    BS = rbind(BS,BSnew)
  }
  ###############
  nf = ncol(design_matrix)
  if( nf == 1) {
    BSmat = BS
  }
  if( nf > 1){
    BSmat = BS
    for ( i in 2: nf){
      BSnew1 = BS

      BSmat = cbind(BSmat,BSnew1)
    }
  }
  #####Construct the design_matrix
  m = matrix(NA, nrow = n , ncol = 1)
  for ( i in 1: n){
    m[i] = length(as.numeric(T[[i]]))
  }

  des_X = matrix(NA, nrow = nrow(BSmat), ncol = ncol(BSmat))
  for(j in 1:ncol(design_matrix)){
    for ( i in 1:1){
      des_X[(1:m[i]),((j-1)*K+1):((j-1)*K+1):(j*K)] = design_matrix[i,j]
    }
    for ( i in 2:nrow(design_matrix)){
      des_X[(1:m[i]),(1:K)] = design_matrix[i,1]
      des_X[(sum(m[1:(i-1)])+1):(sum(m[1:i])),((j-1)*K+1):(j*K)] = design_matrix[i,j]
    }
  }

  Xmat = des_X * BSmat
  #}
  ### Penalized least squares estimates ###
  tuning_nointer = function(lower, upper, Omega, Xmat, Y.vec){
    lam.list=exp(seq(lower,upper,1))
    gcv=rep(0,length(lam.list))
    for(ii in 1:length(lam.list)){
      Omega_lam = matrix(0, nrow = ncol(design_matrix)*nrow(Omega),ncol = ncol(design_matrix)*ncol(Omega))
      for ( i in 1: ncol(design_matrix)){
        Omega_lam[((1+(i-1)*dim(Omega)[1]):(i*dim(Omega)[1])),((1+(i-1)*dim(Omega)[2]):(i*dim(Omega)[2]))] = Omega*lam.list[ii]
      }
      #A <- solve(t(Xmat) %*% Xmat + Omega_lam)
      A <- solve(t(Xmat) %*% Xmat + Omega_lam)
      Y.vec.hat <- (Xmat%*%A) %*% (t(Xmat)%*%Y.vec)
      diag.mean <- sum(diag(t(Xmat)%*%Xmat%*%A))/(dim(Xmat)[1])
      gcv[ii] <- mean((Y.vec-Y.vec.hat)^2)/(1-diag.mean)^2
    }
    ind=which(gcv == min(gcv))
    lam.list[ind]
  }
  #Find the tunning parameter lambda
  lam = tuning_nointer(lower,upper,Omega,Xmat,Y.vec)
  #Using lam to define the matrix adiag(Omega*lambda)
  Omegabylam = matrix(0, nrow = ncol(design_matrix)*nrow(Omega),ncol = ncol(design_matrix)*ncol(Omega))
  for ( i in 1: ncol(design_matrix)){
    Omegabylam[((1+(i-1)*dim(Omega)[1]):(i*dim(Omega)[1])),((1+(i-1)*dim(Omega)[2]):(i*dim(Omega)[2]))] = Omega*lam
  }
  #bhat = solve(t(Xmat)%*%Xmat+Omegabylam)%*%t(Xmat)%*%Y.vec
  bhat = solve(t(Xmat)%*%Xmat+Omegabylam)%*%t(Xmat)%*%Y.vec
  #S = solve(t(Xmat)%*%Xmat+Omegabylam)%*%t(Xmat)
  S = solve(t(Xmat)%*%Xmat+Omegabylam)%*%t(Xmat)
  ########### estimated curve ###########
  BS = eval.basis(tt,basis,d0)
  m = length(tt)
  #para is the matrix of new_Phi(with t time points) by the betahat of each variable, each column is a t*1 vector
  para = matrix(0,nrow = m,ncol = ncol(design_matrix))
  for ( i in 1:ncol(design_matrix)){
    para[,i] = BS %*% bhat[((i-1)*K+1):((i-1)*K+K)]
  }
  #return the matrix of estimated mean functions
  return(list(est_fun = para,lambda = lam, bhat = bhat, S = S, Phi = Xmat,
              order = order, K = K, total.time = total.time, tps = tt, X = X, Y_na = Y.na.mat, formula = formula,
              d0 = d0, d1 = d1, d2 = d2 ))
}
