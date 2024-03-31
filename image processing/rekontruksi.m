% Membaca gambar
gambar = imread('gambar/koin.jpg');

% Konversi ke citra grayscale
gray = rgb2gray(gambar);

% Thresholding
thresh = graythresh(gray);
imbw = im2bw(gray, thresh);

% Label objek
[labeled, numObjects] = bwlabel(imbw, 8);

% Rekonstruksi citra dari label dengan mode RGB
reconstructedImageRGB = label2rgb(labeled, 'spring', 'c', 'shuffle');

% Menampilkan hasil
subplot(1, 2, 1);
imshow(imbw);
title('Citra Biner');

subplot(1, 2, 2);
imshow(reconstructedImageRGB);
title('Citra Rekonstruksi (RGB)');
