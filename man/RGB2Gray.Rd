\name{Color2Gray}
\alias{Color2Gray}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Converting RGB to Grayscale.

}
\description{
This function is used to convert an RGB image to Grayscale.
}
\usage{
Color2Gray(image, weight = c(0.299,0.587,0.114))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{image}{
  array of an RGB image file for processing.
%%     ~~Describe \code{x} here~~
}
\item{weight}{
numeric vector, in which elements are weights for the Red channel of the image, Green channel of the image, and the Blue channel of the image, respectively.
}
}
\details{
%We first standardize the weight by using the following formula:
%sw = weight / sum(weight).
%In default, we convert an RGB image to Grayscale based on the following formula:
%luma = 0.299/sw * R+ 0.587/sw * G+ 0.114/sw * B.
}
\value{
\item{image}{
A matrix of pixels of the image converted from RGB to Grayscale.
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
imageGray = Color2Gray(image)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
