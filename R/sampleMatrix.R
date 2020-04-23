sampleMatrix = function(M, RowSample = 1, ColSample = 1){
  row.index = seq(1, dim(M)[1], RowSample) 
  col.index = seq(1, dim(M)[2], ColSample)   
  M1 = M[row.index, col.index]
  return(M1)
}