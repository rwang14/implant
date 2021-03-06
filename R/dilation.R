dilation = function(imagefile, mask = matrix(1, 3, 3) ){
  M=dim(imagefile)
  image.background = matrix ( 0, M[1] , M[2] )
  mask.shift=( dim(mask)[1] - 1 ) / 2
  for (i in (-mask.shift) : (mask.shift) ){
    for (j in ( -mask.shift ) : ( mask.shift ) ){
      if (mask[ (i + mask.shift + 1) , ( j + mask.shift + 1) ] == 1 ) {
        image.background[ ( (1+mask.shift) : (M[1]-mask.shift) ),( (1+mask.shift) : (M[2]-mask.shift) ) ] =
          image.background[ ( (1+mask.shift) : (M[1]-mask.shift) ),( (1+mask.shift) : (M[2]-mask.shift) ) ]  |
          imagefile[ ( (1+mask.shift) : (M[1]-mask.shift) + i),( (1+mask.shift) : (M[2]-mask.shift) +j) ]
      }
    }
  }
  return(1 * image.background)
}
