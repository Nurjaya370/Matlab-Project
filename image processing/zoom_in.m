% Baca gambar asli
originalImage = imread('gambar/ai.jpg');

% Upsampling dengan faktor 2
upsampledImage = imresize(originalImage, 2, 'bilinear');

% Tampilkan citra asli dan hasil upsampling
figure;
subplot(1, 2, 1); imshow(originalImage); title('Citra Asli');
subplot(1, 2, 2); imshow(upsampledImage); title('Upsampling (Zoom In)');