imageBinary = function(image, weight = c(-1, 2, -1), threshold1 = 30 / 255, threshold2 = 0.075){
  weight = weight / sqrt(sum(weight^2))
  imagesum = image[, , 1] + image[, , 2] + image[, , 3]
  temp1 = 1 * (imagesum > threshold1)
  imageweight = image[, , 1] * weight[1] + image[, , 2] * weight[2] + image[, , 3] * weight[3]
  temp2 = 1 * (imageweight > threshold2 * imagesum)
  return(temp1 * temp2)
}

