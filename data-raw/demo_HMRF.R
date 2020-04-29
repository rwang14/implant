library(implant)
#library(imager)
#library(dplyr)
#orig1 = load.image(system.file("extdata", "image1.png", package = "implant", mustWork = TRUE))

#orig = resize(orig1, size_x = 500, size_y = 500, size_z = 1, size_c = 3)
#Define the response as relative green.
#I = orig[ , , 1, 2]/(orig[ , , 1, 1]+orig[ , , 1, 2]+orig[ , , 1, 3])
#Y = t(I)
orig = reaPNG(system.file("extdata", "reduced.png", package = "implant", mustWork = TRUE))
#Define the response as relative green.
Y = orig[ , , 2]/(orig[ , , 1]+orig[ , , 2]+orig[ , , 3])
#Z is a matrix obtained by CannyEdge detector
Z = read.csv(system.file("extdata", "Z.csv",
                         package = "implant", mustWork = TRUE))
##Note: Users can obtain Z using the package"imager" and the function CannyEdges( ) for different images
#Z = cannyEdges(orig)
#Z = t(Z[ , , 1, 1])
#Take the initial label of EM algorithm using K-means
X = image_kmeans(Y, k = 2)$X
#Obtain the image produced by kmeans clustering
output = matrix(as.numeric(X), nrow = nrow(X), ncol = ncol(X)) - 1
#Run the HMRF Model. Note that this may take a lot of time ...
img = HMRF(X, Y, Z, em_iter = 20, map_iter = 20, beta = 2,
              epsilon_em = 0.00001, epsilon_map = 0.00001)
#Obtain the matrix of the segmented image
image = img$image_matrix
#Morphological Operations
imageD = dilation(image)
imageDE = erosion(imageD)
imageDEE = erosion(imageDE)
imageDEED = dilation(imageDEE)
writePNG(imageDEED, "~/HMRF.png")
