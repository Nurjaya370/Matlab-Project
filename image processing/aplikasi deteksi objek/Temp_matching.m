function varargout = Temp_matching(varargin)
% TEMP_MATCHING MATLAB code for Temp_matching.fig
%      TEMP_MATCHING, by itself, creates a new TEMP_MATCHING or raises the existing
%      singleton*.
%
%      H = TEMP_MATCHING returns the handle to a new TEMP_MATCHING or the handle to
%      the existing singleton*.
%
%      TEMP_MATCHING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEMP_MATCHING.M with the given input arguments.
%
%      TEMP_MATCHING('Property','Value',...) creates a new TEMP_MATCHING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Temp_matching_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Temp_matching_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Temp_matching

% Last Modified by GUIDE v2.5 02-Jan-2024 20:38:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Temp_matching_OpeningFcn, ...
                   'gui_OutputFcn',  @Temp_matching_OutputFcn, ...
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


% --- Executes just before Temp_matching is made visible.
function Temp_matching_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Temp_matching (see VARARGIN)

% Choose default command line output for Temp_matching
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Temp_matching wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Temp_matching_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
handles=guidata(gcbo);
[namafile,direktori]=uigetfile({'*.jpg';'*.bmp';'*.Gif';'*.png'},'buka gambar');
if isequal(namafile,0)
    return;
end
fullpath = fullfile(direktori, namafile);
gbr1=imread(fullpath);
set(handles.figure1,'CurrentAxes',handles.axes1);
set(imshow(gbr1));
set (handles.axes1,'Userdata',gbr1);
info=imfinfo(fullpath);
set(handles.nama,'string',info.Filename);
set(handles.ukuran,'string',info.FileSize);
set(handles.warna,'string',info.ColorType);
set(handles.btntemplate,'enable','on');
set(handles.btnclear,'enable','on');


% --- Executes on button press in btntemplate.
function btntemplate_Callback(hObject, eventdata, handles)
handles=guidata(gcbo);
[namafile,direktori]=uigetfile({'*.jpg';'*.bmp';'*.Gif';'*.png'},'buka gambar');
if isequal(namafile,0)
    return;
end
fullpath = fullfile(direktori, namafile);
gbr2=imread(fullpath);
set(handles.figure1,'CurrentAxes',handles.axes2);
set(imshow(gbr2));
set (handles.axes2,'Userdata',gbr2);
info1=imfinfo(fullpath);
set(handles.nama1,'string',info1.Filename);
set(handles.ukuran1,'string',info1.FileSize);
set(handles.warna1,'string',info1.ColorType);
set(handles.btndetect,'enable','on');



% --- Executes on button press in btndetect.
function btndetect_Callback(hObject, eventdata, handles)
% 1. Inisialisasi citra yang akan diolah

frame =get(handles.nama,'String');                                         
if isempty(frame)                                                          
msgbox('frame tidak boleh kosong...!','konfirmasi');         
    return                                                                   
end  
tmplt =get(handles.nama1,'String');                                         
if isempty(tmplt)                                                          
msgbox('Terjadi Kesalahan Input, template tidak boleh kosong...!','konfirmasi');         
    return                                                                   
end

korelasi1;


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
pilihan=questdlg(['anda yakin ingin keluar dari aplikasi ',' ?'],...%fungsi untuk memanggil kotak dialog pertanyaan
    ['Keluar','...'],...
    'ya','tidak','ya');
if strcmp(pilihan,'tidak')%jika pilihan tidak maka akan tetap/lanjut pada form aplikasi
    return;
end
close;%selain itu menutup form


% --- Executes on button press in btnclear.
function btnclear_Callback(hObject, eventdata, handles)
proyek=guidata(gcbo);
set(proyek.figure1,'CurrentAxes',proyek.axes1);
cla;
set(proyek.figure1,'CurrentAxes',proyek.axes2);
cla;
proyek2=guidata(gcbo);
pesan='';
set(proyek2.nama,'string',pesan);
set(proyek2.ukuran,'string',pesan);
set(proyek2.warna,'string',pesan);
set(proyek2.nama1,'string',pesan);
set(proyek2.ukuran1,'string',pesan);
set(proyek2.warna1,'string',pesan);
