% Baca citra asli
originalImage = imread('gambar/bendera.jpg');

% Tambahkan noise salt-and-pepper
noisyImage = imnoise(originalImage, 'salt & pepper', 0.05);

% Filter median 3x3 pada setiap saluran warna
denoisedImage(:,:,1) = medfilt2(noisyImage(:,:,1), [3, 3]); % Saluran merah
denoisedImage(:,:,2) = medfilt2(noisyImage(:,:,2), [3, 3]); % Saluran hijau
denoisedImage(:,:,3) = medfilt2(noisyImage(:,:,3), [3, 3]); % Saluran biru

% Tampilkan citra asli, citra noisy, dan citra yang telah dibersihkan dari noise
figure;
subplot(1, 3, 1); imshow(originalImage); title('Citra Asli');
subplot(1, 3, 2); imshow(noisyImage); title('Citra Noisy');
subplot(1, 3, 3); imshow(uint8(denoisedImage)); title('Hasil Denoising');

% Parameter untuk bilateral filter
sigmaSpatial = 2; % parameter spasial
sigmaIntensity = 0.1; % parameter intensitas

% Lakukan bilateral filter pada citra yang telah dibersihkan dari noise
restoredImage = bilateralFilter(double(denoisedImage), sigmaSpatial, sigmaIntensity);

% Normalisasi hasil restorasi untuk ditampilkan
restoredImage = uint8((restoredImage - min(restoredImage(:))) / (max(restoredImage(:)) - min(restoredImage(:))) * 255);

% Tampilkan hasil restorasi
figure;
subplot(1, 2, 1); imshow(denoisedImage); title('Citra yang Telah Dibersihkan dari Noise');
subplot(1, 2, 2); imshow(restoredImage); title('Hasil Restorasi dengan Bilateral Filter');
