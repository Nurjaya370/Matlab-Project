% Baca gambar asli
originalImage = imread('gambar/ai.jpg');

% Konversi RGB ke Grayscale
grayImage = rgb2gray(originalImage);

% Tampilkan gambar asli dan hasil konversi
figure;
subplot(1, 2, 1); imshow(originalImage); title('Citra RGB Asli');
subplot(1, 2, 2); imshow(grayImage); title('Citra Grayscale');