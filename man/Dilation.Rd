\name{dilation}
\alias{Dilation}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Morphological Dilation
}
\description{
This function is used to perform morphological dilation of an image.
}
\usage{
dilation(imagefile, mask = matrix(1, 3, 3))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{imagefile}{a binary matrix of the segmented image.
%%     ~~Describe \code{x} here~~
}
\item{mask}{a matrix constructed by structuring elements.

}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
a binary matrix of the eroded image.
}
\references{Image Analysis and Mathematical Morphology by Jean Serra, ISBN 0-12-637240-3 (1982)
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
                             mustWork = TRUE))[,,c(1:3)]

imageB = imageBinary(image, weight = c(-1, 2, -1),
                     threshold1 = 30 / 255,
                     threshold2 = 0.075)

imageBD = dilation(imageB, mask = matrix(1, 5, 5))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
