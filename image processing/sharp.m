% Contoh penguatan tepi dengan filter Sharperning
gambarasli = imread('gambar/pepper.png');
filter = fspecial('unsharp'); % Filter tajam
sharpcitra = imfilter(gambarasli, filter);
% Menampilkan gambar asli
subplot(1, 2, 1);
imshow(gambarasli);
title('Gambar Asli');
 
% Menampilkan gambar hasil penguatan tepi
subplot(1, 2, 2);
imshow(sharpcitra);
title('Hasil Penajaman Gambar');
