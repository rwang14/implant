\name{downsize}
\alias{downsize}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Reducing the size of an  RGB image
%%  ~~function to do ... ~~
}
\description{
This function reduces the size of an image by picking sample pixels from each row and each column of the original image, and use the selected pixels to construct a reduced image.
}
\usage{
downsize(image, RowSample = 1, ColSample = 1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{image}{
an input RGB image array
}
\item{RowSample}{
%a positive integer. It is the increment of the index of the selected elements (pixel intensities). For example, RowSample = 2 means you select the 1st, 3rd, ... element from each row of the original image to construct the new image.
a positive integer for the rows. Select one component from every RowSample components.
For example, RowSample = 2 means you select the 1st, 3rd, ... element from each row of the original image to construct your new image.
}
\item{ColSample}{a positive integer for the columns. Select one component from every ColSample components. For example, ColSample = 2 means you select the 1st, 3rd, ... element from each column of the original image to construct your new image.
}
}
\details{
This function can be used to reduce the size of an image by picking sample elements of the original image as the elements of the reduced image. For example, "RowSample = 2", and "ColSample = 2" reduce the original size of an image to a quarter.
}
\value{array of pixels of the reduced image.

}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{This function is different from another function in this package called "downsize_matrix( )". That function is used to
reduce the size of matrices while this function, downsize( ), is used to reduce the size of 3-D arrays.
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
downsize(image, RowSample = 2, ColSample = 2)
}
