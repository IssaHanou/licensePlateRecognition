function varargout = runGUI(varargin)
% RUNGUI MATLAB code for runGUI.fig
%      RUNGUI, by itself, creates a new RUNGUI or raises the existing
%      singleton*.
%
%      H = RUNGUI returns the handle to a new RUNGUI or the handle to
%      the existing singleton*.
%
%      RUNGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RUNGUI.M with the given input arguments.
%
%      RUNGUI('Property','Value',...) creates a new RUNGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before runGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to runGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help runGUI

% Last Modified by GUIDE v2.5 25-Jan-2018 10:23:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @runGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @runGUI_OutputFcn, ...
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


% --- Executes just before runGUI is made visible.
function runGUI_OpeningFcn(hObject, eventdata, handles, varargin)
%Start dipimage
run('dipstart.m');
dipimage;

% Choose default command line output for runGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes runGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = runGUI_OutputFcn(hObject, eventdata, handles) 
% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
%Read in the video
vidObj = VideoReader('project files/TrainingSet/Categorie II/Video225.avi');
handles.output = hObject;
handles.vidObj = vidObj;
guidata(hObject,handles);

%Put the video in the axes
axes(handles.axes1);
data = readFrame(handles.vidObj);
h = get(handles.axes1, 'Children');
image(data);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
%Start the frameCount, keep empty timeStamp array, start the table empty
frameCount = 1;
timeStamps = [];
set(handles.uitable1, 'Data', {});
axes(handles.axes1);

%Keep getting frames till no more frames are left
while(hasFrame(handles.vidObj))
    axes(handles.axes1);
    vidFrame = readFrame(handles.vidObj);
    h = get(handles.axes1, 'Children');
    set(h, 'CData', vidFrame);
    guidata(hObject,handles);
    
    %Add current time to the timeStamps array
    timeStamps(end+1) = handles.vidObj.CurrentTime;
    
    if (mod(frameCount,3) == 0)        %Do only if you want less frames
        [newPlate, plateImage] = processImage(vidFrame);
        
        %Put the plate in the second axes
        axes(handles.axes2);
        a = get(handles.axes2, 'Children');
        set(a, 'CData', plateImage);
        
        if ~isempty(newPlate)
            %Get old data from the table
            data = get(handles.uitable1, 'Data');

            %Add the new plate to the table data
            newData = [data; {newPlate, frameCount, timeStamps(frameCount)}];
            set(handles.uitable1, 'Data', newData); 
        end
    end
    frameCount = frameCount + 1;
end

%Get the output from the table
tableData = get(handles.uitable1, 'Data');
%results = getFinalData(tableData);
solution = checkSolution(tableData, 'TrainingSolutions');


% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% Close the figure and delete its contents
delete(hObject);
