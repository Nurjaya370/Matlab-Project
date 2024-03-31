% Contoh penguatan tepi dengan filter kustom
gambarasli = imread('gambar/pepper.png');
filter = [1 1 1; 1 -7 1; 1 1 1]; % Filter kustom
kustom = imfilter(gambarasli, filter);
% Menampilkan gambar asli
subplot(1, 2, 1);
imshow(gambarasli);
title('Gambar Asli');
 
% Menampilkan gambar hasil penguatan tepi
subplot(1, 2, 2);
imshow(kustom);
title('Gambar Hasil Kustom fitur');
