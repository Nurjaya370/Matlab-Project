% Baca citra
originalImage = imread('gambar/koin.jpg');
% Konversi ke skala abu-abu
grayImage = rgb2gray(originalImage);
% Tentukan variabel linguistik
brightness = fuzzyVariable('Brightness', [0 255]);

% Fungsi keanggotaan untuk kecerahan
brightness.addMF('Low', 'trimf', [0 0 128]);
brightness.addMF('Medium', 'trimf', [0 128 255]);
brightness.addMF('High', 'trimf', [128 255 255]);
% Aturan fuzzy
rule1 = 'If Brightness is Low then Object is Dark';
rule2 = 'If Brightness is Medium then Object is Moderate';
rule3 = 'If Brightness is High then Object is Bright';
% Inferensi fuzzy
fuzzySys = fuzzySystem([rule1; rule2; rule3]);
result = evalfis([grayImage(:)], fuzzySys);
% Defuzzifikasi
detectedObject = defuzz(brightness, result, 'centroid');
% Tampilkan hasil
figure;
subplot(1, 2, 1); imshow(originalImage); title('Citra Asli');
subplot(1, 2, 2); imshow(detectedObject); title('Deteksi Objek');
