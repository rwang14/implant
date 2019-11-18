#ij conversion
ij = function(index,m){
  i = (index-1) %% m + 1
  j = floor((index-1)/m) + 1
  return (c(i,j))
}
