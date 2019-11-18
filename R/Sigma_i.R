Sigma_i = function(i,Y_na,Y.hat.matrix){
  days = which(!is.na(Y_na[i,]))
  Sigma_ii = matrix(NA, nrow = length(days), ncol = length(days))
  for ( l in days){
    for ( s in days){
      no_na_l = which(!is.na(Y_na[,l]))
      no_na_s = which(!is.na(Y_na[,s]))
      #find the common plants that have both the lth time and the sth time(no NA)
      elements = Reduce(intersect, list(no_na_l,no_na_s))
      temp = c(NA,length(elements))
      for (k in 1: length(elements)){
        temp[k] = (Y_na[elements[k],l]-Y.hat.matrix[elements[k],l])*((Y_na[elements[k],s]-Y.hat.matrix[elements[k],s]))
      }
      sum_temp = sum(temp)
      #if(length(elements)<10)
      #print(length(elements))
      cov_ls = (1/(length(elements)-1))*sum_temp
      Sigma_ii[which(days==l),which(days==s)] = cov_ls
    }
  }
  return(Sigma_ii)
}
