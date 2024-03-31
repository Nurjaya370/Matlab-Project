% Baca citra
originalImage = imread('gambar/pepper.png');

% Tentukan vektor translasi (tx, ty)
tx = 50;
ty = 30;

% Terapkan translasi menggunakan imtranslate
translatedImage = imtranslate(originalImage, [tx, ty]);

% Tampilkan hasil
figure;
subplot(1, 2, 1); imshow(originalImage); title('Citra Asli');
subplot(1, 2, 2); imshow(translatedImage); title('Hasil Translasi');
