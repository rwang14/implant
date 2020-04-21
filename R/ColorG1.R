ColorG1 = function(imagefile, Bthreshold = 60 / 255, EGThreshold = 0.1, weight = c(-1, 2, -1), changeto = c(1, 1, 1)){
  #normalization
  weight = weight / sqrt(sum(weight^2))
  imageweight = imagefile[, , 1] * weight[1] + imagefile[, , 2] * weight[2] + imagefile[, , 3] * weight[3]
  imagesum = imagefile[, , 1] + imagefile[, , 2] + imagefile[, , 3]
  #Bthreshold means the black threshold
  flas = (imageweight > EGThreshold * imagesum) * (imagesum > Bthreshold)
  N = dim(imagefile)
  flas[, 1 : floor(5 * N[2] / 12)] = 0
  flas[, floor(7 * N[2] / 12) : N[2]] = 0
  imageR = imagefile[, , 1]; imageG = imagefile[, , 2]; imageB = imagefile[, , 3]
  imageR[flas == 1] = changeto[1]
  imageG[flas == 1] = changeto[2]
  imageB[flas == 1] = changeto[3]
  imagefile[, , 1] = imageR; imagefile[, , 2] = imageG; imagefile[, , 3] = imageB
  res = list(rowmean = rowMeans(flas), c = imagefile)
  return(res)
}
