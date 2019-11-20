\name{erosion}
\alias{Erosion}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Morphological Erosion
}
\description{
This function is used to perform morphological erosion of an image.
}
\usage{
erosion(image, mask = matrix(1, 3, 3))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{image}{
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
imageBDE = erosion( imageBD, mask = matrix(1, 5, 5) )
}

