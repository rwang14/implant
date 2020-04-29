\name{HMRF}
\alias{HMRF}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Image Segmentation using Hidden Markov Random Field and EM Algorithm Framework
%%  ~~function to do ... ~~
}
\description{This function can be used to obtain the segmented image using HMRF-EM.
}

%%  ~~ A concise (1-5 lines) description of what the function does. ~~

\usage{
HMRF(X, Y, Z, em_iter, map_iter, beta = 2,
        epsilon_em = 0.00001, epsilon_map = 0.00001)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{X}{an m by n binary matrix of the inital labels for an image, which can be obtained using initital segmentation methods, such as K-means or thresholding methods. Note that X can only be a matrix of 1 and 2, or a matrix of 0 and 1.
%%     ~~Describe \code{x} here~~
}
\item{Y}{an m by n matrix of pixel intensity. For plant segmentation, we recommend to use relative green. Note that Y should be the same as the argument Y in the function image_kmeans(  ).
}
\item{Z}{ an m by n binary matrix, giving an estimate for the object edges in Y. We can obtain Z using the Canny edge detector:
Z = t(cannEdges (Y) [  ,  , 1, 1]) from the package: imager. See the example for details.
}

\item{em_iter}{a positive integer, which is the number of iteration steps of the EM Algorithm.
}
\item{map_iter}{a positive integer, which is the number of iteration steps of calculating MAP (the maximum a posterior estimation).
}
\item{beta}{The clique potential parameter for neighbourhood dependence. In default, beta = 2. See details in the supplementary file on the HMRF Model. This beta is equivalent to the Psi in the supplentary file (see page 20, 21).
}
\item{epsilon_em}{a small positive number, which is the convergence criterion of the EM Algorithm.
}
\item{epsilon_map}{a small positive number, which is the convergence criterion of MAP (maximum a posterior estimation).
}
}
\details{1. More detailed explanation about this method can be found in the supplymentary file:

https://github.com/rwang14/implant/blob/master/vignettes/HMRF_EM.pdf

2. The arguement Z can be obatined by CannyEdge detector using function cannEdges( ) from the package: imager. However,
since this package needs to involve Rcpp and other dependent packages which may increase installation complexity of our package, we recommend the users to install the package: imager by themselves if needed.
%%  ~~ If necessary, more details than the description above ~~
}
\value{
\item{image_matrix}{A matrix giving labels for the segmented image.
}
}
\references{Wang, Quan (2012), “Hmrf-em-image:  implementation  of  the  hidden markov  random  field  model  and  its  expectation-maximization algorithm.”arXivpreprintarXiv:1207.3510
}
\author{
%%  ~~who you are~~
}
\note{ This function is modified based on the matlab code written by Quan Wang (see reference).
%%  ~~further notes~~
}
\seealso{
\code{\link{image_kmeans}}
}
%% ~Make other sections like Warning with \section{Warning }{....} ~
\examples{
library(implant)
library(png)
orig = readPNG(system.file("extdata", "reduced.png", package = "implant", mustWork = TRUE))
#Define the response as relative green.
Y = orig[ , , 2]/(orig[ , , 1]+orig[ , , 2]+orig[ , , 3])
#Z is a matrix obtained by CannyEdge detector
Z = read.csv(system.file("extdata", "Z.csv",
                         package = "implant", mustWork = TRUE))
Z = as.matrix(Z)
##Note: Users can obtain Z using the package "imager" and the function
#CannyEdges( ) for different images
#Z = t(cannyEdges(orig)[ , , 1, 1])
#Take the initial label of EM algorithm using K-means
X = image_kmeans(Y, k = 2)$X
#Obtain the image produced by kmeans clustering
output = matrix(as.numeric(X), nrow = nrow(X), ncol = ncol(X)) - 1
writePNG(output,"~/kmeans.png")
#Run the HMRF Model. Note that it may take a lot of time ...
img = HMRF(X, Y, Z, em_iter = 20, map_iter = 20, beta = 2,
              epsilon_em = 0.00001, epsilon_map = 0.00001)
#Obtain the matrix of the segmented image
image = img$image_matrix
#Morphological Operations
imageD = dilation(image)
imageDE = erosion(imageD)
imageDEE = erosion(imageDE)
imageDEED = dilation(imageDEE)
