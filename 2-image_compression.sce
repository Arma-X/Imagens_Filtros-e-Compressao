clear;
clc;
function imCompressed = compress(imFullOneChannel, SingularValuesToKeep)
    [U, Sigma, V] = svd(imFullOneChannel);
    SingularValues = diag(Sigma)
    imCompressed = U(:, 1:SingularValuesToKeep)*diag(SingularValues(1:SingularValuesToKeep))*V(:, 1:SingularValuesToKeep)'
endfunction

im = imread('C:\Users\Arma-X\Desktop\Muitimidia\Trabalho 5\bakugo.png');
subplot(221)
imshow(im);

imFull = double(im);

imCompressed(:, :, 1) = compress(imFull(:, :, 1), 6000);
imCompressed(:, :, 2) = compress(imFull(:, :, 2), 6000);
imCompressed(:, :, 3) = compress(imFull(:, :, 3), 6000);

//imCompressedFinal = uint32(imCompressed);
subplot(222)
imshow(imCompressed);
imwrite(imCompressed,'C:\Users\Arma-X\Desktop\Muitimidia\Trabalho 5\lena(mod).png');
