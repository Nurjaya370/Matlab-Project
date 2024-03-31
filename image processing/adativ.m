% Baca gambar grayscale
originalImage = imread('gambar/bendera.jpg');
grayImage = rgb2gray(originalImage);

% Terapkan metode adaptive thresholding
binaryImageAdaptive = im2bw(grayImage, graythresh(grayImage));

% Menampilkan gambar asli dan hasil binarisasi adaptif
figure;
subplot(1, 2, 1);
imshow(originalImage);
title('Gambar Asli');

subplot(1, 2, 2);
imshow(binaryImageAdaptive);
title('Hasil Binarisasi (Adaptive Thresholding)');
