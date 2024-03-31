% Baca gambar asli
originalImage = imread('gambar/cap2.png');

% Konversi RGB ke HSL
hslImage = rgb2hsl(originalImage);

% Tampilkan gambar asli dan hasil konversi
figure;
subplot(1, 2, 1); imshow(originalImage); title('Citra RGB Asli');
subplot(1, 2, 2); imshow(hslImage); title('Citra HSL');
