% Baca gambar asli
originalImage = imread('gambar/ai.jpg');

% Informasi sebelum kompresi
originalSize = size(originalImage);
originalResolution = sprintf('%d x %d pixels', originalSize(1), originalSize(2));

% Gunakan imfinfo untuk mendapatkan informasi ukuran file
originalInfo = imfinfo('gambar/ai.jpg');
originalFileSize = originalInfo.FileSize;
bitdept = originalInfo.BitDepth;


fprintf('Informasi Sebelum Kompresi:\n');
fprintf('Ukuran Gambar: %s\n', originalResolution);
fprintf('Ukuran File: %d bytes\n\n', originalFileSize);
fprintf('Ukuran Kerapatan Bit: %d bytes\n\n', bitdept);


% Simpan gambar dalam format PNG (lossless)
imwrite(originalImage, 'gambar/compressed_image.png');

% Baca gambar yang telah dikompresi
compressedImage = imread('gambar/compressed_image.png');

% Informasi setelah kompresi
compressedSize = size(compressedImage);
compressedResolution = sprintf('%d x %d pixels', compressedSize(1), compressedSize(2));

% Gunakan imfinfo untuk mendapatkan informasi ukuran file setelah kompresi
compressedInfo = imfinfo('gambar/compressed_image.png');
compressedFileSize = compressedInfo.FileSize;
bitdept2 = compressedInfo.BitDepth;

fprintf('Informasi Setelah Kompresi:\n');
fprintf('Ukuran Gambar: %s\n', compressedResolution);
fprintf('Ukuran File: %d bytes\n', compressedFileSize);
fprintf('Ukuran Kerapatan bit: %d bytes\n', bitdept2);
imshow(compressedImage);