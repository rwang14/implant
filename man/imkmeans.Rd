\name{imkmeans}
\alias{imkmeans}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Obtain the  Matrix of the Segmented Image using K-means Method.
%%  ~~function to do ... ~~
}
\description{This function is to obtain the  Matrix of the Segmented Image using K-means Method, togehter with the means and variances of the pixel intensities within different classes.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
imkmeans(Y,k)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Y}{
%%     ~~Describe \code{x} here~~
}
  \item{k}{

  }
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
\item{X}{A matrix of the segmented image, using the K-means method.

}
\item{mu}{A k by 1 matrix. The k rows represent the mean of the pixel intensities of the response variable under k different classes, respectively.
}
\item{sigma}{A k by 1 matrix. The k rows represent the mean of the pixel intensities of the response variable under k different classes, respectively.
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
orig1 = load.image("~/Desktop/Visible/image_original.png")
orig = resize(orig1, size_x = 500, size_y = 500, size_z = 1, size_c = 3)
I = orig[,,1,2]/(orig[,,1,1]+orig[,,1,2]+orig[,,1,3])
Y = t(I)
k = 2
X = imkmeans(Y,k)$X
mu = imkmeans(Y,k)$mu
sigma = imkmeans(Y,k)$sigma
output = matrix(as.numeric(X),nrow = nrow(X), ncol = ncol(X))-1
}
