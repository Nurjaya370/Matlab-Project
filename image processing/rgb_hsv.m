% Baca gambar asli
originalImage = imread('gambar/ai.jpg');

% Konversi RGB ke HSV
hsvImage = rgb2hsv(originalImage);

% Tampilkan gambar asli dan hasil konversi
figure;
subplot(1, 2, 1); imshow(originalImage); title('Citra RGB Asli');
subplot(1, 2, 2); imshow(hsvImage); title('Citra HSV');
