function bacagambar(hObject, eventdata, handles)
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
 R = x(:, :, 1);
 G = x(:, :, 2);
 B = x(:, :, 3);
end
