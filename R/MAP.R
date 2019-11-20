#setwd("/Users/ronghaowang/implant/R")
#library(matrixcalc)
#ij conversion
 #ij = function(index,m){
  #i = (index-1) %% m + 1
 #j = floor((index-1)/m) + 1
 #return (c(i,j))
#}
### MAP Estimation ###
MAP = function(X,Y,Z,mu,sigma,k,map_iter,epsilon_map,beta,sp){
  #Size of Y
  m = nrow(Y)
  n = ncol(Y)
  #vectorization of X & Y
  x = vec(X)
  y = vec(Y)
  U = matrix(0, nrow = m*n, ncol = k)
  sumUmap = matrix(0, nrow = 1, ncol = map_iter)
  for (t in 1: map_iter){
    U1 = U
    U2 = U

    for (l in 1:k){
      yi = y-mu[l]
      term1 = yi*yi/(2*(sigma[l]^2))
      term2 = term1 + log(sigma[l])
      U1[,l] = U1[,l] + term1


    for (index in 1:(m*n)){
      i = ij(index,m)[1]
      j = ij(index,m)[2]
      u2 = 0
      if ((i-1>=1) && (Z[i-1,j] == 0)){
        u2 = u2+(l!=X[i-1,j])/beta
      }
      if((i+1<=m) && (Z[i+1,j] == 0 ) ){
        u2 = u2+(l!=X[i+1,j])/beta
      }
       if( (j-1>=1) && (Z[i,j-1] == 0 )){
         u2 = u2+(l!=X[i,j-1])/beta
       }
       if ( (j+1<=n) && (Z[i,j+1] == 0)){
         u2 = u2+(l!=X[i,j+1])/beta
       }
      U2[index,l] = u2
    }
  }
   U = U1 + U2
  #temp=t(apply(U,1,min))
   temp = apply(U,1,min)
   #temp = matrix(temp, nrow = m*n, ncol = 1)
  #The location of min values for each row
  #x=t(apply(U,1,which.min))
   x = apply(U,1,which.min)
   X = matrix(x, nrow = m, ncol = n, byrow = FALSE)
  sumUmap[t] = sum(temp)

   if ((t >= 3) && (sd(sumUmap[(t-2):t])/sumUmap[t] < epsilon_map)){
        break
   }
  }

 sum_U = 0
 for ( index in 1:(m*n)){
   sum_U = sum_U + U[index,x[index]]
 }
  if (sp == 1){
    plot = plot(1:t,sumUmap[1:t],col = "red",main = "sumUmap",xlab = 'MAP iteration',
         ylab = 'sum U MAP')
  }
  mylist<-list("X" = X,"sum_U" = sum_U )
  return (mylist)
}









