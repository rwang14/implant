\name{HMRF_EM}
\alias{HMRF_EM}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Image Segmentation using Hidden Markov Random Field and EM Algorithm Framework
%%  ~~function to do ... ~~
}
\description{This function can be used to obtain the segmented image using HMRF-EM.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
HMRF_EM(X,Y,Z,mu,sigma,k,em_iter,map_iter, beta = 2,
        epsilon_em = 0.00001, epsilon_map = 0.00001)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{X}{A matrix of the inital labelled image, which can be obtained using other segmentation methods, such as K-means.
%%     ~~Describe \code{x} here~~
}
\item{Y}{A m by n matrix of the response variable. Note that the dimension of the original image is n by m. Recommended to use load.image{imager} to load the original image.
}
\item{Z}{ A m by n matrix. This is to have a brief edge detection of the response variable. e.g., We can use Canny edge detector:
Z = cannEdges(Y,...)
}
\item{mu}{A k by 1 matrix. The two rows represent the mean of the pixel intensities of the response variable under k different classes, respectively. This can be obtained using the function "imkmeans" in this package.
}

\item{sigma}{A k by 1 matrix. The two rows represent the sigma of the pixel intensities of the response variable under k different classes, respectively. This can be obtained using the function "imkmeans" in this package.
}
\item{k}{A positive integer, which infers the nubmer of classes that you want to classify the image into. In default, k = 2.
}
\item{em_iter}{ A positive integer, which is the number of iteration steps of EM Algorithm.
}
\item{map_iter}{ A positive integer, which is the number of iteration steps of MAP.
}
\item{beta}{The clique potential parameter, in default, beta = 2. See more in the supplementary file of HMRF Model.
}
\item{epsilon_em}{A small positive number, which is the convergence criterion of EM Alogrithm.
}
\item{epsilon_map}{A small positive number, which is the convergence criterion of MAP.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
\item{image_matrix}{A matrix of the segmented image.
}
\item{mu}{Updated mu.
}
\item{sigma}{Updated sigma.
}
}
\references{Wang, Quan (2012), “Hmrf-em-image:  implementation  of  the  hidden markov  random  field  model  and  its  expectation-maximization algorithm.”arXivpreprintarXiv:1207.3510
}
\author{
%%  ~~who you are~~
}
\note{This function is modified based on the matlab code written by Quan Wang (see reference).
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
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
}

