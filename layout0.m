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

% Last Modified by GUIDE v2.5 30-Jan-2017 12:48:42

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

I = imread('plant.jpg');

axes1 = gca;

% axes(handles.axesImage);
imshow(I);



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
I = imread('plant.jpg');

axes1 = gca;

% axes(handles.axesImage);
imshow(I);

%%%%%%%%%%%%%%%%%%%%%%%%%%%
I = double(I);
I1 = 0.2989*I(:,:,1)+0.5879*I(:,:,2)+0.1140*I(:,:,3);

I1=uint8(I1);

% 
% figure
% imshow(I1);
% 
% figure
% imhist(I1);
% 
% 
% I1p1 = imadjust(I1,[0 1],[0 1],0.25);
% I1p2 = imadjust(I1,[0 1],[0 1],0.5);
% I1p3 = imadjust(I1,[0 1],[0 1],0.75);
% I1p4 = imadjust(I1,[0 1],[0 1],1.5);
% 
% 
% figure
% imshow(I1p1);
% 
% figure
% imshow(I1p2);
% 
% figure
% imshow(I1p3);
% 
% figure
% imshow(I1p4);   
% 



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


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in ordered_dithering.
function ordered_dithering_Callback(hObject, eventdata, handles)
% hObject    handle to ordered_dithering (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
