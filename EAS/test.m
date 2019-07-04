function varargout = test(varargin)
% TEST MATLAB code for test.fig
%      TEST, by itself, creates a new TEST or raises the existing
%      singleton*.
%
%      H = TEST returns the handle to a new TEST or the handle to
%      the existing singleton*.
%
%      TEST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEST.M with the given input arguments.
%
%      TEST('Property','Value',...) creates a new TEST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before test_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to test_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help test

% Last Modified by GUIDE v2.5 01-Jul-2019 21:40:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @test_OpeningFcn, ...
                   'gui_OutputFcn',  @test_OutputFcn, ...
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


% --- Executes just before test is made visible.
function test_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to test (see VARARGIN)

% Choose default command line output for test
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes test wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = test_OutputFcn(hObject, eventdata, handles) 
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
A = im2double(mySet);
r=A(:,:,1);
g=A(:,:,2);
b=A(:,:,3);
c = 1-r;
m = 1-g;
y = 1-b;
CMY = cat(3,c,m,y);
guidata(hObject, handles);%menyimpan obyek gambar
axes(handles.axes2); %memilih axes1 sebagai letak gambar yang dimunculkan
imshow(CMY); %menampilkan gambar


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mySet = handles.mySet;
A = im2double(mySet);
r=A(:,:,1);
g=A(:,:,2);
b=A(:,:,3);
Y = 0.3*r+0.59*g+0.11*b;
I = 0.6*r-0.28*g-0.32*b;
Q = 0.21*r-0.52*g+0.31*b;
YIQ = cat(3,Y,I,Q);
guidata(hObject, handles);%menyimpan obyek gambar
axes(handles.axes2); %memilih axes1 sebagai letak gambar yang dimunculkan
imshow(YIQ); %menampilkan gambar

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mySet = handles.mySet;
rgbImage = mySet;
YCBCR = rgb2ycbcr(rgbImage);
guidata(hObject, handles);%menyimpan obyek gambar
axes(handles.axes2); %memilih axes1 sebagai letak gambar yang dimunculkan
imshow(YCBCR); %menampilkan gambar

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
mySet = handles.mySet;
rgbImage = mySet;
mySet = handles.mySet;
HSV=rgb2hsv(rgbImage);
guidata(hObject, handles);%menyimpan obyek gambar
axes(handles.axes2); %memilih axes1 sebagai letak gambar yang dimunculkan
imshow(HSV); %menampilkan gambar
