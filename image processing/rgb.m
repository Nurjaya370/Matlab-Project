function varargout = rgb(varargin)
% RGB MATLAB code for rgb.fig
%      RGB, by itself, creates a new RGB or raises the existing
%      singleton*.
%
%      H = RGB returns the handle to a new RGB or the handle to
%      the existing singleton*.
%
%      RGB('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RGB.M with the given input arguments.
%
%      RGB('Property','Value',...) creates a new RGB or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before rgb_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to rgb_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help rgb

% Last Modified by GUIDE v2.5 22-Dec-2023 14:31:48

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @rgb_OpeningFcn, ...
                   'gui_OutputFcn',  @rgb_OutputFcn, ...
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


% --- Executes just before rgb is made visible.
function rgb_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to rgb (see VARARGIN)

% Choose default command line output for rgb
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes rgb wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = rgb_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in bt_open.
function bt_open_Callback(hObject, eventdata, handles)
[filename, pathname] = uigetfile('*.*','Ambil Gambar');
addr = fullfile(pathname, filename);
I = imread(addr);
imshow(I, 'Parent', handles.axes1);
info=imfinfo(addr);
set(handles.nama,'string',info.Filename);


% --- Executes on button press in bt_red.
function bt_red_Callback(hObject, eventdata, handles)
showColorChannel(hObject, eventdata, handles, 'R');


%imshow(xxx,'parent' handles.axes3);


% --- Executes on button press in bt_green.
function bt_green_Callback(hObject, eventdata, handles)
showColorChannel(hObject, eventdata, handles, 'G');


% --- Executes on button press in bt_blue.
function bt_blue_Callback(hObject, eventdata, handles)
showColorChannel(hObject, eventdata, handles, 'B');


% --- Executes on button press in bt_close.
function bt_close_Callback(hObject, eventdata, handles)
pilihan=questdlg(['anda yakin ingin keluar dari aplikasi ',' ?'],...%fungsi untuk memanggil kotak dialog pertanyaan
    ['Keluar','...'],...
    'ya','tidak','ya');
if strcmp(pilihan,'tidak')%jika pilihan tidak maka akan tetap/lanjut pada form aplikasi
    return;
end
close;%selain itu menutup form


% --- Executes on button press in bt_pixel.
function bt_pixel_Callback(hObject, eventdata, handles)
% Panggil fungsi showPixelValues untuk mendapatkan nilai piksel di sekitar titik
pixelValues = showPixelValues(hObject, eventdata, handles);
% Ubah matriks tiga dimensi ke matriks dua dimensi
numChannels = size(pixelValues, 3);
reshapedData = reshape(pixelValues, [], numChannels);
% Buat figure baru untuk menampilkan tabel
f=figure;
annotation(f,'textbox',[0.0285 0.91551724137931 0.93025 0.0586206896551724],'String',{'NILAI PIXEL DI AREA TERPILIH'},...
'HorizontalAlignment','center','FontWeight','bold','FontSize',14,'FitBoxToText','off');
% Buat tabel di dalam figure
colNames = cell(1, numChannels);
  for i = 1:numChannels
    colNames{i} = ['Channel ' num2str(i)];
  end

uitable('Data', reshapedData, 'ColumnName', colNames, 'Position', [150, 50, 300, 320]);



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
