\name{sample}
\alias{sample}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Reducing size of an  RGB image
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
an array of pixel intensities of image to reduce.
}
\item{RowSample}{a positive integer. It is the increment of the index of the selected elements (pixel intensities). For example, RowSample = 2 means you select the 1st, 3rd, ... element from each row of the original image to construct the new image.
}
\item{ColSample}{a positive integer. It is the increment of the index of the selected elements (pixel intensities). For example, ColSample = 2 means you select the 1st, 3rd, ... element from each column of the original image to construct the new image.
}
}
\details{
This function can be used to reduce the size by picking sample pixels of the original image as the pixels of the reduced image. For example, "RowSample = 2, and ColSample = 2"" means that we pick the 1st, the 3rd, the 5th,..., pixel of each row and each column of the original image as the pixels of the reduced image.
}
\value{array of pixels of the reduced image.

}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{This function is different from another function in this package called "sampleMatrix( )". That function is used to
reduce the size of matrices while this function, sampleMatrix( ), is used to reduce the size of 3-D arrays.
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
sample(image, RowSample = 2, ColSample = 2)
}
