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
  \item{imagefile}{array or matrix of pixels of the original image.
%%     ~~Describe \code{x} here~~
}
\item{mask}{matrix constructed by structuring elements.

}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
matrix of pixels of the dilated image.
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
