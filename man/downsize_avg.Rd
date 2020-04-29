\name{downsize_avg}
\alias{Average Reducing}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Reducing size of an image using the method of averaging in blocks.
}
\description{
This function is used for reducing size of an image by averaging its pixels in blocks.
}
\usage{
downsize_avg(image, block_nrow = 2, block_ncol = 2)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{image}{
 a pixel matrix or an array of the image for processing.
}
\item{block_nrow}{
an integer number, which is the number of rows to select to construct your new array. For example, if block_nrow = 2 means you select every two rows of the input image as a block. Note that this number needed to be divisible by number of rows of the array of the input image.
}
\item{block_ncol}{
an integer number, which is the number of columns to select to construct your new array. For example, if block_ncol = 2 means you select every two columns of the input image as a block. Note that this number needed to be divisible by number of columns of the array of the input image.

}
}
\details{
This function is used to reduce the size of an image by dividing the original array into several blocks and calculate the average values within each block.
}
\value{
a pixel array of the reduced image.
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
block_nrow and block_ncol must be divisible by number of rows and columns of the pixel-arrary of the image, respectively. Otherwise, Errors will be reported as: "block_nrow(block_ncol) must be divisible by number of rows(columns) of the pixel-arrary of the image."
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
downsize_avg(image,2,2)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
