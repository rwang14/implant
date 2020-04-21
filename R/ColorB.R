ColorB = function(imagefile, colThreshold = 0.5, colTol = c(5, 5), EGThreshold = 0.075, changefromub = rep(0.1, 3),
                  changeto = c(1, 1, 1)){
  #Find the main back bars, if flas[,]== TRUE, then transfer into 1 (white) in later steps
  #changefromub is the threshold level of the black bar(each pixel)
  flas = (imagefile[, , 1] < changefromub[1]) & (imagefile[, ,2] < changefromub[2])  & (imagefile[, ,3] < changefromub[3])
  N = dim(imagefile)
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
  imageR = imagefile[, , 1]; imageG = imagefile[, , 2]; imageB = imagefile[, , 3]
  #imagesum = imageR + imageG + imageB
  #EG = (2 * imageG - imageR - imageB) / sqrt(6)
  #flasGreen = (EG < EGThreshold * imagesum)
  #flasGreen[, c((index[1] + 1) : (index[2] - 1))] = FALSE
  #flas = flas & flasGreen
  imageR[flas] = changeto[1]
  imageG[flas] = changeto[2]
  imageB[flas] = changeto[3]
  imagefile[, , 1] = imageR; imagefile[, , 2] = imageG; imagefile[, , 3] = imageB
  #lb means the left bound of the imagefile that does not contain the black bars
  #rb means the right bound of the imagefile that does not contain the black bars
  res = list(lb = index[1], rb = index[2], c = imagefile)
  return(res)
}
