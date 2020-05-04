# implant: An R Package for the High-throughput Phenotyping Pipeline for Image Processing and Functional Growth Curve Analysis

Package Installation:    

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Install the package in R if "devtools" package is installed:

    devtools::install_github("rwang14/implant")

Otherwise, follow the steps below to install "devtools" package first.

Note: Your R version is recommended to be >=3.5.3 in order to use devtools.

**Windows users:** 
please install Rtools before installing the package. Use the link https://cran.r-project.org/bin/windows/Rtools/history.html and follow its instruction to install Rtools. Note that the version of Rtools should match to the version of R.

  Step 1. Install Rtools (You need to install the correct version of Rtools that matches the version of your R).

  Step 2. Restart R.

  Step 3. Run the following command in R:
    
    install.packages("devtools");

    library(devtools)

  Step 4. Run the following command in R:
  
     devtools::install_github("rwang14/implant");
     
     library(implant)

**Mac users:** please install Xcode before installing the package. Download Xcode from: https://developer.apple.com/xcode/resources/

  Step 1: Install Xcode.

  Step 2: Start R.

  Step 3. Run the following command in R:
    
    install.packages("devtools");

    library(devtools)

  Step 4. Run the following command in R:
  
     devtools::install_github("rwang14/implant");
     
     library(implant)
 **Local Installation:** If you cannot install it online, you can download the package to your local computer and install it locally. 
 
 Step 1. Download the package: https://github.com/rwang14/files/blob/master/implant_0.1.0.tar.gz
 
 Step 2. Run the following command in R:
 
    install.packages("~/your path/implant_0.1.0.tar.gz", repos = NULL, type = "source")
 
    library(implant)
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

On Github, you can:

Find example data: data.csv, data_Xu.txt, and example images: image1.png, image2.png and image_pot.png from the folder: inst/extdata.

Find demos: demo.R, demo_DCT.R and demo_HMRF.R from the folder: data-raw.

Find source code from the folder: R.

Find help documentation from the folder: man.

Find manual from the  folder: vignettes or visit: https://github.com/rwang14/implant/blob/master/vignettes/implant.pdf

Find user guide from the folder: vignettes or visit: https://github.com/rwang14/implant/blob/master/vignettes/User%20Guide.pdf
A supplymentary documentation about HMRF_EM framework in this study can be found: https://github.com/rwang14/implant/blob/master/vignettes/HMRF_EM.pdf
