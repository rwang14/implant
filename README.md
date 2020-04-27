# implant: An R Package for the High-throughput Phenotyping Pipeline for Image Processing and Functional Growth Curve Analysis

Download the R package: 

devtools::install_github("rwang14/implant")

Note: Installation: 
1. For Windows users, Please install Rtools before installing the package. Please use the following link and follow its instruction to install Rtools by clicking the link. Note that you should put the location of the Rtools on the PATH follow the instruction. See details by clicking the link: https://cran.r-project.org/bin/windows/Rtools/

In summary:
1. Install Rtools40 
2.Run: 
writeLines('PATH="${RTOOLS40_HOME}\\usr\\bin;${PATH}"', con = "~/.Renviron")
in R
3. Restart R
4. install.packages("devtools")
5. library(devtools)
6. devtools::install_github("rwang14/implant")
7. library(devtools)


2. For Mac users, please install Xcode before installing the package. Please download Xcode from: https://developer.apple.com/xcode/resources/

On Github, you can:

Find example data: data.csv, data_Xu.txt, and example images: image1.png, image2.png and image_pot.png from the folder: inst/extdata

Find demos: demo.R, demo_DCT.R and demo_HMRF.R from the folder: data-raw

Find functions from the folder: R

Find help documentation from the folder: man.

Find manual from the  folder: vignettes or visit: https://github.com/rwang14/implant/blob/master/vignettes/implant_0.1.0.pdf

Find user's guide from the folder: vignettes or visit: https://github.com/rwang14/implant/blob/master/vignettes/Users%20Guide.pdf

A supplymentary documentation about HMRF_EM framework in this study can be found: https://github.com/rwang14/implant/blob/master/vignettes/HMRF_EM.pdf
