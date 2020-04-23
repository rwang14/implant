\name{erosion}
\alias{Erosion}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Morphological Erosion
}
\description{
This function is used to perform morphological erosion of an image.
}
\usage{
erosion(imagefile, mask = matrix(1, 3, 3))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{imagefile}{
  matrix of pixels of the original image.
}
\item{mask}{
matrix constructed by structing elements.
}
}
\details{
}
\value{
matrix of pixels of the eroded image.
}
\references{
%% ~put references to the literature/web site here ~
}

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

imageBE = erosion(imageB, mask = matrix(1, 5, 5))
}

