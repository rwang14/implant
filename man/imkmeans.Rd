\name{imkmeans}
\alias{imkmeans}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Obtain the  Matrix of the Segmented Image using K-means Clustering.
%%  ~~function to do ... ~~
}
\description{This function is to obtain a segmented plant image using K-means Clustering Method, together with the means and standard deviations of the pixel intensities for different classes.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
imkmeans(Y,k)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Y}{an input matrix. For plant segmentation, we recommend to use the relative green intensity of the image.
%%     ~~Describe \code{x} here~~
}
  \item{k}{a positive integer, which refers to the cluster number. In default, k = 2 to seperate the plant from the background.

  }
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
\item{X}{a  matrix of the class label of the segmented image.

}
\item{mu}{a k by 1 matrix. Each row represents the sample mean of each cluster.
}
\item{sigma}{a k by 1 matrix. Each row represents the sample standard deviation of each cluster.
}
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
%install.packages("imager")
library(png)
orig = readPNG(system.file("extdata", "image1.png",
                            package = "implant", mustWork = TRUE))
writePNG(orig, "~/Original_Image.png")

Y = orig[, , 2]/(orig[, , 1]+orig[, , 2]+orig[, , 3])
k = 2
X = imkmeans(Y,k)$X
mu = imkmeans(Y,k)$mu
sigma = imkmeans(Y,k)$sigma
#convert a matrix of 1&2 to a matrix of 0&1
output = matrix(as.numeric(X),nrow = nrow(X), ncol = ncol(X))-1
writePNG(output, "~/kmeans.png")
}
