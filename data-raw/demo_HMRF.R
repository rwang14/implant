library(imager)
library(dplyr)
orig1 = load.image(system.file("extdata", "image1.png",
                               package = "implant", mustWork = TRUE))
orig = resize(orig1, size_x = 500, size_y = 500, size_z = 1, size_c = 3)
#Define the response as relative green.
I = orig[,,1,2]/(orig[,,1,1]+orig[,,1,2]+orig[,,1,3])
Y = t(I)
Z = cannyEdges(orig)
Z = Z[,,1,1]
Z = t(Z)
#Take the initial label of EM algorithm using K-means
X = imkmeans(Y,k = 2)$X
mu = imkmeans(Y,k = 2)$mu
sigma = imkmeans(Y,k = 2)$sigma
output = matrix(as.numeric(X),nrow = nrow(X), ncol = ncol(X))-1
#Run the HMRF Model
img = HMRF_EM(X,Y,Z,mu,sigma,k = 2,em_iter = 20,map_iter = 20,beta = 2,
              epsilon_em = 0.00001, epsilon_map = 0.00001)
#Obtain the matrix of the segmented image
image = img$image_matrix
#Morphological Operations
imageD = dilation(image)
imageDE = erosion(imageD)
imageDEE = erosion(imageDE)
imageDEED = dilation(imageDEE)
