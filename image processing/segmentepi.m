% Membaca citra grayscale 
grayImage = imread('edges_example.jpg'); 
% Menggunakan operator Sobel untuk deteksi tepi 
edgeImage = edge(grayImage, 'Sobel'); 
% Menampilkan hasil 
figure; 
subplot(1, 2, 1); 
imshow(grayImage); 
title('Citra Grayscale'); 
subplot(1, 2, 2); 
imshow(edgeImage); 
title('Hasil Segmentasi Tepi (Sobel)'); 