originalImage = imread('gambar/salt.png');
noisyImage = imnoise(originalImage, 'salt & pepper', 0.05); % Tambahkan noise salt-and-pepper

% Filter median 3x3 pada setiap saluran warna
denoisedImage(:,:,1) = medfilt2(noisyImage(:,:,1), [3, 3]); % Saluran merah
denoisedImage(:,:,2) = medfilt2(noisyImage(:,:,2), [3, 3]); % Saluran hijau
denoisedImage(:,:,3) = medfilt2(noisyImage(:,:,3), [3, 3]); % Saluran biru

% Tampilkan citra
subplot(1, 2, 1); imshow(noisyImage); title('Citra Noisy');
subplot(1, 2, 2); imshow(uint8(denoisedImage)); title('Hasil Denoising');

