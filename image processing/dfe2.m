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

% Deteksi tepi menggunakan metode Sobel
edgeImage = edge(grayImage, 'Sobel');

% Tentukan ambang batas untuk deteksi tepi
threshold = 0.1 * max(magnitude(:));

% Identifikasi piksel tepi
edgePixels = magnitude >= threshold;

% Inisialisasi citra hasil dengan citra asli dalam format RGB
resultImage = originalImage;

% Tandai objek yang terdeteksi dengan boundaribox merah
resultImage(repmat(edgePixels, [1, 1, 3])) = 255;

% Tampilkan hasil
figure;
subplot(1, 2, 1); imshow(originalImage); title('Citra Asli');
subplot(1, 2, 2); imshow(resultImage); title('Hasil Deteksi Objek');
