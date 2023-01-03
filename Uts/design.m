function varargout = design(varargin)
% DESIGN MATLAB code for design.fig
%      DESIGN, by itself, creates a new DESIGN or raises the existing
%      singleton*.
%
%      H = DESIGN returns the handle to a new DESIGN or the handle to
%      the existing singleton*.
%
%      DESIGN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DESIGN.M with the given input arguments.
%
%      DESIGN('Property','Value',...) creates a new DESIGN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before design_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to design_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help design

% Last Modified by GUIDE v2.5 11-May-2022 20:09:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @design_OpeningFcn, ...
                   'gui_OutputFcn',  @design_OutputFcn, ...
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


% --- Executes just before design is made visible.
function design_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to design (see VARARGIN)

% Choose default command line output for design
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes design wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = design_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in search.
function search_Callback(hObject, eventdata, handles)
% hObject    handle to search (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file, path] = uigetfile('*.jpg;*.jpeg;*.png');
image = imread(fullfile(path, file));
handles.image = image;
guidata(hObject, handles);
axes(handles.axes3);
imshow(image);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
picture = handles.image;
faceDetector = vision.CascadeObjectDetector;
detection = faceDetector(picture);
border = insertObjectAnnotation(picture, 'rectangle', detection, 'face');
axes(handles.axes4);
imshow(border);
getRed = picture(:,:,1);
getGreen = picture(:,:,2);
getBlue = picture(:,:,3);
count = size(detection,1);
a=figure('visible', 'off');
    for index = 1:size(detection)
        redFace = getRed(detection(index, 2):detection(index, 2)+detection(index, 4) , detection(index, 1):detection(index, 1)+detection(index, 3));
        greenFace = getGreen(detection(index, 2):detection(index, 2)+detection(index, 4) , detection(index, 1):detection(index, 1)+detection(index, 3));
        blueFace = getBlue(detection(index, 2):detection(index, 2)+detection(index, 4) , detection(index, 1):detection(index, 1)+detection(index, 3));
        subplot(2, count/2, index);
        d = imshow(cat(3, redFace, greenFace, blueFace));title('aku');       
    end
saveas(a, sprintf('test%d.jpg', index));
imageSplited = imread(sprintf('test%d.jpg', index));
axes(handles.axes5)
imshow(imageSplited);

% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
