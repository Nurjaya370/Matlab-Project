% Baca citra yang telah dimanipulasi dengan Gaussian Noise
citraGaussManipulasi = imread('gambar/koinblur.jpg');

% Tampilkan citra asli
figure;
subplot(1, 2, 1); imshow(citraGaussManipulasi); title('Citra dengan Noise');

% Lakukan dekonvolusi untuk menghilangkan Gaussian Noise
psf = fspecial('gaussian', 2, 3); % PSF (Point Spread Function) untuk Gaussian blur
estimatedImage = deconvblind(citraGaussManipulasi, psf);

% Tampilkan hasil dekonvolusi
subplot(1, 2, 2); imshow(estimatedImage); title('Citra Hasil Restorasi');
