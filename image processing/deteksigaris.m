% Baca citra
originalImage = imread('gambar/capture1.jpg');

% Konversi ke citra grayscale
grayImage = rgb2gray(originalImage);

% Deteksi garis dengan Transformasi Hough
[H, T, R] = hough(edge(grayImage, 'canny'));
P = houghpeaks(H, 5);
lines = houghlines(grayImage, T, R, P);

% Menampilkan hasil
imshow(originalImage);
hold on;
for k = 1:length(lines)
    xy = [lines(k).point1; lines(k).point2];
    plot(xy(:,1), xy(:,2), 'LineWidth', 2, 'Color', 'red');
end
title('Deteksi Garis (Hough Transform)');
