% Contoh penguatan tepi dengan filter Prewitt
gambarasli = imread('gambar/pepper.png');
filter = fspecial('Prewitt'); % Filter Sobel
deteksi = imfilter(gambarasli, filter);
% Menampilkan gambar asli
subplot(1, 2, 1);
imshow(gambarasli);
title('Gambar Asli');
 
% Menampilkan gambar hasil penguatan tepi
subplot(1, 2, 2);
imshow(deteksi);
title('Hasil Deteksi Tepi dengan Prewitt');
