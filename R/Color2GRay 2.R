Color2Gray = function(image, weight = c(0.299,0.587,0.114)){
  #weight should be positive
  weight = weight / sum(weight)
  image1 = image[, , 1] * weight[1] + image[, , 2] * weight[2] + image[, , 3] * weight[3]
  return(image1)
}
