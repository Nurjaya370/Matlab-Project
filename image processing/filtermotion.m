% Baca citra yang telah dimanipulasi dengan efek blur
citraBlurManipulasi = imread('gambar/motion.jpg');

% Tampilkan citra asli
figure;
subplot(1, 2, 1); imshow(citraBlurManipulasi); title('Citra Asli dengan Efek Blur');

% Lakukan dekonvolusi untuk mengurangi efek blur
psf = fspecial('motion', 10, 20); % PSF (Point Spread Function) untuk motion blur
estimatedImage = deconvblind(citraBlurManipulasi, psf);

% Tampilkan hasil dekonvolusi
subplot(1, 2, 2); imshow(estimatedImage); title('Hasil Dekonvolusi untuk Mengurangi Efek Blur');
