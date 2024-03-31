% Contoh citra biner 1
image1 = logical([0 1 0; 1 1 0; 0 0 1]);

% Contoh citra biner 2
image2 = logical([1 0 1; 0 1 1; 1 0 0]);

% Implementasi operasi AND logika
resultAND = image1 & image2;

% Implementasi operasi OR logika
resultOR = image1 | image2;

% Implementasi operasi NOT logika pada image1
resultNOT = ~image1;

% Menampilkan citra-citra hasil
subplot(2, 3, 1); imshow(image1); title('Citra 1');
subplot(2, 3, 2); imshow(image2); title('Citra 2');
subplot(2, 3, 3); imshow(resultAND); title('AND Logika');
subplot(2, 3, 4); imshow(resultOR); title('OR Logika');
subplot(2, 3, 5); imshow(resultNOT); title('NOT Logika');
