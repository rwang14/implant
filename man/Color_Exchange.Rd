\name{Color_Exchange}
\alias{Background Exchange}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Exchanging the color of the background and the foreground.
%%  ~~function to do ... ~~
}
\description{
This function exchanges the color of the background and the subject for a binary image.
}
\usage{
color_exchange(image1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{image1}{
A pixel matrix of a binary image
}
}
\details{
The input matrix should be a matrix of 0 and 1 only.
}
\value{
A pixel matrix with exchanging the color of the background and subject.
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
imageB = imageBinary(image,  weight = c(-1, 2, -1),
threshold1 = 30 / 255, threshold2 = 0.05)
color_exchange(imageB)
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
}
