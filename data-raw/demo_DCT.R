library(implant)
library(png)
#load the image of plant
imageOriginal = readPNG(system.file("extdata", "image1.png",package = "implant", mustWork = TRUE))[ , ,1:3]
#load the image of empty pot
imageX = readPNG(system.file("extdata", "image_pot.png",package = "implant", mustWork = TRUE))[ , ,1:3]
#Identify the region of interest
sizeOriginal = dim(imageOriginal)[c(1, 2)]
tempG = ColorG(imagefile = imageX, rowThreshold = 0.002)
lowerRowBound = tempG$lowb
resultColor = ColorB(imageOriginal)
ColBound = c(resultColor$lb, resultColor$rb)
RI = matrix(1, sizeOriginal[1], sizeOriginal[2])
RI[, c(1 : ColBound[1])] = 0
RI[, c(ColBound[2] : sizeOriginal[2])] = 0
RI[c(lowerRowBound : sizeOriginal[1]), ] = 0
#reduce size for imageOriginal and imageX
image1 = downsize(imageOriginal, RowSample = 2, ColSample = 2)
imageX1 = downsize(imageX, RowSample = 2, ColSample = 2)
#change the color of the green strip of the empty pot(imageX1) to white
tempG1 = ColorG(imageX1, rowThreshold = 0.002)
imageX1G = tempG1$c
#Contrast Image
imageContrast = abs(image1 - imageX1G)[, , 1 : 3]
#DCT applied to image1 and imageContrast
imageB1 = imageBinary(image1,  weight = c(-1, 2, -1), threshold1 = 30 / 255,threshold2 = 0.02)
imageB2 = imageBinary(imageContrast,  weight = c(1, -2, 1), threshold1 = 0.7,threshold2 = 0)
imageB = imageB1*imageB2
#Dilation and Erosion
imageBD = dilation(imageB, mask = matrix(1, 5, 5))
imageBDE = erosion( imageBD, mask = matrix(1, 5, 5) )
imageBDEE = erosion( imageBDE, mask = matrix(1, 3, 3) )
imageBDEED = dilation( imageBDEE, mask = matrix(1, 3, 3) )
#Use the Region of Interest to Get the Final Image
RI1 = downsize_matrix(RI, RowSample = 2, ColSample = 2)
RI1row = sum(rowSums(RI1) > 0)
RI1col = sum(colSums(RI1) > 0)
imageBF = matrix(imageBDEED[RI1 == 1], RI1row, RI1col)
writePNG(imageBF,"~/Fina_Image.png")
#Feature Extraction
#a = 2, b = 2 since we have reduced the size by picking every two pixels#in each row and each column
extract_pheno(processed_image = imageBF,Xsize = 1.54902601242065, Ysize = 1.55327594280243, a = 2, b = 2)$height
extract_pheno(processed_image = imageBF,Xsize = 1.54902601242065, Ysize = 1.55327594280243, a = 2, b = 2)$width
extract_pheno(processed_image = imageBF,Xsize = 1.54902601242065, Ysize = 1.55327594280243, a = 2, b = 2)$size
