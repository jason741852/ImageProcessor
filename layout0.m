function varargout = layout0(varargin)
% LAYOUT0 MATLAB code for layout0.fig
%      LAYOUT0, by itself, creates a new LAYOUT0 or raises the existing
%      singleton*.
%
%      H = LAYOUT0 returns the handle to a new LAYOUT0 or the handle to
%      the existing singleton*.
%
%      LAYOUT0('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LAYOUT0.M with the given input arguments.
%
%      LAYOUT0('Property','Value',...) creates a new LAYOUT0 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before layout0_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to layout0_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help layout0

% Last Modified by GUIDE v2.5 30-Jan-2017 15:47:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @layout0_OpeningFcn, ...
                   'gui_OutputFcn',  @layout0_OutputFcn, ...
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


% --- Executes just before layout0 is made visible.
function layout0_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to layout0 (see VARARGIN)

% Choose default command line output for layout0
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes layout0 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
[FileName,PathName] = uigetfile('*.jpg','Select the MATLAB code file');
FilePath = strcat(PathName,FileName);
I = imread(FilePath);
imshow(I);

% Save file path in handle for other callback functions
handles = guidata(hObject);
handles.imgPath=FilePath;
guidata(hObject, handles);



% --- Outputs from this function are returned to the command line.
function varargout = layout0_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in grayscale.
function grayscale_Callback(hObject, eventdata, handles)
img = handles.imgPath;
I = imread(img);

I = double(I);
I1 = 0.2989*I(:,:,1)+0.5879*I(:,:,2)+0.1140*I(:,:,3);

I1=uint8(I1);
imshow(I1);
 
figure
imhist(I1);




% hObject    handle to grayscale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in original_image.
function original_image_Callback(hObject, eventdata, handles)
% hObject    handle to original_image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

img = handles.imgPath;
I = imread(img);
imshow(I);


% --- Executes on button press in gamma_xformation.
function gamma_xformation_Callback(hObject, eventdata, handles)
% hObject    handle to gamma_xformation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

img = handles.imgPath;
I = imread(img);

I = double(I);
I1 = 0.2989*I(:,:,1)+0.5879*I(:,:,2)+0.1140*I(:,:,3);

I1=uint8(I1);

I1p1 = imadjust(I1,[0 1],[0 1],0.25);
I1p2 = imadjust(I1,[0 1],[0 1],0.5);
I1p3 = imadjust(I1,[0 1],[0 1],0.75);
I1p4 = imadjust(I1,[0 1],[0 1],1.5);

figure
subplot(2, 4, 1);
imshow(I1p1);
title('gamma=0.25');
subplot(2, 4, 5);
imhist(I1p1);
subplot(2, 4, 2);
imshow(I1p2);
title('gamma=0.50');
subplot(2, 4, 6);
imhist(I1p2);

subplot(2, 4, 3);
imshow(I1p3);
title('gamma=0.75');
subplot(2, 4, 7);
imhist(I1p3);
subplot(2, 4, 4);
imshow(I1p4);
title('gamma=1.5');
subplot(2, 4, 8);
imhist(I1p4);

% --- Executes on button press in ordered_dithering.
function ordered_dithering_Callback(hObject, eventdata, handles)
% hObject    handle to ordered_dithering (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

img = handles.imgPath;
I = imread(img);

%%%%%%%%%%%%%%%%%%%%%%%%%%%
I = double(I);
I1 = 0.2989*I(:,:,1)+0.5879*I(:,:,2)+0.1140*I(:,:,3);


I2=uint8(I1);

D1 = [0 2;3 1];
D2 = [0 8 2 10; 12 4 14 6; 3 11 1 9; 15 7 13 5];
D3 = [0 32 8 40 2 34 10 42;48 16 56 24 50 18 58 26;12 44 4 36 14 46 6 38;60 28 52 20 62 30 54 22;3 35 11 43 1 33 9 41;51 19 59 27 49 17 57 25;15 47 7 39 13 45 5 37;63 31 55 23 61 29 53 21]; 

O1 = zeros(size(I2));
O2 = zeros(size(I2));
O3 = zeros(size(I2));
I2 = I2./(256/5);

for x=1:size(I2,1)
    for y=1:size(I2,2)
        i=mod(x,size(D1,1));
        j=mod(y,size(D1,1));
        i=i+1;
        j=j+1;
        if I2(x,y) > D1(i,j)
            O1(x,y)=1;
        else
            O1(x,y)=0;
        end
    end
end


for x=1:size(I2,1)
    for y=1:size(I2,2)
        i=mod(x,size(D2,1));
        j=mod(y,size(D2,1));
        i=i+1;
        j=j+1;
        if I2(x,y) > D2(i,j)
            O2(x,y)=1;
        else
            O2(x,y)=0;
        end
    end
end


for x=1:size(I2,1)
    for y=1:size(I2,2)
        i=mod(x,size(D3,1));
        j=mod(y,size(D3,1));
        i=i+1;
        j=j+1;
        if I2(x,y) > D3(i,j)
            O3(x,y)=1;
        else
            O3(x,y)=0;
        end
    end
end

figure
subplot(1,3,1);
imshow(O1);
subplot(1,3,2);
imshow(O2);
subplot(1,3,3);
imshow(O3);


% --- Executes on button press in sharp_filter.
function sharp_filter_Callback(hObject, eventdata, handles)
% hObject    handle to sharp_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

img = handles.imgPath;
I = imread(img);

I = double(I);
I1 = 0.2989*I(:,:,1)+0.5879*I(:,:,2)+0.1140*I(:,:,3);

H=fspecial('average',[3,3]);
Xb=double(I1);

Xg=double(I1);
%using the H=gaussian filter from Task 3.3
Xg=imfilter(Xg,H,'symmetric','same');

c=0.63;
X1=((c/((2*c)-1))*Xb)-(((1-c)/((2*c)-1))*Xg);
X1=uint8(X1);
imshow(X1);

figure
imhist(X1);

% --- Executes on button press in blur_filter.
function blur_filter_Callback(hObject, eventdata, handles)
% hObject    handle to blur_filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

img = handles.imgPath;
I = imread(img);

I = double(I);
I1 = 0.2989*I(:,:,1)+0.5879*I(:,:,2)+0.1140*I(:,:,3);

I1=wextend('2D','sym',I1,[6,6]);
[r,c]=size(I1);
X1=zeros(r,c);

for i=7:r-6
    for j=7:c-6
        for m=i-6:i+6
           for n=j-6:j+6
               X1(i,j)=X1(i,j)+I1(m,n);            
           end
        end
        X1(i,j)=X1(i,j)./139;
    end
end

%remove first and last rows
X1=X1(7:size(X1,1)-6,:);
%remove first and last column
X1=X1(:,7:size(X1,2)-6);


X1=uint8(X1);

imshow(X1)

figure
imhist(X1)
