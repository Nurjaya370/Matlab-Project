% Baca citra berwarna (RGB)
colorImage = imread('gambar/capture1.jpg');

% Ubah menjadi citra grayscale
grayImage = rgb2gray(colorImage);

% Deteksi tepi menggunakan metode Canny
edgeImage = edge(grayImage, 'Canny');

% Hapus noise dengan operasi morfologi
se = strel('disk', 2);
cleanedImage = imclose(edgeImage, se);

% Tentukan batas area untuk deteksi objek
areaThreshold = 500;

% Deteksi objek menggunakan fungsi bwconncomp
cc = bwconncomp(cleanedImage);
stats = regionprops(cc, 'Area', 'BoundingBox');

% Filter objek berdasarkan luasnya
selectedObjects = find([stats.Area] > areaThreshold);

% Tampilkan hasil
figure;
imshow(cleanedImage); hold on;
for i = 1:length(selectedObjects)
    rectangle('Position', stats(selectedObjects(i)).BoundingBox, 'EdgeColor', 'r', 'LineWidth', 2);
end
title('Deteksi tepi dengan algoritma canny');
hold off;