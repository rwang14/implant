average_reducing = function(image, block_nrow = 2, block_ncol = 2){
  N1 = dim(image)[1]
  N2 = dim(image)[2]

  if( N1 %% block_nrow !=0 ){
    stop("block_nrow must be divisible by number of rows of the pixel-arrary of the image.")
  }
  if(N2 %% block_ncol !=0 ){
    stop("block_ncol must be divisible by number of columns of the pixel-arrary of the image.")
  }

  else{
    blockrow = N1/block_nrow
    blockcol = N2/block_ncol
    averagearray = array(NA, c(blockrow, blockcol, 3) )
    for (k in 1:3){
      for (i in 1: blockrow) {
        for (j in 1: blockcol){
          temp = image[((i - 1) * block_nrow + 1) : (i * block_nrow) , ((j - 1) * block_ncol + 1):(j * block_ncol) , k ]
          averagearray[i,j,k] = mean(temp)
        }
      }
    }
    return(averagearray)
  }
}
#image = readJPEG("~/Desktop/photo.jpg")
#dim(image)
#image1 = average_reducing(image,2,2)
#writePNG(image1,"~/Desktop/Visible/imagereduce.png")
