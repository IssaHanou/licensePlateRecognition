function varargout = program(varargin)
% PROGRAM MATLAB code for program.fig
%      PROGRAM, by itself, creates a new PROGRAM or raises the existing
%      singleton*.
%
%      H = PROGRAM returns the handle to a new PROGRAM or the handle to
%      the existing singleton*.
%
%      PROGRAM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROGRAM.M with the given input arguments.
%
%      PROGRAM('Property','Value',...) creates a new PROGRAM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before program_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to program_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help program

% Last Modified by GUIDE v2.5 10-Jan-2018 10:29:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @program_OpeningFcn, ...
                   'gui_OutputFcn',  @program_OutputFcn, ...
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


% --- Executes just before program is made visible.
function program_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to program (see VARARGIN)

run('dipstart.m');
dipimage;

% Choose default command line output for program
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes program wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = program_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in push  button1.
function pushbutton1_Callback(hObject, eventdata, handles)
%Read in the video
vidObj = VideoReader('project files/TrainingVideo.avi');
handles.output = hObject;
handles.vidObj = vidObj;
guidata(hObject,handles);

%Put the video in the axes
axes(handles.axes1);
data = readFrame(handles.vidObj);
h = get(handles.axes1, 'Children');
image(data);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
%Start the frameCount, keep empty timeStamp array, start the table empty
frameCount = 1;
timeStamps = [];
set(handles.uitable2, 'Data', {});
axes(handles.axes3);

%Keep getting frames till no more frames are left
while(hasFrame(handles.vidObj))
    vidFrame = readFrame(handles.vidObj);
    h = get(handles.axes3, 'Children');
    set(h, 'CData', vidFrame);
    guidata(hObject,handles);
    
    %Add current time to the timeStamps array
    timeStamps(end+1) = handles.vidObj.CurrentTime;
    
    if (mod(frameCount,3) == 0)        %Do only if you want less frames
        newPlate = processImage(vidFrame);
        
        %Get old data from the table
        data = get(handles.uitable2, 'Data');
        
        %Add the new plate to the table data
        newData = [data; {newPlate, frameCount, timeStamps(frameCount)}];
        set(handles.uitable2, 'Data', newData); 
    end
    frameCount = frameCount + 1;
end

%Get the output from the table
tableData = get(handles.uitable2, 'Data');
%results = getFinalData(tableData);
checkSolution(tableData, 'project files/trainingSolutions.mat');

% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% Close the figure and delete its contents
delete(hObject);
