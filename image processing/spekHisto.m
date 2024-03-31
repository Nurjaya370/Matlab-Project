% Baca gambar berwarna (RGB)
originalImage = imread('gambar/bendera.jpg');

% Konversi gambar berwarna menjadi grayscale
grayImage = rgb2gray(originalImage);

% Tentukan histogram yang diinginkan (contoh: distribusi seragam)
desiredHistogram = linspace(0, 1, 256);

% Terapkan spesifikasi histogram
matchedImage = imhistmatch(grayImage, desiredHistogram);

% Menampilkan gambar asli, histogram asli, dan hasil spesifikasi histogram
figure;
subplot(3, 2, 1);
imshow(originalImage);
title('Gambar Asli');

subplot(3, 2, 2);
imhist(grayImage);
title('Histogram Gambar Asli');

subplot(3, 2, 3);
imshow(matchedImage);
title('Hasil Spesifikasi Histogram');

subplot(3, 2, 4);
imhist(matchedImage);
title('Histogram Hasil Spesifikasi');

% Menampilkan histogram yang diinginkan
subplot(3, 2, [5 6]);
plot(desiredHistogram);
title('Histogram yang Diinginkan');
