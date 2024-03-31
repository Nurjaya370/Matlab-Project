% Baca gambar grayscale
originalImage = imread('gambar/bendera.jpg');
grayImage = rgb2gray(originalImage);

% Hitung nilai ambang Otsu
threshold = graythresh(grayImage);

% Binarisasi gambar menggunakan nilai ambang Otsu
binaryImage = im2bw(grayImage, threshold);

% Menampilkan gambar asli dan hasil binarisasi
figure;
subplot(1, 2, 1);
imshow(originalImage);
title('Gambar Asli');

subplot(1, 2, 2);
imshow(binaryImage);
title('Hasil Binarisasi (Global Thresholding)');
