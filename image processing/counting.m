gambar = imread('gambar/koin.jpg');
gray = rgb2gray(gambar);
thresh = graythresh(gray);
imbw = im2bw(gray, thresh);
[labeled, numObjects] = bwlabel(imbw, 8);
imlabel = label2rgb(labeled, @spring, 'c', 'shuffle');

% Menampilkan citra biner
subplot(1, 2, 1);
imshow(imbw);
title('Citra Biner');

% Menampilkan citra yang telah diwarnai berdasarkan objek
subplot(1, 2, 2);
imshow(imlabel);
title('Citra dengan Label');

% Menampilkan jumlah objek
fprintf('Jumlah Objek: %d\n', numObjects);
