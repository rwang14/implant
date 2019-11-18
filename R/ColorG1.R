ColorG1 = function(image, Bthreshold = 60 / 255, EGThreshold = 0.1, weight = c(-1, 2, -1), changeto = c(1, 1, 1)){
  #normalization
  weight = weight / sqrt(sum(weight^2))
  imageweight = image[, , 1] * weight[1] + image[, , 2] * weight[2] + image[, , 3] * weight[3]
  imagesum = image[, , 1] + image[, , 2] + image[, , 3]
  #Bthreshold means the black threshold
  flas = (imageweight > EGThreshold * imagesum) * (imagesum > Bthreshold)
  N = dim(image)
  flas[, 1 : floor(5 * N[2] / 12)] = 0
  flas[, floor(7 * N[2] / 12) : N[2]] = 0
  imageR = image[, , 1]; imageG = image[, , 2]; imageB = image[, , 3]
  imageR[flas == 1] = changeto[1]
  imageG[flas == 1] = changeto[2]
  imageB[flas == 1] = changeto[3]
  image[, , 1] = imageR; image[, , 2] = imageG; image[, , 3] = imageB
  res = list(rowmean = rowMeans(flas), c = image)
  return(res)
}