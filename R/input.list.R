input.list = function(data,Time_na,p = 0){
  days = sort(as.numeric(unique(as.vector(Time_na))))
  ra = order(days)
  tmin = min(ra)
  tmax = max(ra)
  n = dim(data)[1]
  Y = list()
  length(Y) = n
  T = list()
  length(T) = n
  for (i in 1:n)
  {
    subdata = data[i,]
    temp = rep(0,(tmax-tmin+1))
    for (j in 1:(tmax-tmin+1))
    {
      #the first two columns are genotype and block, subdata_j means without these two columns
      subdata_j = subdata[,(j+p)]
      #temp[j] given a fixed i means: for the ith genotype, at the values of y for each observation at the 
      #jth  time point,  
      temp[j] = mean(subdata_j[complete.cases(subdata_j)])	# taking average if more than one (not NAs)		
    }
    index = which(temp>=0)
    Y[[i]] = temp[index]	# heigh
    T[[i]] = days[index]
  }
  return(list(Y = Y, T = T))
}

#Y = input.list(data = data_new, p = 2,tmin,tmax)$Y

#T = input.list(data = data_new, p = 2,tmin,tmax)$T