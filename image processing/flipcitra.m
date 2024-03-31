% Baca gambar asli
originalImage = imread('gambar/capture1.jpg');

% Flip citra secara horizontal
flippedHorizontal = flip(originalImage, 2);

% Flip citra secara vertikal
flippedVertical = flip(originalImage, 1);

% Tampilkan citra asli dan hasil flip
figure;
subplot(1, 3, 1); imshow(originalImage); title('Citra Asli');
subplot(1, 3, 2); imshow(flippedHorizontal); title('Flip Horizontal');
subplot(1, 3, 3); imshow(flippedVertical); title('Flip Vertikal');
