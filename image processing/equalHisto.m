% Baca gambar berwarna (RGB)
originalImage = imread('gambar/bendera.jpg');

% Konversi gambar berwarna menjadi grayscale
grayImage = rgb2gray(originalImage);

% Terapkan histogram equalization pada citra grayscale
equalizedImage = histeq(grayImage);

% Menampilkan gambar asli dan hasil pengimbangan histogram
figure;
subplot(2, 2, 1);
imshow(originalImage);
title('Gambar Asli');

subplot(2, 2, 2);
imhist(rgb2gray(originalImage));
title('Histogram Gambar Asli');

subplot(2, 2, 3);
imshow(equalizedImage);
title('Hasil Pengimbangan Histogram');

subplot(2, 2, 4);
imhist(equalizedImage);
title('Histogram Hasil Pengimbangan');
