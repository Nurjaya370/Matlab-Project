% Baca citra
originalImage = imread('gambar/A.jpg');

% Konversi ke citra grayscale
grayImage = rgb2gray(originalImage);

% Hitung Transformasi Fourier
fftImage = fft2(grayImage);
fftImageShifted = fftshift(fftImage);
magnitudeSpectrum = log(1 + abs(fftImageShifted));

% Tampilkan hasil
subplot(1, 2, 1);
imshow(grayImage);
title('Citra Grayscale');

subplot(1, 2, 2);
imshow(magnitudeSpectrum, []);
title('Transformasi Fourier');
