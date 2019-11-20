color_exchange = function(image1){
image = image1
for (i in 1: nrow(image)){
  for (j in 1:ncol(image)){
    if(image[i,j] == 1){
      image[i,j] = 0
    }
    else
      image[i,j] = 1
  }
}
return (image)
}

#image1 = readPNG("~/Desktop/Visible/initial1.png")
#image = color_exchange(image1)
#writePNG(image,"~/Desktop/Visible/initial2.png")
