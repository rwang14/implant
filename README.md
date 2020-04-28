# implant: An R Package for the High-throughput Phenotyping Pipeline for Image Processing and Functional Growth Curve Analysis

Package Installation:

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Download the package in R:

    devtools::install_github("rwang14/implant")

Note: 

1. Your R version is recommended to be >=3.5.3 in order to use devtools.

2. For Windows users, please install Rtools before installing the package. Please use the following link and follow its instruction to install Rtools by clicking the link. See details by clicking the link: https://cran.r-project.org/bin/windows/Rtools/history.html

  In summary:

  Step 1. Install Rtools(You need to install the correct version of Rtools that matches the version of your R).
  (Don't forget to click: Add rtools to system PATH during your installation)

  Step 2. Restart R.

  Step 3. Run the following command in R:
    
    install.packages("devtools");

    library(devtools)

  Step 4. Run the following command in R:
  
     devtools::install_github("rwang14/implant");
     
     library(implant)


3. For Mac users, please install Xcode before installing the package. Please download Xcode from: https://developer.apple.com/xcode/resources/

  In summary:

  Step 1: Install Xcode.

  Step 2: Start R.

  Step 3. Run the following command in R:
    
    install.packages("devtools");

    library(devtools)

  Step 4. Run the following command in R:
  
     devtools::install_github("rwang14/implant");
     
     library(implant)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

On Github, you can:

Find example data: data.csv, data_Xu.txt, and example images: image1.png, image2.png and image_pot.png from the folder: inst/extdata.

Find demos: demo.R, demo_DCT.R and demo_HMRF.R from the folder: data-raw.

Find functions from the folder: R.

Find help documentation from the folder: man.

Find manual from the  folder: vignettes or visit: https://github.com/rwang14/implant/blob/master/vignettes/implant_0.1.0.pdf

Find user's guide from the folder: vignettes or visit: https://github.com/rwang14/implant/blob/master/vignettes/Users%20Guide.pdf

A supplymentary documentation about HMRF_EM framework in this study can be found: https://github.com/rwang14/implant/blob/master/vignettes/HMRF_EM.pdf
