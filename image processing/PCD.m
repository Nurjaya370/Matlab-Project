function varargout = PCD(varargin)
% PCD MATLAB code for PCD.fig
%      PCD, by itself, creates a new PCD or raises the existing
%      singleton*.
%
%      H = PCD returns the handle to a new PCD or the handle to
%      the existing singleton*.
%
%      PCD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PCD.M with the given input arguments.
%
%      PCD('Property','Value',...) creates a new PCD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PCD_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PCD_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PCD

% Last Modified by GUIDE v2.5 25-Dec-2023 00:40:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PCD_OpeningFcn, ...
                   'gui_OutputFcn',  @PCD_OutputFcn, ...
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


% --- Executes just before PCD is made visible.
function PCD_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PCD (see VARARGIN)

% Choose default command line output for PCD
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes PCD wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = PCD_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function show_Callback(hObject, eventdata, handles)
a=get(handles.nama, 'String');
figure;
set(imshow(a));



% --------------------------------------------------------------------
function reset_Callback(hObject, eventdata, handles)
a=get(handles.figure1, 'Userdata');
set(handles.figure1,'CurrentAxes',handles.axes1);
set(imshow(a));
set(handles.axes1,'Userdata',a);


% --------------------------------------------------------------------
function Untitled_29_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function potong_Callback(hObject, eventdata, handles)
imcrop;


% --------------------------------------------------------------------
function rotasi_Callback(hObject, eventdata, handles)
proyek=guidata(gcbo);
a=get(proyek.axes1, 'Userdata');
A=imrotate(a,90,'bilinear');
cla;
set(proyek.figure1,'CurrentAxes',proyek.axes1)
set(imshow(A));
set(handles.axes1,'Userdata',A);



% --------------------------------------------------------------------
function pengkaburan_Callback(hObject, eventdata, handles)
proyek = guidata(gcbo);
a = get(proyek.axes1, 'Userdata');
A = fspecial('gaussian', 2, 3);

PSF = imfilter(a, A, 'symmetric', 'conv');
set(proyek.figure1, 'CurrentAxes', proyek.axes1)
imshow(PSF);
set(handles.axes1, 'Userdata', PSF);



% --------------------------------------------------------------------
function sharperning_Callback(hObject, eventdata, handles)
proyek = guidata(gcbo);
a = get(proyek.axes1, 'Userdata');
A = fspecial('unsharp');

PSF = imfilter(a, A, 'replicate');
set(proyek.figure1, 'CurrentAxes', proyek.axes1)
imshow(PSF);
set(handles.axes1, 'Userdata', PSF);


% --------------------------------------------------------------------
function kecerahan_Callback(hObject, eventdata, handles)
proyek = guidata(gcbo);
a = get(proyek.axes1, 'Userdata');
A = imadjust(a,[0 0.2],[0.5 1]);

set(proyek.figure1, 'CurrentAxes', proyek.axes1)
imshow(A);
set(handles.axes1, 'Userdata', A);


% --------------------------------------------------------------------
function Gerak_Callback(hObject, eventdata, handles)
proyek = guidata(gcbo);
a = get(proyek.axes1, 'Userdata');
A = fspecial('motion', 10, 20);

PSF = imfilter(a, A, 'symmetric', 'conv');
set(proyek.figure1, 'CurrentAxes', proyek.axes1)
imshow(PSF);
set(handles.axes1, 'Userdata', PSF);


% --------------------------------------------------------------------
function sobel_Callback(hObject, eventdata, handles)
proyek = guidata(gcbo);
a = get(proyek.axes1, 'Userdata');
A = fspecial('sobel');

PSF = imfilter(a, A, 'symmetric', 'conv');
set(proyek.figure1, 'CurrentAxes', proyek.axes1)
imshow(PSF);
set(handles.axes1, 'Userdata', PSF);


% --------------------------------------------------------------------
function perubahan_Callback(hObject, eventdata, handles)





% --------------------------------------------------------------------
function Untitled_21_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function buka_Callback(hObject, eventdata, handles)
[filename, pathname] = uigetfile('*.*','Ambil Gambar');
addr = fullfile(pathname, filename);
info=imfinfo(addr);
set(handles.nama,'string',info.Filename);
I = imread(addr);
set(handles.figure1,'CurrentAxes',handles.axes1);
set(imshow(I));
set(handles.axes1,'Userdata',I);
set(handles.figure1,'Userdata',I);



% --------------------------------------------------------------------
function simpan_Callback(hObject, eventdata, handles)
[namafile, direktori] = uiputfile({'*.jpg';'*.png';'*.bmp';'*.tiff'},'Simpan Gambar');
addr = fullfile(namafile);
I = get(handles.axes1,'Userdata');
imwrite(I,addr);
msgbox('gambar berhasil di simpan');


% --------------------------------------------------------------------
function tutup_Callback(hObject, eventdata, handles)
cla;


% --------------------------------------------------------------------
function atur_Callback(hObject, eventdata, handles)
pagesetupdlg;


% --------------------------------------------------------------------
function pratinjau_Callback(hObject, eventdata, handles)
printpreview;


% --------------------------------------------------------------------
function cetak_Callback(hObject, eventdata, handles)
printdlg;


% --------------------------------------------------------------------
function keluar_Callback(hObject, eventdata, handles)
pilihan=questdlg(['anda yakin ingin keluar dari aplikasi ',' ?'],...%fungsi untuk memanggil kotak dialog pertanyaan
    ['Keluar','...'],...
    'ya','tidak','ya');
if strcmp(pilihan,'tidak')%jika pilihan tidak maka akan tetap/lanjut pada form aplikasi
    return;
end
close;%selain itu menutup form


% --------------------------------------------------------------------
function salt_Callback(hObject, eventdata, handles)
proyek = guidata(gcbo);
a = get(proyek.axes1, 'Userdata');
A = imnoise(a,'salt & pepper', 0.02);

set(proyek.figure1, 'CurrentAxes', proyek.axes1)
set(imshow(A));
set(handles.axes1, 'Userdata', A);


% --------------------------------------------------------------------
function speckle_Callback(hObject, eventdata, handles)
proyek = guidata(gcbo);
a = get(proyek.axes1, 'Userdata');
A = imnoise(a,'speckle', 0.02);

set(proyek.figure1, 'CurrentAxes', proyek.axes1)
set(imshow(A));
set(handles.axes1, 'Userdata', A);


% --------------------------------------------------------------------
function gauss_Callback(hObject, eventdata, handles)
proyek = guidata(gcbo);
a = get(proyek.axes1, 'Userdata');
A = imnoise(a,'gaussian');

set(proyek.figure1, 'CurrentAxes', proyek.axes1)
set(imshow(A));
set(handles.axes1, 'Userdata', A);


% --------------------------------------------------------------------
function ZoomIn_Callback(hObject, eventdata, handles)
zoom on;


% --------------------------------------------------------------------
function ZoomOut_Callback(hObject, eventdata, handles)
zoom out;
zoom off;


function nama_Callback(hObject, eventdata, handles)
% hObject    handle to nama (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nama as text
%        str2double(get(hObject,'String')) returns contents of nama as a double


% --- Executes during object creation, after setting all properties.
function nama_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nama (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
