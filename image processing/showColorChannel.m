function showColorChannel(hObject, eventdata, handles, channel)
    xx = get(handles.nama, 'String');
    if isempty(xx)
        msgbox('Frame tidak boleh kosong...!', 'konfirmasi');
        return
    end

    x = imread(xx);

    % Pastikan x adalah gambar RGB
    if size(x, 3) ~= 3
        msgbox('Gambar harus berwarna (RGB) untuk menampilkan histogram.', 'Error', 'error');
        return;
    end

    switch upper(channel)
        case 'R'
            channelData = x(:, :, 1);
            axes(handles.axes2);
        case 'G'
            channelData = x(:, :, 2);
            axes(handles.axes4);
        case 'B'
            channelData = x(:, :, 3);
            axes(handles.axes6);
        otherwise
            error('Channel tidak valid');
    end
    imhist(channelData, 256);

    % Tampilkan saluran warna di axes yang sesuai
    channelImage = zeros(size(x), 'like', x);
    switch upper(channel)
        case 'R'
            channelImage(:, :, 1) = channelData;
            axes(handles.axes3);
        case 'G'
            channelImage(:, :, 2) = channelData;
            axes(handles.axes5);
        case 'B'
            channelImage(:, :, 3) = channelData;
            axes(handles.axes7);
    end
    imshow(channelImage, 'Parent', gca);
end
