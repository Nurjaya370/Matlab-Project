% Baca citra
originalImage = imread('gambar/capture1.jpg');

% Konversi ke citra grayscale
grayImage = rgb2gray(originalImage);

% Deteksi sudut dengan Harris Corner Detector
corners = detectHarrisFeatures(grayImage);

% Menampilkan hasil
imshow(originalImage);
hold on;
plot(corners);
title('Deteksi Sudut (Harris Corner Detector)');
