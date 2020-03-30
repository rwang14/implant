\name{Largest_Connection}
\alias{Largest_Connection}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Finding the Largest Connection
%%  ~~function to do ... ~~
}
\description{
This function is used to identify the components of a binary image. By doing this, you can find the component which has the largest connection. Also one can plot the image by using different colors to represent different components.
Moreover, one can imrpove the segmentation result by inputing the threshold value.
}
\usage{
Largest_Connection(A,thred)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{A}{ a binary matrix in which elements are 0 and 1.
%%     ~~Describe \code{x} here~~
}
  \item{thred}{thresholding value to filter the unwanted noise of the image. To be more specific, this function divides the image into several components. Each component has its own number of pixels. We use the number of pixels as the threshold level to filter out the unwanted components.}
}
\details{ %thred refer to the thresholding level of the frequceny of "1"s in each component. By defining the value of thre1, one can segment the image by filtering the components whose amount of "1"s is lower than the value of thred1.
%%  ~~ If necessary, more details than the description above ~~
}
\value{
\item{plot}{the plot of the matrix with different components}
\item{matrix}{the original outcome of the matrix (without filtering) in which pixel elements are represented by different integers. Each number represent a component. }
\item{filtered_matrix}{the outcome of the matrix (after filtering) in which pixel elements are represented by different integers. Each number represent a component. }
%% ...
}
\references{
%\link[SDMTools]{ConnCompLabel}
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\link[SDMTools]{ConnCompLabel}
}
\examples{
img11 = Largest_Connection(A = image,thred = 10)
img11$filtered_matrix
}
