function varargout = tugaspertemuan9(varargin)
% TUGASPERTEMUAN9 MATLAB code for tugaspertemuan9.fig
%      TUGASPERTEMUAN9, by itself, creates a new TUGASPERTEMUAN9 or raises the existing
%      singleton*.
%
%      H = TUGASPERTEMUAN9 returns the handle to a new TUGASPERTEMUAN9 or the handle to
%      the existing singleton*.
%
%      TUGASPERTEMUAN9('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TUGASPERTEMUAN9.M with the given input arguments.
%
%      TUGASPERTEMUAN9('Property','Value',...) creates a new TUGASPERTEMUAN9 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tugaspertemuan9_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tugaspertemuan9_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tugaspertemuan9

% Last Modified by GUIDE v2.5 14-Jun-2022 10:09:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tugaspertemuan9_OpeningFcn, ...
                   'gui_OutputFcn',  @tugaspertemuan9_OutputFcn, ...
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


% --- Executes just before tugaspertemuan9 is made visible.
function tugaspertemuan9_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tugaspertemuan9 (see VARARGIN)

% Choose default command line output for tugaspertemuan9
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes tugaspertemuan9 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tugaspertemuan9_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in filter.
function filter_Callback(hObject, eventdata, handles)
% hObject    handle to filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns filter contents as cell array
%        contents{get(hObject,'Value')} returns selected item from filter


% --- Executes during object creation, after setting all properties.
function filter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in noise.
function noise_Callback(hObject, eventdata, handles)
% hObject    handle to noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns noise contents as cell array
%        contents{get(hObject,'Value')} returns selected item from noise


% --- Executes during object creation, after setting all properties.
function noise_CreateFcn(hObject, eventdata, handles)
% hObject    handle to noise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in browse.
function browse_Callback(hObject, eventdata, handles)
% hObject    handle to browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file, path] =uigetfile('*.jpg;*.png;*.jpeg;');
image = imread(fullfile(path, file));
handles.object = image;
guidata(hObject, handles);
axes(handles.axes1);
imshow(image);

% --- Executes on button press in proccess.
function proccess_Callback(hObject, eventdata, handles)
% hObject    handle to proccess (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
options = handles.noise.String;
selected = handles.noise.Value;
selectedNoise = options{selected};

filterItem = handles.filter.String;
choicest = handles.filter.Value;
choicest = filterItem{choicest};
image = handles.object;
if (string(selectedNoise) == 'Pilih Noise')
    switch (string(choicest))
        case 'Pilih Filter'
            axes(handles.axes2);
            imshow(image);
        case 'median filter'
             red = image(:,:,1);
             green = image(:,:,2);
             blue = image(:,:,3);
             getRed = medfilt2(red);
             getGreen = medfilt2(green);
             getBlue = medfilt2(blue);
             image = cat(3, getRed, getGreen, getBlue);
             axes(handles.axes2);
             imshow(image);
        otherwise
             filter = fspecial(string(choicest));
            axes(handles.axes2);
            imshow(imfilter(image,filter));
    end
  
elseif(string(selectedNoise) == 'localvar')
       image = imnoise(image, 'localvar',0.05*rand(size(image)));
       switch(string(choicest))
           case 'Pilih Filter'
               axes(handles.axes2);
               imshow(image);
           case 'median filter'
               image = imnoise(image, 'localvar',0.05*rand(size(image)));
               red = image(:,:,1);
               green = image(:,:,2);
               blue = image(:,:,3);
               getRed = medfilt2(red);
               getGreen = medfilt2(green);
               getBlue = medfilt2(blue);
               image = cat(3, getRed, getGreen, getBlue);
               axes(handles.axes2);
               imshow(image);
           otherwise
               filter = fspecial(string(choicest));
               axes(handles.axes2);
               imshow(imfilter(image,filter));
       end
else
    switch(string(choicest))
        case 'Pilih Filter'
            gambar = imnoise(image, selectedNoise);
            axes(handles.axes2);
            imshow(gambar);
        case 'median filter'
            image = imnoise(image,selectedNoise);
            red = image(:,:,1);
            green = image(:,:,2);
            blue = image(:,:,3);
            getRed = medfilt2(red);
            getGreen = medfilt2(green);
            getBlue = medfilt2(blue);
            image = cat(3, getRed, getGreen, getBlue);
            axes(handles.axes2);
            imshow(image);
        otherwise
            image = imnoise(image, selectedNoise);
            filter = fspecial(string(choicest));
            axes(handles.axes2);
            imshow(imfilter(image,filter));
    end
    
end
