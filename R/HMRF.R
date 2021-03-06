HMRF = function(X, Y, Z, em_iter, map_iter, beta = 2, epsilon_em = 0.00001, epsilon_map = 0.00001){
  k = 2
  x = vec(X)
  y = vec(Y)
  # if (sum(as.numeric(unique(x) == c(1,2))) == 2){
  #   x = x
  # }
  # else{
  #   for ( i in 1:length(x)){
  #     if (x[i] == 0){
  #       x[i] = 1
  #     }
  #     else{
  #       x[i] = 2
  #     }
  #   }
  # }
  unique(as.numeric(x))[2]
  number_one = sum(x == unique(as.numeric(x))[1])
  number_two = sum(x == unique(as.numeric(x))[2])

  if(number_two > number_one){
    idx1 = which(x==(unique(as.numeric(x))[1]))
    idx2 = which(x==(unique(as.numeric(x))[2]))
    x[idx1]=2
    x[idx2]=1
  }
  mu = matrix (0, nrow = k, ncol = 1)
  sigma = matrix(0, nrow = k, ncol = 1)
  for ( i in 1:k ){
    yindex = y[x == i]
    mu[i] = mean(yindex)
    sigma[i] = sd(yindex)
  }
em = EM(X,Y,Z,mu,sigma,k,em_iter,map_iter,beta = 2, epsilon_em = 0.00001, epsilon_map = 0.00001)
X = em$X
Xoutput = X-1
mu = em$mu
sigma = em$sigma
return(list("image_matrix" = Xoutput))
}
