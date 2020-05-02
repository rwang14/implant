\name{imageBinary}
\alias{Binarization}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Segmentation and Binarization
%%  ~~function to do ... ~~
}
\description{This function uses the Double-Criterion Thresholding method (DCT) to segment the object of study
from the background of an image, and tranform the image to a binary image, i.e., a black and white image.
}
\usage{
imageBinary(image, weight = c(-1, 2, -1), threshold1 = 30 / 255,
threshold2 = 0.075)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{image}{
  an array of pixels of the image for processing.
%%     ~~Describe \code{x} here~~
}
  \item{weight}{a 3 by 1 vector. The three elements indicate the weight of the pixel intensities of R,G,B, respectively. In default, it takes the value of c(-1, 2, -1), which helps to construct a relative green ratio.

  }
  \item{threshold1,threshold2}{
  Values between 0 and 1. threshold1 is applied to the sum of the RGB intensities. threshold2 is applied on the contrast intensity by the specified weight in the function.
  }
}
\details{
The plant pixels are classified as the intersection of sum of RGB intensities larger than threshold 1 and green intensities larger than threshold 2.
}
\value{
A matrix of the processed image.
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
#read an RGB image
library(png)
image = readPNG(system.file("extdata", "image1.png",
                             package = "implant",
                             mustWork = TRUE))[ , ,c(1:3)]
imageB = imageBinary(image,  weight = c(-1, 2, -1),
threshold1 = 30 / 255, threshold2 = 0.05)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
