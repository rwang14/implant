#source("MAP.R")
EM = function (X,Y,Z,mu,sigma,k,em_iter,map_iter,beta,epsilon_em,epsilon_map) {
  m = nrow(Y)
  n = ncol(Y)
  y = vec(Y)
  ply = matrix(NA,nrow = k,ncol = m*n)
  sum_U = matrix(NA,1,em_iter)

  for (t in 1:em_iter){
    #x = vec(MAP(X,Y,Z,mu,sigma,k,map_iter,sp = 0)$X)
    #sum_U = MAP(X,Y,Z,mu, sigma, k, map_iter, sp = 0)$sum_U

    map = MAP(X,Y,Z,mu,sigma,k,map_iter,epsilon_map,beta,sp = 0)
    X = map$X
    #matrix(as.numeric(map$X),nrow = 600, ncol = 338)
    x = vec(matrix(data = as.numeric(X), nrow = nrow(X), ncol = col(X)))
    sum_U[t] = map$sum_U

    # P(l|y_i)
    for (l in 1:k){
      term1 = 1/sqrt(2*pi*sigma[l]^2)*exp(-(y-mu[l])^2/(2*(sigma[l]^2)))
      term2 = term1%*%0
      for (index in 1:(m*n)) {
        i = ij(index,m)[1]
        j = ij(index,m)[2]

        u = 0
        if ( ((i-1)>=1) && (Z[i-1,j] == 0)){
          u = u+(l!=X[i-1,j])
        }
        if (((i+1) <=m) && (Z[i+1,j] == 0)){
          u = u+(l!=X[i+1,j])
        }
        if (((j-1)>=1) && (Z[i,j-1] == 0)){
          u = u+(l!=X[i,j-1])
        }
        if (((j+1)<= n) && (Z[i,j+1] == 0)){
          u = u+(l!=X[i,j+1])
        }

        #Sigma(V_c)
        term2[index] = u
      }
      #Calculate the numerator of P(l|y_i)
      ply[l,] = term1*(1/(1+exp(-1*beta*(4-2*term2))))
    }
    #Calculate the denominator of P(l|y_i)
    term3 = colSums(ply)
    #Calculate P(l|y_i)=num/denom
    ply = ply/term3

    #update the parameters for mu and sigma
    for (l in 1:k) {
      mu[l] = ply[l,]%*%y
      mu[l] = mu[l]/sum(ply[l,])
      sigma[l] = ply[l,]%*%((y-mu[l])^2)
      sigma[l] = sqrt(sigma[l])
    }

    if ((t>=3) && (sd(sum_U[(t-2):t])/sum_U[t] < epsilon_em)) {
      break
    }
  }
  mylist2 = list("X" = X ,"mu" = mu,"sigma" = sigma)
  return (mylist2)
}

