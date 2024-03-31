% Contoh penguatan tepi dengan filter laplacian
gambarasli = imread('gambar/pepper.png');
filter = fspecial('laplacian'); % Filter laplacian
fitur = imfilter(gambarasli, filter);
% Menampilkan gambar asli
subplot(1, 2, 1);
imshow(gambarasli);
title('Gambar Asli');
 
% Menampilkan gambar hasil penguatan tepi
subplot(1, 2, 2);
imshow(fitur);
title('Gambar Hasil Peningkat fitur');
