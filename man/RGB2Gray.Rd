\name{Color2Gray}
\alias{Color2Gray}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Converting an RGB image to a grayscale image

}
\description{
This function is used to convert an RGB image to Grayscale.
}
\usage{
Color2Gray(image, weight = c(0.299, 0.587, 0.114))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{image}{
an array of an RGB image file for processing.
%%     ~~Describe \code{x} here~~
}
\item{weight}{
a numeric vector, giving weights for the Red, the Green and the Blue channels of the image, respectively.
}
}
\details{
%We first standardize the weight by using the following formula:
%sw = weight / sum(weight).
%In default, we convert an RGB image to Grayscale based on the following formula:
%luma = 0.299/sw * R+ 0.587/sw * G+ 0.114/sw * B.
}
\value{
\item{image}{
A matrix of pixels of the image converted from RGB to Grayscale.
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
#read an RGB image
library(png)
image = readPNG(system.file("extdata", "image1.png",
                             package = "implant",
                             mustWork = TRUE))[,,c(1:3)]
imageGray = Color2Gray(image)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
