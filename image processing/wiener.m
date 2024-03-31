% Baca citra yang ingin di-denoise
citraNoise = imread('gambar/motion.jpg');

% Tentukan ukuran PSF dan SNR (Signal-to-Noise Ratio)
ukuranPSF = [5, 5];
snr = 10;

% Proses setiap saluran warna secara terpisah
citraDenoisedWiener = zeros(size(citraNoise));
for channel = 1:3
    channelNoise = citraNoise(:,:,channel);
    channelDenoised = wiener2(channelNoise, ukuranPSF, 10^(snr/10));
    citraDenoisedWiener(:,:,channel) = channelDenoised;
end

% Tampilkan hasil denoising menggunakan filter Wiener
subplot(1, 2, 1);
imshow(citraNoise);
title('Citra Asli dengan Gaussian Noise');

subplot(1, 2, 2);
imshow(uint8(citraDenoisedWiener));
title('Hasil Denoising dengan Filter Wiener');
