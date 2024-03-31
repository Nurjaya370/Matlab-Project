% Baca gambar asli
originalImage = imread('gambar/koin.jpg');

% Tampilkan citra asli
imshow(originalImage);
title('Klik dan seret untuk memilih area potongan, tekan Enter ketika selesai');

% Biarkan pengguna memilih area dengan mengklik dan menyeret
h = imrect;
position = wait(h);

% Ambil bagian citra yang ada dalam kotak yang dipilih pengguna
roiImage = imcrop(originalImage, position);

% Tampilkan citra asli dan area yang dipotong
figure;
subplot(1, 2, 1); imshow(originalImage); title('Citra Asli');
subplot(1, 2, 2); imshow(roiImage); title('Area yang Dipotong');
