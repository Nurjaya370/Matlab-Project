% Contoh penguatan tepi dengan filter Sobel
originalImage = imread('gambar/pepper.png');
filter = fspecial('sobel'); % Filter Sobel
edgeEnhancedImage = imfilter(originalImage, filter);

% Menampilkan gambar asli
subplot(1, 2, 1);
imshow(originalImage);
title('Gambar Asli');

% Menampilkan gambar hasil penguatan tepi
subplot(1, 2, 2);
imshow(edgeEnhancedImage);
title('Hasil Penguatan Tepi dengan Sobel');

