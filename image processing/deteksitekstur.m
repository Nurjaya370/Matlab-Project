% Baca citra
originalImage = imread('gambar/koin.jpg');

% Konversi ke citra grayscale
grayImage = rgb2gray(originalImage);

% Hitung GLCM
glcm = graycomatrix(grayImage, 'Offset', [0 1], 'Symmetric', true);

% Hitung fitur tekstur
contrast = graycoprops(glcm, 'Contrast');
correlation = graycoprops(glcm, 'Correlation');
energy = graycoprops(glcm, 'Energy');
homogeneity = graycoprops(glcm, 'Homogeneity');

% Tampilkan hasil
disp('Fitur Tekstur:');
disp(['Contrast: ', num2str(contrast.Contrast)]);
disp(['Correlation: ', num2str(correlation.Correlation)]);
disp(['Energy: ', num2str(energy.Energy)]);
disp(['Homogeneity: ', num2str(homogeneity.Homogeneity)]);
% Tampilkan hasil
subplot(1, 2, 1);
imshow(grayImage);
title('Citra Grayscale');

subplot(1, 2, 2);
imshow(glcm, []);
title('Gray-Level Co-occurrence Matrix (GLCM)');
