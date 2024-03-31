% Baca gambar asli
originalImage = imread('gambar/ai.jpg');

% Downsampling dengan faktor 0.5
downsampledImage = imresize(originalImage, 0.5, 'bilinear');

% Tampilkan citra asli dan hasil downsampling
figure;
subplot(1, 2, 1); imshow(originalImage); title('Citra Asli');
subplot(1, 2, 2); imshow(downsampledImage); title('Downsampling (Zoom Out)');
