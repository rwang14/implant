\name{Largest Connection}
\alias{Largest Connection}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Finding the Largest Connection
%%  ~~function to do ... ~~
}
\description{
This function is used to identify the components of a binary image. By doing this, you can find the component which has the largest connection. Also one can plot the image by using different colors to represent different components.
Moreover, one can do image segmentation by inputing the threshold value.
}
\usage{
flc(A,thred1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{A}{ a 2D matrix in which elements are 0 and 1.
%%     ~~Describe \code{x} here~~
}
  \item{thred1}{thresholding value to filter the unwanted noise of the image.}
}
\details{ thred1 refer to the thresholding level of the frequceny of "1"s in each component. By defining the value of thre1, one can segment the image by filtering the components whose amount of "1"s is lower than the value of thred1.
%%  ~~ If necessary, more details than the description above ~~
}
\value{
\item{matrix}{the original outcome of the matrix (without filtering) in which pixel elements are represented by different integers. Each number represent a component. }
\item{matrix_filtered}{the outcome of the matrix (after filtering) in which pixel elements are represented by different integers. Each number represent a component. }
\item{image}{the plot of the matrix with different components}
%% ...
}
\references{
 \code{\link{ConnCompLabel}}
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
require(SDMTools)
require(matlab)
#getting the image which components are denoted by different colors
flc(imageB,10)$image
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ component }% use one of  RShowDoc("KEYWORDS")
\keyword{ color}% __ONLY ONE__ keyword per line
