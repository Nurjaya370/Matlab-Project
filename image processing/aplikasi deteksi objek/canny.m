function varargout = canny(varargin)
% CANNY MATLAB code for canny.fig
%      CANNY, by itself, creates a new CANNY or raises the existing
%      singleton*.
%
%      H = CANNY returns the handle to a new CANNY or the handle to
%      the existing singleton*.
%
%      CANNY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CANNY.M with the given input arguments.
%
%      CANNY('Property','Value',...) creates a new CANNY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before canny_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to canny_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help canny

% Last Modified by GUIDE v2.5 02-Jan-2024 15:37:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @canny_OpeningFcn, ...
                   'gui_OutputFcn',  @canny_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before canny is made visible.
function canny_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to canny (see VARARGIN)

% Choose default command line output for canny
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes canny wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = canny_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnopen.
function btnopen_Callback(hObject, eventdata, handles)

    proyek = guidata(gcbo);
    [namafile, direktori] = uigetfile({'*.jpg';'*.bmp';'*.Gif';'*.png'}, 'buka gambar');

    if isequal(namafile, 0)
        return;
    end

    fullpath = fullfile(direktori, namafile);
    gbr1 = imread(fullpath);
    
    set(proyek.figure1, 'CurrentAxes', proyek.axes1);
    imshow(gbr1);
    set(proyek.axes1, 'Userdata', gbr1);
    
    info = imfinfo(fullpath);
    set(proyek.nama, 'string', info.Filename);
    set(proyek.ukuran, 'string', info.FileSize);
    set(proyek.warna, 'string', info.ColorType);
    set(proyek.btndetect, 'enable', 'on');
    set(proyek.btnclear, 'enable', 'on');
    

% --- Executes on button press in btnsimpan.
function btnsimpan_Callback(hObject, eventdata, handles)
    [namafile, direktori] = uiputfile({'*.jpg';'*.png';'*.bmp';'*.tiff'}, 'Simpan Gambar');

    if isequal(namafile, 0)
        return;
    end

    I = get(handles.axes1, 'Userdata');
    imwrite(I, fullfile(direktori, namafile));
    msgbox('Gambar berhasil di simpan');

    % Tampilkan informasi gambar yang baru saja disimpan
    info = imfinfo(fullfile(direktori, namafile));
    set(handles.nama1, 'string', info.Filename);
    set(handles.ukuran1, 'string', info.FileSize);
    set(handles.warna1, 'string', info.ColorType);



% --- Executes on button press in btndetect.
function btndetect_Callback(hObject, eventdata, handles)
    % 1. Inisialisasi citra yang akan diolah
    a = get(handles.nama, 'String');
    if isempty(a)
        msgbox('Frame tidak boleh kosong...!', 'Konfirmasi');
        return
    end

    % Baca citra berwarna (RGB)
    colorImage = imread(a);

    % Ubah menjadi citra grayscale
    grayImage = rgb2gray(colorImage);

    % Deteksi tepi menggunakan metode Canny
    edgeImage = edge(grayImage, 'Canny');

    % Hapus noise dengan operasi morfologi
    se = strel('disk', 2);
    cleanedImage = imclose(edgeImage, se);

    % Tentukan batas area untuk deteksi objek
    areaThreshold = 500;

    % Deteksi objek menggunakan fungsi bwconncomp
    cc = bwconncomp(cleanedImage);
    stats = regionprops(cc, 'Area', 'BoundingBox');

    % Filter objek berdasarkan luasnya
    selectedObjects = find([stats.Area] > areaThreshold);

    % Tampilkan hasil di axes2
    axes(handles.axes2);
    imshow(colorImage); hold on;
    for i = 1:length(selectedObjects)
        rectangle('Position', stats(selectedObjects(i)).BoundingBox, 'EdgeColor', 'r', 'LineWidth', 2);
    end
    hold off;
    set(handles.btnsimpan,'enable','on');
    


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
pilihan=questdlg(['anda yakin ingin keluar dari aplikasi kembai ke menu utama ',' ?'],...%fungsi untuk memanggil kotak dialog pertanyaan
    ['Keluar','...'],...
    'ya','tidak','ya');
if strcmp(pilihan,'tidak')%jika pilihan tidak maka akan tetap/lanjut pada form aplikasi
    return;
end
close;%selain itu menutup form
master;

% --- Executes on button press in btnclear.
function btnclear_Callback(hObject, eventdata, handles)
set(handles.figure1,'CurrentAxes',handles.axes1);
cla;
set(handles.figure1,'CurrentAxes',handles.axes2);
cla;
pesan='';
set(handles.nama,'string',pesan);
set(handles.ukuran,'string',pesan);
set(handles.warna,'string',pesan);
set(handles.nama1,'string',pesan);
set(handles.ukuran1,'string',pesan);
set(handles.warna1,'string',pesan);
msgbox('proses cleaning berhasil,,silahkan inputkan gambar yang ingin dideteksi');
