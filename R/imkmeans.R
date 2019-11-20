#setwd("~/Desktop/HMRF")
#library(matrixcalc)
imkmeans<-function(Y,k){
 set.seed(6007)
 y = vec(t(Y))
 x = kmeans (y, k)$cluster
 ###To make sure the plant is white
 number_one = sum(x == 1)
 number_two = sum(x == 2)
 if(number_two > number_one){
    for (i in 1: length(x)){
          if(x[i] == 2){
             x[i] = 1
          }
          else
             x[i] = 2
       }
 }
 ######
 a = nrow(Y)
 b = ncol(Y)
 X = matrix (x, nrow= a, ncol= b, byrow = TRUE)
 mu = matrix (0, nrow = k, ncol = 1)
 sigma = matrix(0, nrow = k, ncol = 1)
 for ( i in 1:k ){
   yindex = y[x == i]
   mu[i] = mean(yindex)
   sigma[i] = sd(yindex)
 }
 mylist3<-list("X"=X,"mu"=mu,"sigma"=sigma)
 return(mylist3)
}
