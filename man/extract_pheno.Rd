\name{extract_pheno}
\alias{extract_pheno}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Extract phenotypical features from segmented images
}
\description{
This function extracts phenotypical features from segmented images.
}
\usage{
extract_pheno(processed_image, Xsize = 1, Ysize = 1, a = 1, b = 1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{processed_image}{ a binary matrix contains only 0 and 1, giving the segmented image of a plant.
%%     ~~Describe \code{x} here~~
}
\item{Xsize, Ysize}{Xsize and Ysize are the actual horizontal and vertical lengths of one pixel, respectively. The default set is Xsize = 1, Ysize = 1 for the non-adjustment for the pixel size.
}

\item{a,b}{positive integers, the same as the values of RowSample and ColSample in the function: "downsize", respectively. This is only used if the function "downsize" was used to reduce the size of the image in image segmentation.
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
\item{pixelCount}{The total number of pixels of the segmented plant of interest.}
\item{plantheight}{The height of the segmented plant. }
\item{plantwidth}{The width of the segmented plant. }
 \item{plantSize}{The size of the segmented plant based on the total number of pixels of the segmented plant of interest. i.e. Size = pixelCount * Xsize * Ysize.}

%% ...
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

\seealso{ \code{\link{downsize}} for reducing size of an image.
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
#read an RGB image
library(png)
imageOriginal = readPNG(system.file("extdata", "image1.png",
                             package = "implant",
                             mustWork = TRUE))[,,c(1:3)]
#reduce the size of an image
image_reduced = downsize(imageOriginal, RowSample = 2, ColSample = 2)
#segment the reduced image
imageB = imageBinary(image_reduced,  weight = c(-1, 2, -1), threshold1 = 30 / 255, threshold2 = 0.05)
#obtain the size of the segmented image
extract_pheno(processed_image = imageB, Xsize = 1.5, Ysize = 1.5, a = 2, b = 2)$size
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
