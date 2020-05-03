\name{downsize_matrix}
\alias{downsize_matrix}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Reducing the Size of a Matrix
%%  ~~function to do ... ~~
}
\description{This function reduces the size of a matrix by picking one component from every k1 components in each row and one component from every k2 components in each column of the input matrix, and use the selected elements to construct a reduced matrix, where k1 and k2 are specified by "RowSample" and "ColSample", respectively.
%sample elements from each row and each column of the original matrix, and use the selected elements to construct a reduced matrix. This function can be used to reduce sizes of binary images in the study of image processing.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
downsize_matrix(M, RowSample = 1, ColSample = 1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{M}{the original input matrix.
%%     ~~Describe \code{x} here~~
}
\item{RowSample}{a positive integer for the rows. Select one component from every RowSample components.
%It is the increment of the index of the selected elements.
For example, RowSample = 2 means you select the 1st, 3rd, ... element from each row of the original matrix to construct your new matrix.
}
\item{ColSample}{a positive integer for the columns. Select one component from every ColSample components.
%It is the increment of the index of the selected elements.
For example, ColSample = 2 means you select the 1st, 3rd, ... element from each column of the original matrix to construct your new matrix.
}
}
\details{This function can be used to reduce the size of a matrix by picking sample elements of the original matrix as the elements of the reduced matrix. For example, "RowSample = 2", and "ColSample = 2" reduce the original size of a matrix to a quarter.
%%  ~~ If necessary, more details than the description above ~~
}
\value{the reduced matrix.
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{This function is different from another function in this package called "downsize( )". That function is used to
reduce the size of 3-D arrays while this function, downsize_matrix(  ), is used to reduce the size of matrices.
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
#read the red band of an RGB image
library(png)
image = readPNG(system.file("extdata", "image1.png",
                             package = "implant",
                             mustWork = TRUE))[ , ,1]
downsize_matrix(M = image, RowSample = 2, ColSample = 2)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
