% Baca citra
originalImage = imread('gambar/pepper.png');

% Tentukan sudut rotasi (dalam derajat)
angle = 30;

% Terapkan rotasi menggunakan imrotate
rotatedImage = imrotate(originalImage, angle);

% Tampilkan hasil
figure;
subplot(1, 2, 1); imshow(originalImage); title('Citra Asli');
subplot(1, 2, 2); imshow(rotatedImage); title('Hasil Rotasi');
