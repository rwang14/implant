sample = function(image, RowSample = 1, ColSample = 1){
  row.index = seq(1, dim(image)[1], RowSample)
  col.index = seq(1, dim(image)[2], ColSample)
  image1 = image[row.index, col.index, ]
  return(image1)
}
