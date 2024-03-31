function varargout = DISPLAY(varargin)
% DISPLAY MATLAB code for DISPLAY.fig
%      DISPLAY, by itself, creates a new DISPLAY or raises the existing
%      singleton*.
%
%      H = DISPLAY returns the handle to a new DISPLAY or the handle to
%      the existing singleton*.
%
%      DISPLAY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DISPLAY.M with the given input arguments.
%
%      DISPLAY('Property','Value',...) creates a new DISPLAY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DISPLAY_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DISPLAY_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DISPLAY

% Last Modified by GUIDE v2.5 30-Dec-2023 10:18:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DISPLAY_OpeningFcn, ...
                   'gui_OutputFcn',  @DISPLAY_OutputFcn, ...
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


% --- Executes just before DISPLAY is made visible.
function DISPLAY_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DISPLAY (see VARARGIN)

% Choose default command line output for DISPLAY
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DISPLAY wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DISPLAY_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in hapus.
function hapus_Callback(hObject, eventdata, handles)
% Membersihkan gambar di axes
cla(handles.axes1, 'reset');  % 'reset' akan menghapus gambar dan mereset axes

% Menghapus data di uitable
emptyData = cell(0, 0);  % Membuat sel kosong
set(handles.uitable1, 'Data', emptyData, 'ColumnName', {}, 'RowName', {});



% --- Executes on button press in gambar.
function gambar_Callback(hObject, eventdata, handles)
[filename, pathname] = uigetfile('*.*','Ambil Gambar');
addr = fullfile(pathname, filename);
I = imread(addr);
imshow(I, 'Parent', handles.axes1); % Menampilkan gambar di axes1 (pastikan axes1 telah didefinisikan di GUI)
[x, y, z] = size(I);
% Menyajikan data pixel ke dalam bentuk sel untuk ditampilkan di uitable
cellData = cell(x, y * z);
for i = 1:z
    for j = 1:x
        for k = 1:y
            cellData{j, (i - 1) * y + k} = I(j, k, i);
        end
    end
end

    % Menentukan kolom dan baris tabel
numRows = size(cellData, 1);
numCols = size(cellData, 2);

    % Membuat kolom dan baris yang sesuai dengan ukuran gambar
colNames = cell(1, numCols);
  for i = 1:numCols
     colNames{i} = ['Pixel ' num2str(i)];
  end
 % Memasukkan data ke dalam tabel
set(handles.uitable1, 'Data', cellData, 'ColumnName', colNames, 'RowName', []);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
