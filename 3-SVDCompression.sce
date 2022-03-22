A = im2double(imread("C:\Users\Arma-X\Desktop\Muitimidia\Trabalho 5\bliss.tif")); 

[U,S,V,rk] = svd(A); // U is 842x842, S is 842x1180, V is 1180x1180, rk is 842
singularValues = diag(S);
imwrite(A,'C:\Users\Arma-X\Desktop\Muitimidia\Trabalho 5\bliss(orig).tif');
// the only things you need to fiddle with
singularDimensionsToTry = [5, 15, 25, 35, 45];      // Choose arbitrary singular dimensions to keep
percentagesOfHighestDimensionToTry = [1, 0.4, 0.2]; // Choose percentages of the highest singular value which we will keep
totalCols = 3;

totalNumPlots = 1 + length(singularDimensionsToTry) + length(percentagesOfHighestDimensionToTry);
totalRows = totalNumPlots/totalCols;
if (modulo(totalNumPlots, totalCols) <> 0) then
   totalRows = totalRows+1;
end

// Original Image
f = scf(1);
clf(1);
f.figure_name = 'Singular Value Decomposition Image Compression';
subplot(totalRows,totalCols,1);
imshow(A)
xtitle(['Original Image';  string(rk) + ' singular dimensions'])


// Fixed number of singular dimensions
for i = 1:length(singularDimensionsToTry)
   singularDimension = singularDimensionsToTry(i);
   newA = U(:, 1:singularDimension)*S(1:singularDimension, 1:singularDimension)*V(:, 1:singularDimension)' ; 
   error=singularValues(singularDimension+1); // See Eckart-Young-Minsky Theorem
   subplot(totalRows,totalCols,i+1);
   imshow(newA);
   xtitle([string(singularDimension)+' singular dimensions'; 'Spectral Norm Error = ' + string(error)]);
end
   imwrite(newA,'C:\Users\Arma-X\Desktop\Muitimidia\Trabalho 5\bliss(mod1).tif');

// Percentages of the highest weighted singular dimensions
for j = 1:length(percentagesOfHighestDimensionToTry)
    percentageToTry = percentagesOfHighestDimensionToTry(j);
   // get the indices of singular values that contribute more than X% of the highest singular value
   indicesOfSingularValues = find(singularValues > (percentageToTry/100)*max(singularValues));
   newA = U(:, indicesOfSingularValues)*S(indicesOfSingularValues,indicesOfSingularValues)*V(:, indicesOfSingularValues)';
   singularDimension = length(indicesOfSingularValues);
   error=singularValues(singularDimension+1); // See Eckart-Young-Minsky Theorem
   subplot(totalRows,totalCols,1+length(singularDimensionsToTry)+j);
   imshow(newA);
   xtitle([string(singularDimension) + ' singular dimensions'; string(percentageToTry) + '% of highest singular dimension' ; 'Spectral Norm Error = ' + string(error)])
end

imwrite(newA,'C:\Users\Arma-X\Desktop\Muitimidia\Trabalho 5\bliss(mod2).tif');
