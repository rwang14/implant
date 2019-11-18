ColorB = function(image, colThreshold = 0.5, colTol = c(5, 5), EGThreshold = 0.075, changefromub = rep(0.1, 3), 
                  changeto = c(1, 1, 1)){
  #Find the main back bars, if flas[,]== TRUE, then transfer into 1 (white) in later steps
  #changefromub is the threshold level of the black bar(each pixel)
  flas = (image[, , 1] < changefromub[1]) & (image[, ,2] < changefromub[2])  & (image[, ,3] < changefromub[3])
  N = dim(image)
  #Keep the black for the bin in the middle
  flas[ , floor(5 * N[2] / 12) : floor(7 * N[2] / 12) ] = FALSE
  #select the whole columns that contain black bars, see imagekbbb.png
  index0 = which((colMeans(flas) > colThreshold) == 1)
  #Find the edges of the black bars part, I think colTol might just be a random small number
  index = c(max(index0[index0 < N[2] / 2]) + colTol[1], min(index0[index0 > N[2] / 2]) - colTol[2])
  #select the left hand side that you want to erase
  flas[, c(1 : index[1])] = TRUE
  #select the right hand side that you want to erase
  flas[, c(index[2] : N[2])] = TRUE
  imageR = image[, , 1]; imageG = image[, , 2]; imageB = image[, , 3]
  #imagesum = imageR + imageG + imageB
  #EG = (2 * imageG - imageR - imageB) / sqrt(6)
  #flasGreen = (EG < EGThreshold * imagesum)
  #flasGreen[, c((index[1] + 1) : (index[2] - 1))] = FALSE
  #flas = flas & flasGreen
  imageR[flas] = changeto[1]
  imageG[flas] = changeto[2]
  imageB[flas] = changeto[3]
  image[, , 1] = imageR; image[, , 2] = imageG; image[, , 3] = imageB
  #lb means the left bound of the image that does not contain the black bars
  #rb means the right bound of the image that does not contain the black bars
  res = list(lb = index[1], rb = index[2], c = image)
  return(res)
}