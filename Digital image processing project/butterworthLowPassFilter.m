function varargout = butterworthLowPassFilter(varargin)
% BUTTERWORTHLOWPASSFILTER MATLAB code for butterworthLowPassFilter.fig
%      BUTTERWORTHLOWPASSFILTER, by itself, creates a new BUTTERWORTHLOWPASSFILTER or raises the existing
%      singleton*.
%
%      H = BUTTERWORTHLOWPASSFILTER returns the handle to a new BUTTERWORTHLOWPASSFILTER or the handle to
%      the existing singleton*.
%
%      BUTTERWORTHLOWPASSFILTER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BUTTERWORTHLOWPASSFILTER.M with the given input arguments.
%
%      BUTTERWORTHLOWPASSFILTER('Property','Value',...) creates a new BUTTERWORTHLOWPASSFILTER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before butterworthLowPassFilter_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to butterworthLowPassFilter_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help butterworthLowPassFilter

% Last Modified by GUIDE v2.5 19-May-2022 01:41:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @butterworthLowPassFilter_OpeningFcn, ...
                   'gui_OutputFcn',  @butterworthLowPassFilter_OutputFcn, ...
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


% --- Executes just before butterworthLowPassFilter is made visible.
function butterworthLowPassFilter_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to butterworthLowPassFilter (see VARARGIN)

% Choose default command line output for butterworthLowPassFilter
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes butterworthLowPassFilter wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = butterworthLowPassFilter_OutputFcn(hObject, eventdata, handles) 
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
[filename pathname]=uigetfile({'*.jpg';'*.png'},'File Selector');
global original
original=strcat(pathname,filename);
global image
image=imread(original);
global rows
global columns
[rows,columns,matrixno]=size(image);
global input_image
axes(handles.axes1);
imshow(input_image);
%check if it is RGB image
if size(image,3)==3
    input_image=rgb2gray(image);
end
axes(handles.axes1);
imshow(input_image);





function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global FT_img
global rows
global columns
global input_image
global s;
FT_img=fft2(double(input_image));
global D0
D0=str2num(get(handles.edit1,'String'));
n=2*str2num(get(handles.edit2,'String'));
%Designing filter
u=0:(rows-1);
idx=find(u>rows/2);
u(idx)=u(idx)-rows;
v=0:(columns-1);
idy=find(v>columns/2);
v(idy)=v(idy)-columns;
% matlab function meshgrid (v,u) returns 
% 2D GRID which contains the coordinate of vectors 
% v and u . matrix v with each row is a copy
%of v and matrix u with each column is a copy of u
[V,U]=meshgrid(v,u);

%calculating Euclidean Distance 
D=sqrt(U.^2+V.^2);
D=D./D0;
%comparing with the cutoff frequency and
%determining the filtering mask
H=1./((1+D).^columns);
%convulution between the Fourier Transformed
%image and the mask
G=H.*FT_img;
%getting the resultant image by Inverse fourier Transform 
%of the convoluted image using matlab library functio
%iff2(2d INVERSE fast fourier transform)
global output_image
output_image=real(ifft2(double(G)));
s=output_image;
axes(handles.axes2);
imshow(output_image,[ ]);


% --- Executes during object creation, after setting all properties.
function uipanel1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
ha = axes('units','normalized', ...
            'position',[0 0 1 1]);
% Move the background axes to the bottom
uistack(ha,'bottom');
% Load in a background image and display it using the correct colors
% The image used below, is in the Image Processing Toolbox.  If you do not have %access to this toolbox, you can use another image file instead.
I=imread('back.jpg');
hi = imagesc(I)
colormap gray
% Turn the handlevisibility off so that we don't inadvertently plot into the axes again
% Also, make the axes invisible
set(ha,'handlevisibility','off', ...
            'visible','off')
% Now we can use the figure, as required.
% For example, we can put a plot in an axes
axes('position',[0,0,0,0])
plot(rand(10))


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s;

[baseFileName, folder] = uiputfile({'.jpg';'.bmp';'.jpg';'.jpeg';'*.png'}, 'Specify a file');%open save box (making specify a file 'title'
if baseFileName == 0
	% User clicked the Cancel button.
	return;
end
fullFileName = fullfile(folder, baseFileName) 
imwrite( s, fullFileName);


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton4.
function pushbutton4_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
composite_laplacian;

% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close;
butterworthhighpassfilter;
