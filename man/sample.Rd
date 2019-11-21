\name{sample}
\alias{sample}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Reducing size of an image
%%  ~~function to do ... ~~
}
\description{
This function reduces the size of an image by picking sample pixels from each row and each column of the original image, and use the selected pixels to construct a reduced image.
}
\usage{
sample(image, RowSample = 1, ColSample = 1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{image}{
array of pixels of the image file to reduce.
}
\item{RowSample}{a positive integer. It means you select every "RowSample" pixels of each row of the original image as a pixel of the reduced image.

}
\item{ColSample}{a positive integer. It means you select every "RowSample" pixels of each column of the original image as a pixel of the reduced image.
}
}
\details{
This function can be used to reduce the size by picking sample pixels of the original image as the pixels of the reduced image. For example, RowSample = 2, and ColSample = 2 mean that we pick the 1st, the 3rd, the 5th,..., pixel of each row and each column of the original image as the pixels of the reduced image.
}
\value{array of pixels of the reduced image.

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
sample(image, RowSample = 2, ColSample = 2)
}

