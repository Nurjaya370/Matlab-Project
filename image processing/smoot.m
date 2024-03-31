% Contoh penghalusan dengan filter rata-rata
originalImage = imread('gambar/pepper.png');

% Periksa apakah file gambar dapat dibaca dengan benar
if isempty(originalImage)
    error('Gagal membaca file gambar atau file gambar tidak ditemukan.');
end

% Tampilkan gambar asli
subplot(1, 2, 1);
imshow(originalImage);
title('Gambar Asli');

% Tampilkan hasil penghalusan
filter = fspecial('average', [3 3]); % Filter rata-rata 3x3
smoothedImage = imfilter(originalImage, filter);

subplot(1, 2, 2);
imshow(smoothedImage);
title('Hasil Penghalusan');
