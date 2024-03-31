originalImage = imread('gambar/bendera.jpg');
se = strel('disk', 5); % Elemen struktur berbentuk disk dengan radius 5
erodedImage = imerode(originalImage, se);
figure;
subplot(1, 2, 1); imshow(originalImage); title('Gambar Asli');
subplot(1, 2, 2); imshow(erodedImage); title('Hasil Erosi');
