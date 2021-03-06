ColorG = function(imagefile, rowThreshold = 0.007,
                  #block = 5, Tol = 2,
                  Bthreshold = 60 / 255,
                  EGThreshold = 0.1, weight = c(-1, 2, -1)){

  block = 5
  Tol = 2
  changeto = c(1, 1, 1)
  weight = weight / sqrt(sum(weight^2))
  imageweight = imagefile[, , 1] * weight[1] + imagefile[, , 2] * weight[2] + imagefile[, , 3] * weight[3]
  imagesum = imagefile[, , 1] + imagefile[, , 2] + imagefile[, , 3]
  flas = (imageweight > EGThreshold * imagesum) * (imagesum > Bthreshold)
  rowMean0 = rowMeans(flas)
  length0 = length(rowMean0)
  rowmeanblock = rowMean0
  for (i in 1 : block){
    temp1 = c(rep(0, i), rowMean0)[1 : length0]
    temp2 = c(rowMean0, rep(0, i))[(i + 1) : (length0 + i)]
    rowmeanblock = rowmeanblock + temp1 + temp2
  }
  rowmeanblock = rowmeanblock / (2 * block + 1)
  index0 = which((rowmeanblock > rowThreshold) == 1)
  if (length(index0) > 0){
    index = c(min(index0) - block - Tol, max(index0) + block + Tol)

    N = dim(imagefile)
    flas[, 1 : floor(5 * N[2] / 12)] = 0
    flas[, floor(7 * N[2] / 12) : N[2]] = 0
    flas[1 : (index[1] - 20), ] = 0
    flas[(index[2] + 20) : N[1], ] = 0
    imageR = imagefile[, , 1]; imageG = imagefile[, , 2]; imageB = imagefile[, , 3]
    imageR[flas == 1] = changeto[1]
    imageG[flas == 1] = changeto[2]
    imageB[flas == 1] = changeto[3]
    imagefile[, , 1] = imageR; imagefile[, , 2] = imageG; imagefile[, , 3] = imageB
    res = list(#uppb = index[1],
               lowb = index[2],
               #rowmean = rowMeans(flas),
               c = imagefile)
  } else {
    res = list(c = imagefile)
  }
  return(res)
}
