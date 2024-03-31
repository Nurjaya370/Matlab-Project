% Baca gambar asli
originalImage = imread('gambar/koin.jpg');


% Tampilkan citra asli
figure;
imshow(originalImage);
title('Gambar Asli - Klik dan gambar ROI (elips)');

% Biarkan pengguna menggambar ROI dengan elips
h = imellipse;
position = wait(h);

% Ambil posisi elips yang digambar pengguna
roiMask = createMask(h);

% Terapkan mask pada citra asli untuk mendapatkan area yang dipotong
roiImage = bsxfun(@times, originalImage, cast(roiMask, class(originalImage)));

% Tampilkan citra area yang dipotong
figure;
imshow(roiImage);
title('Area yang Dipotong (ROI)');
