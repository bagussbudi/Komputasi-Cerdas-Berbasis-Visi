function varargout = UAS(varargin)
% UAS MATLAB code for UAS.fig
%      UAS, by itself, creates a new UAS or raises the existing
%      singleton*.
%
%      H = UAS returns the handle to a new UAS or the handle to
%      the existing singleton*.
%
%      UAS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UAS.M with the given input arguments.
%
%      UAS('Property','Value',...) creates a new UAS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before UAS_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to UAS_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help UAS

% Last Modified by GUIDE v2.5 09-Jul-2019 19:49:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @UAS_OpeningFcn, ...
                   'gui_OutputFcn',  @UAS_OutputFcn, ...
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


% --- Executes just before UAS is made visible.
function UAS_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to UAS (see VARARGIN)

% Choose default command line output for UAS
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes UAS wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = UAS_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[namafile, formatfile] = uigetfile({'*.*'}, 'membuka gambar'); %memilih gambar
image = imread([formatfile, namafile]); %membaca gambar
handles.mySet = image;
guidata(hObject, handles);%menyimpan obyek gambar
axes(handles.axes1); %memilih axes1 sebagai letak gambar yang dimunculkan
imshow(image); %menampilkan gambar

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mySet = handles.mySet;
Grei = rgb2gray(mySet);
guidata(hObject, handles);%menyimpan obyek gambar
axes(handles.axes2); %memilih axes1 sebagai letak gambar yang dimunculkan
imshow(Grei); %menampilkan gambar

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mySet = handles.mySet;
Negatip = 255 -mySet;
guidata(hObject, handles);%menyimpan obyek gambar
axes(handles.axes2); %memilih axes1 sebagai letak gambar yang dimunculkan
imshow(Negatip); %menampilkan gambar

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mySet = handles.mySet;
gray=rgb2gray(mySet);
thresh=graythresh(gray);
imbw=im2bw(gray,thresh);
guidata(hObject, handles);%menyimpan obyek gambar
axes(handles.axes2); %memilih axes1 sebagai letak gambar yang dimunculkan
imshow(imbw); %menampilkan gambar
