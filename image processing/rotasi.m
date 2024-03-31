% Baca gambar asli
originalImage = imread('gambar/capture1.jpg');

% Rotasi citra sejauh 45 derajat dengan interpolasi bilinear
rotatedImage = imrotate(originalImage, 45, 'bilinear');

% Tampilkan citra asli dan hasil rotasi
figure;
subplot(1, 2, 1); imshow(originalImage); title('Citra Asli');
subplot(1, 2, 2); imshow(rotatedImage); title('Rotasi (45 derajat)');
