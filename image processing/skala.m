% Baca citra
originalImage = imread('gambar/pepper.png');

% Tentukan faktor penskalaan (scaling factor)
scaleFactor = 12.5;

% Terapkan penskalaan menggunakan imresize
scaledImage = imresize(originalImage, scaleFactor);

% Tampilkan hasil
figure;
subplot(1, 2, 1); imshow(originalImage); title('Citra Asli');
subplot(1, 2, 2); imshow(scaledImage); title('Hasil Penskalaan');
