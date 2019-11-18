extract_pheno = function(processed_image, Xsize = 1, Ysize = 1, a = 1, b = 1){
imageBW = processed_image
pixelCount = sum(imageBW)
plantSize = pixelCount * Xsize * Ysize * a * b
RowCount = rowSums(imageBW)
ColCount = colSums(imageBW)
NonzeroRow = which(RowCount > 0); NonzeroCol = which(ColCount > 0)
plantheight = Ysize * (quantile(NonzeroRow, 0.975)[[1]] - quantile(NonzeroRow, 0.025)[[1]])
plantwidth = Xsize * (quantile(NonzeroCol, 0.975)[[1]] - quantile(NonzeroCol, 0.025)[[1]])
if (is.na(plantheight)) plantheight = 0
if (is.na(plantwidth)) plantwidth = 0
return(list("height" = plantheight, "width" = plantwidth, "size" = plantSize, "pixelcount" = pixelCount))
}
