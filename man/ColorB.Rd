\name{ColorB}
\alias{ColorB}
\title{
Identifying the region of interest of a plant
}
\description{This function is specifically designed for processing the plant images taken in the University of Nebraska-Lincoln (UNL) greenhouse Innovation Center. It helps identify the left and right boundaries of the plant by removing the parts of the image that contains the black bars, but keep the black part of the pot. In a word, to help users identify the region of interest. This is based on locating the position of the black bars in the background. See the image1.png in the example data.

%This function is used to identify the region of interest of an image. Specifically, this function is designed to identify the region of interest of the plant image taken from the UNL greenhouse system, by removing the parts of the image that contains the black bars, but keep the black part of the pot. In a word, to help users identify the region of interest.
}
\usage{
ColorB(image, colThreshold = 0.5)
}
\arguments{
  \item{image}{
  an RGB image of plant.
}
  \item{colThreshold}{
  a positive real number, which is the used to identify the black bars appear in the columns of the image.
  }
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
A modified image replacing all the area outside the region of interest by white color.
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
writePNG(image,"~/imageOriginal.png")
resultColor = ColorB(image)
bound = c(resultColor$lb, resultColor$rb)
imageColor = resultColor$c
writePNG(imageColor,"~/imageColor.png")
}

