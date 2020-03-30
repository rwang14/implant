#library(SDMTools)
#library(matlab)
Largest_Connection = function(A,thred){
flc = function(A,thred){

  ccl.mat = ConnCompLabel(A)

  comp_filtered = function(A,thred){
    A[which(A%in%(names(which(table(A) < thred))))] = 0
    return(A)
  }

  segmented = comp_filtered(ccl.mat,thred)

  data.return = list("matrix" = ccl.mat,"filtered_matrix" = segmented)

  return(data.return)
}

M = flc(A,thred)$matrix
M_filtered = flc(A,thred)$filtered_matrix

plot_comp = function(M,thred){

  arr1 = array(data = M, dim = c(nrow(M), ncol(M), 3))
  arr2 = arr1/max(arr1)
  ## convert it to a raster, interpolate =F to select only sample of pixels of img
  img.r <- as.raster(arr2,interpolate = F)
  s = sort(table(img.r), decreasing = T)
  ss = names(s)
  color = colors()
  m = max(which(s[] > thred))
  for (i in 1:m) {
    if(i == 1){
      img.r[img.r == ss[i]] <-color[1]
    }
    else{
      img.r[img.r == ss[i]] <- color[i*22+1] #pick a suitable color
    }
  }
  for (i in (m+1): length(s)){
    img.r[img.r == ss[i]] <-color[1]
  }
  p = plot(img.r)
  return(p)
}
pic = plot_comp(M,thred)
return(list("plot" = pic, "matrix" = M, "filtered_matrix" = M_filtered))
}

#imgh1 = readPNG("~/Desktop/imageB11.png")
#img11 = Largest_Connection (A = imgh1,thred = 10)
