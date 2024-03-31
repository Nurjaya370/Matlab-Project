function pixelValues = showPixelValues(hObject, eventdata, handles)
    % Ambil koordinat titik dari pengguna
    [x, y] = ginput(1); % Pengguna klik satu kali pada gambar untuk memilih titik

    % Ambil gambar dari axes
    img = getimage(handles.axes1);

    % Tentukan region yang ingin ditampilkan
    windowSize = 15; % Ukuran window (misalnya, 5x5)
    rowStart = max(1, round(y) - windowSize);
    rowEnd = min(size(img, 1), round(y) + windowSize);
    colStart = max(1, round(x) - windowSize);
    colEnd = min(size(img, 2), round(x) + windowSize);

    % Ambil nilai piksel dari region yang ditentukan
    regionValues = img(rowStart:rowEnd, colStart:colEnd, :);

    % Tampilkan nilai piksel menggunakan disp
    disp('Nilai Piksel di Sekitar Titik:');
    disp(regionValues);

    % Kembalikan nilai piksel
    pixelValues = regionValues;
end
