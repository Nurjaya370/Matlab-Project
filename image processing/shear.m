% Baca citra
originalImage = imread('gambar/pepper.png');

% Tentukan faktor shear (shear factor)
shearFactor = 0.2;

% Terapkan shear menggunakan affine2d
tform = affine2d([1 shearFactor 0; 0 1 0; 0 0 1]);
shearedImage = imwarp(originalImage, tform);

% Tampilkan hasil
figure;
subplot(1, 2, 1); imshow(originalImage); title('Citra Asli');
subplot(1, 2, 2); imshow(shearedImage); title('Hasil Shear');
