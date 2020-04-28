\name{ColorG}
\alias{ColorG}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Identifying the region of interest (lower bound) for a plant
}
\description{This function is specifically designed for processing the plant images taken in the University of Nebraska-Lincoln (UNL) greenhouse Innovation Center. It helps identify the lower boundary of the plant by using images of empty pot with a plastic green bar. See the sample image: image_pot.png.
}
\usage{
ColorG (imagefile, rowThreshold = 0.007, Bthreshold = 60 / 255,
EGThreshold = 0.1, weight = c(-1, 2, -1), changeto = c(1, 1, 1))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{imagefile}{input RGB image of the empty pot
}
\item{rowThreshold}{positive real number, used to identify the position of the green strip in the empty pot.

}
%\item{block}{postive integer, which is the moving average of average pixels of each row of the matrix of the matrix.

%}
%\item{Tol}{
small number. Essentially, this argument to add the tolarance when identifying the lower boundary of the region of interest.

% }
\item{Bthreshold}{
Value between 0 and 1. It is applied to the sum of the RGB intensities.

}
\item{EGThreshold}{
Value between 0 and 1. It is applied to the contrast intensity by the specified weight in the function.
}
\item{weight}{
3 by 1 numeric vector. The three elements indicate the weight of the pixel intensities of R, G, B, respectively. In default, it takes weight c(-1,2,-1), for contrast intensity.
}
\item{changeto}{
numeric vector, with values between 0 and 1, giving the color intensity to change the green trip in the empty pot.
}
}
\details{In the example part, this function identifies the green strip in an empty pot, which can be considered as teh lower boundary of a plant, and change the color of the green strip from green to white.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, useuppb = index[1], lowb = index[2], rowmean = rowMeans(flas), c = image
\item{lowb }{lower bound of the region of interest.
}
\item{c}{output image with changed color on the green strip.
}
%% ...
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
imageX = readPNG(system.file("extdata", "image_pot.png",
                             package = "implant",
                             mustWork = TRUE))[,,c(1:3)]
writePNG(imageX,"~/imageX.png")
tempG = ColorG (imagefile = imageX, rowThreshold = 0.007, Bthreshold = 60 / 255,
EGThreshold = 0.1, weight = c(-1, 2, -1), changeto = c(1, 1, 1))
tempG$c
tempG$lowb
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
