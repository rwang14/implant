\name{ColorB}
\alias{ColorB}
\title{
Identifying the region of interest
}
\description{
This function is used to identify the region of interest of an image. Specifically, this function is designed to identify the region of interest of the plant image taken from the UNL greenhouse system, by removing the parts of the image that contains the black bars, but keep the black part of the pot.
}
\usage{
ColorB(image, colThreshold = 0.5, colTol = c(5, 5), changefromub = rep(0.1, 3),
changeto = c(1, 1, 1))
}
\arguments{
  \item{image}{
  matrix of pixels of the image file for processing.
}
  \item{colThreshold}{
  positive real number, which is the threshold level of the signals of the black bars appear in each column.
  }
  \item{colTol}{
  A 2 by 1 numeric vector, in which elements are some small numbers.Essentially, this argument to add the tolarance when identifying the boundaries of the region of interest.
}
\item{changefromub}{
  A 3 by 1 numeric vector, in which elements refer to the threshold levels of the black bars of the image for the Red Channel, the Green Channel and the Blue Channel, respectively.
}
\item{changeto}{
  A 3 by 1 numeric vector, in which elements refer to the pixel intensities of the colors you want each channel of the eliminated part changed to, respectivley.
}
}
\details{
}
\value{
\item{lb}{
left bound of the part of the region of interest.
}
\item{rb}{
right bound of the part of the region of the interest.
}
\item{c}{
matrix of pixels of the obtained image by applying this function.
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
resultColor = ColorB(image)
bound = c(resultColor$lb, resultColor$rb)
imageColor = resultColor$c
}

