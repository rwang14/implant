HMRF_EM = function(X,Y,Z,mu,sigma,k,em_iter,map_iter,beta = 2, epsilon_em = 0.00001, epsilon_map = 0.00001){
em = EM(X,Y,Z,mu,sigma,k,em_iter,map_iter,beta = 2, epsilon_em = 0.00001, epsilon_map = 0.00001)
X = em$X
Xoutput = X-1
mu = em$mu
sigma = em$sigma
return(list("image_matrix" = Xoutput, "mu" = mu, "sigma" = sigma))
}