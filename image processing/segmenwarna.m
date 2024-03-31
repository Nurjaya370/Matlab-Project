% Membaca gambar berwarna
rgbImage = imread('gambar/koin.jpg');

% Mendefinisikan batas atas dan bawah untuk segmen warna tertentu
lowerBound = [0, 100, 100];  % Contoh: rentang warna untuk merah
upperBound = [30, 255, 255];

% Mengonversi citra ke ruang warna HSV
hsvImage = rgb2hsv(rgbImage);

% Membuat citra biner berdasarkan segmen warna
binaryImage = (hsvImage(:,:,1) >= lowerBound(1)/360) & ...
              (hsvImage(:,:,1) <= upperBound(1)/360) & ...
              (hsvImage(:,:,2) >= lowerBound(2)/100) & ...
              (hsvImage(:,:,2) <= upperBound(2)/100) & ...
              (hsvImage(:,:,3) >= lowerBound(3)/100) & ...
              (hsvImage(:,:,3) <= upperBound(3)/100);

% Menampilkan hasil
figure;
subplot(1, 2, 1);
imshow(rgbImage);
title('Gambar Asli');

subplot(1, 2, 2);
imshow(binaryImage);
title('Hasil Segmentasi Warna');
