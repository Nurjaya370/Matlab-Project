% Baca citra
originalImage = imread('gambar/koin.jpg');

% Tentukan titik-titik sudut pada citra asli dan titik-titik sudut pada citra hasil
originalPoints = [115, 230; 365, 200; 460, 590; 30, 500];
desiredPoints = [1, 1; 600, 1; 600, 800; 1, 800];

% Hitung matriks transformasi perspektif
tform = fitgeotrans(originalPoints, desiredPoints, 'projective');

% Terapkan transformasi perspektif
perspectiveImage = imwarp(originalImage, tform);

% Tampilkan hasil
figure;
subplot(1, 2, 1); imshow(originalImage); title('Citra Asli');
subplot(1, 2, 2); imshow(perspectiveImage); title('Hasil Perspective Transform');
