% Baca citra
originalImage = imread('gambar/koin.jpg');
grayImage = rgb2gray(originalImage);

% Filter Sobel untuk deteksi tepi
sobelHorizontal = fspecial('sobel');
sobelVertical = sobelHorizontal';

% Konvolusi dengan filter Sobel
edgeX = imfilter(double(grayImage), sobelHorizontal);
edgeY = imfilter(double(grayImage), sobelVertical);

% Hitung magnitudo dan arah
magnitude = sqrt(edgeX.^2 + edgeY.^2);
direction = atan2d(edgeY, edgeX);

% Tampilkan hasil
figure;
subplot(2, 2, 1); imshow(grayImage); title('Citra Asli');
subplot(2, 2, 2); imshow(uint8(magnitude)); title('Magnitudo');
subplot(2, 2, 3); imshow(uint8(direction)); title('Arah');
subplot(2, 2, 4); imshow(edge(grayImage, 'Sobel')); title('Deteksi Tepi (Sobel)');
