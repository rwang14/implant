\name{ColorG}
\alias{ColorG}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Identifying the region of interest & changing color of particular part of an image
}
\description{
This function is used to identify the region of interest, and change the color of particular part of an image. Specifically, this function is designed for the plant images taken by the UNL greenhouse system. It helps identify the lower boundary of the region of interest and change the color of the green strip of an empty pot from green to white. See example image:
}
\usage{
ColorG (image, rowThreshold = 0.007, block = 5, Tol = 2, Bthreshold = 60 / 255,
EGThreshold = 0.1, weight = c(-1, 2, -1), changeto = c(1, 1, 1))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{image}{matrix of pixels of the image for processing.
}
\item{rowThreshold}{positive real number, which is the threshold value of each row.

}
\item{block}{postive integer, which is the moving average of average pixels of each row of the matrix of the matrix.

}
\item{Tol}{
small number. Essentially, this argument to add the tolarance when identifying the lower boundary of the region of interest.

}
\item{Bthreshold}{
Value between 0 and 1. It is applied to the sum of the RGB intensities.

}
\item{EGThreshold}{
Value between 0 and 1. It is applied to the contrast intensity by the specified weight in the function.
}
\item{weight}{
3 by 1 numeric vector. The three elements indicate the weight of the pixel intensities of R,G,B, respectively. In default, it takes the value of c(-1,2,-1), which helps to construct a relative green ratio.
}
\item{changeto}{
numeric vector, in which elements refer to the pixel intensities of the colors you want each channel of the eliminated part changed to, respectivley.
}
}
\details{In the example part, this function helps identify the lower boundary of the region of interest, and eliminate the green strip of an empty pot by changing its color from green to white.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, useuppb = index[1], lowb = index[2], rowmean = rowMeans(flas), c = image
\item{uppb }{upper bound of the region of interest.}
\item{lowb }{lower bound of the region of interest.}
\item{rowmean}{proportion of the signals of the green strip appear in each row of pixel matrix of the image.}
\item{c}{matrix of pixels of the processed image.}
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
ColorG (image, rowThreshold = 0.007, block = 5, Tol = 2, Bthreshold = 60 / 255,
EGThreshold = 0.1, weight = c(-1, 2, -1), changeto = c(1, 1, 1))
writePNG(image, "~/Desktop/Visible/imageColorG.png")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
