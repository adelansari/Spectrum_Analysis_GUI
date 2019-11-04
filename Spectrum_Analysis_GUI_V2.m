function varargout = Spectrum_Analysis_GUI_V2(varargin)
% Spectrum_Analysis_GUI_V2 MATLAB code for Spectrum_Analysis_GUI_V2.fig
%      Spectrum_Analysis_GUI_V2, by itself, creates a new Spectrum_Analysis_GUI_V2 or raises the existing
%      singleton*.
%
%      H = Spectrum_Analysis_GUI_V2 returns the handle to a new Spectrum_Analysis_GUI_V2 or the handle to
%      the existing singleton*.
%
%      Spectrum_Analysis_GUI_V2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in Spectrum_Analysis_GUI_V2.M with the given input arguments.
%
%      Spectrum_Analysis_GUI_V2('Property','Value',...) creates a new Spectrum_Analysis_GUI_V2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Spectrum_Analysis_GUI_V2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Spectrum_Analysis_GUI_V2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Spectrum_Analysis_GUI_V2

% Last Modified by GUIDE v2.5 26-Apr-2014 10:51:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Spectrum_Analysis_GUI_V2_OpeningFcn, ...
                   'gui_OutputFcn',  @Spectrum_Analysis_GUI_V2_OutputFcn, ...
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


% --- Executes just before Spectrum_Analysis_GUI_V2 is made visible.
function Spectrum_Analysis_GUI_V2_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Spectrum_Analysis_GUI_V2 (see VARARGIN)

% Choose default command line output for Spectrum_Analysis_GUI_V2
handles.output = hObject;

axes(handles.axes1)
energy = 0;
countSec = 0;
plot(energy, countSec,'LineWidth',1);
xlabel('Channel');
ylabel('Counts');
grid; 
axis([0 3 0 25])


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Spectrum_Analysis_GUI_V2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Spectrum_Analysis_GUI_V2_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in open.
function open_Callback(~, ~, handles)

global channel;
global countsTotal;
global path;

%% Loading input file

[file path] = uigetfile({'*.txt';'*.dat';'*.xls';'*.xlsx'},'Open file'); 
if isequal(file,0)
  h = msgbox('Open file canceled');
else

input= fullfile(path,file);

[~, ~, ext] = fileparts(input);

if strcmpi(ext,'.txt') || strcmpi(ext,'.dat')

spectrumDataTotal = load(input);
%% Preparing data for channel and total counts

channel = spectrumDataTotal(:,1);
countsTotal = spectrumDataTotal(:,2);

%% Seting buttons enabled on
set(handles.time,'Enable','on');
set(handles.ch1,'Enable','on');
set(handles.en1,'Enable','on');
set(handles.ch2,'Enable','on');
set(handles.en2,'Enable','on');
set(handles.scan,'Enable','on');
set(handles.scan_Log,'Enable','on')
set(handles.strength,'Enable','on');
set(handles.solidangle,'Enable','on');
set(handles.countChannel,'Enable','on');
set(handles.countEnergy,'Enable','on');
set(handles.log,'Enable','on');
set(handles.reset,'Enable','on');

elseif strcmpi(ext,'.xls') || strcmpi(ext,'.xlsx')
   spectrumDataTotal = xlsread(input,'A:B');
   %% Preparing data for channel and total counts

channel = spectrumDataTotal(:,1);
countsTotal = spectrumDataTotal(:,2);

%% Seting buttons enabled on
set(handles.time,'Enable','on');
set(handles.ch1,'Enable','on');
set(handles.en1,'Enable','on');
set(handles.ch2,'Enable','on');
set(handles.en2,'Enable','on');
set(handles.scan,'Enable','on');
set(handles.scan_Log,'Enable','on')
set(handles.strength,'Enable','on');
set(handles.solidangle,'Enable','on');
set(handles.countChannel,'Enable','on');
set(handles.countEnergy,'Enable','on');
set(handles.log,'Enable','on');
set(handles.reset,'Enable','on');
else
    errordlg('No file selected','Wrong file extension');
end

%
end

function time_Callback(~, ~, handles)

%% Checking the sign of time
time = str2double(get(handles.time,'String'));

if time <= 0
    errordlg('Time must be a positive number.','Input error');
    set(handles.ch1,'Enable','off');
    set(handles.en1,'Enable','off');
    set(handles.ch2,'Enable','off');
    set(handles.en2,'Enable','off');
    set(handles.scan,'Enable','off');
    set(handles.scan_Log,'Enable','off');
    set(handles.strength,'Enable','off');
    set(handles.solidangle,'Enable','off');
    set(handles.countChannel,'Enable','off');
    set(handles.countEnergy,'Enable','off');
    set(handles.log,'Enable','off');
    set(handles.reset,'Enable','off');
else
    set(handles.ch1,'Enable','on');
    set(handles.en1,'Enable','on');
    set(handles.ch2,'Enable','on');
    set(handles.en2,'Enable','on');
    set(handles.scan,'Enable','on');
    set(handles.scan_Log,'Enable','on');
    set(handles.strength,'Enable','on');
    set(handles.solidangle,'Enable','on');
    set(handles.countChannel,'Enable','on');
    set(handles.countEnergy,'Enable','on');
    set(handles.log,'Enable','on');
    set(handles.reset,'Enable','on');
end
%%

% --- Executes during object creation, after setting all properties.
function time_CreateFcn(hObject, ~, ~)
% hObject    handle to time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ch1_Callback(~, ~, handles)
%% Checking the sign of channel value

ch1 = str2double(get(handles.ch1,'String'));

if ch1 <= 0
    errordlg('Channel number must be a positive number.','Input error');
    set(handles.time,'Enable','off');
    set(handles.en1,'Enable','off');
    set(handles.ch2,'Enable','off');
    set(handles.en2,'Enable','off');
    set(handles.scan,'Enable','off');
    set(handles.scan_Log,'Enable','off');
    set(handles.strength,'Enable','off');
    set(handles.solidangle,'Enable','off');
    set(handles.countChannel,'Enable','off');
    set(handles.countEnergy,'Enable','off');
    set(handles.log,'Enable','off');
    set(handles.reset,'Enable','off');
else
    set(handles.time,'Enable','on');
    set(handles.en1,'Enable','on');
    set(handles.ch2,'Enable','on');
    set(handles.en2,'Enable','on');
    set(handles.scan,'Enable','on');
    set(handles.scan_Log,'Enable','on');
    set(handles.strength,'Enable','on');
    set(handles.solidangle,'Enable','on');
    set(handles.countChannel,'Enable','on');
    set(handles.countEnergy,'Enable','on');
    set(handles.log,'Enable','on');
    set(handles.reset,'Enable','on');
end

% --- Executes during object creation, after setting all properties.
function ch1_CreateFcn(hObject, ~, ~)
% hObject    handle to ch1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function en1_Callback(~, ~, handles)

%% Checking the sign of energy value

en1 = str2double(get(handles.en1,'String'));

if en1 <= 0
    errordlg('Energy must be a positive number.','Input error');
    set(handles.time,'Enable','off');
    set(handles.ch1,'Enable','off');
    set(handles.ch2,'Enable','off');
    set(handles.en2,'Enable','off');
    set(handles.scan,'Enable','off');
    set(handles.scan_Log,'Enable','off');
    set(handles.strength,'Enable','off');
    set(handles.solidangle,'Enable','off');
    set(handles.countChannel,'Enable','off');
    set(handles.countEnergy,'Enable','off');
    set(handles.log,'Enable','off');
    set(handles.reset,'Enable','off');
else
    set(handles.time,'Enable','on');
    set(handles.ch1,'Enable','on');
    set(handles.ch2,'Enable','on');
    set(handles.en2,'Enable','on');
    set(handles.scan,'Enable','on');
    set(handles.scan_Log,'Enable','on');
    set(handles.strength,'Enable','on');
    set(handles.solidangle,'Enable','on');
    set(handles.countChannel,'Enable','on');
    set(handles.countEnergy,'Enable','on');
    set(handles.log,'Enable','on');
    set(handles.reset,'Enable','on');
end


% --- Executes during object creation, after setting all properties.
function en1_CreateFcn(hObject, ~, ~)
% hObject    handle to en1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in scan.
function scan_Callback(~, ~, handles)

global channel;
global countsTotal;
global path;

cla(handles.axes1,'reset');                             % Clear axes1

%% Read input parameters
time = str2double(get(handles.time,'String'));
ch1 = str2double(get(handles.ch1,'String'));
en1 = str2double(get(handles.en1,'String'));

ch2 = str2double(get(handles.ch2,'String'));
en2 = str2double(get(handles.en2,'String'));

strength_inp = str2double(get(handles.strength,'String'));
solidangle = str2double(get(handles.solidangle,'String'));

%% Checking input values

if time<=0 || ch1<=0 || ch2 <=0 || en1<=0 || en2<=0 || strength_inp<=0 || solidangle <=0
    ;
else

strength = strength_inp*(1e-6)*3.7*1e10;

%% Calculate energy and countSec En = a + b*Ch

b = (en2 - en1)/(ch2 - ch1);
a = en1 - b * ch1;  

countSec = countsTotal/(time*60);
energy = a + b * channel;

%% Ploting Energy vs CountSec
axes(handles.axes1)

plot(energy, countSec,'LineWidth',1);
xlabel('Energy (MeV)');
ylabel('Counts/Sec');
title('Energy vs. Counts/Sec');
axis([0 max(energy) 0 max(countSec)]); 
grid; 
hold on;

%% Peak find algorithm

countSecM = medfilt1(countSec);                      % Median filter
countSecSmooth = smooth(energy,countSecM);           % Smoothing    

countSecLog = log(countSecSmooth);                  % Making log data
countSecLogSmooth = smooth(countSecLog,0.05,'rloess');      % Smoothing

% Finding the positions of maximums using  peakdet function

[maxtabPos, mintabPos] = peakdet(countSecLogSmooth, 0.5);    
                                                            
%Excluding first unwonted peak and coresponting data

newE = energy([2*maxtabPos(1): length(energy)]);            
       
newC = countSecLogSmooth([2*maxtabPos(1): length(countSecLogSmooth)]);

% Applying peakdet agein to this cut data right positions  of peaks are found 
[maxtabPos1, mintabPos1] = peakdet(newC, 0.5);         

% The values for energy and countSec for peaks will be

for i=1:length(maxtabPos1)
    peakCount(i) = countSecSmooth(maxtabPos1(i)+2*maxtabPos(1));
    peakEnergy(i) = energy(maxtabPos1(i)+2*maxtabPos(1));
    peak_Fin_Pos(i) = maxtabPos1(i)+2*maxtabPos(1);
end

% Ploting peaks
plot(peakEnergy, peakCount, 'r^','markerfacecolor',[1 0 0]);


%% Calculating the values for peaks

%Finding the values of amplituse, mean, sig, fwhm, resolution, area and
%total area of each peak using localFit function. Area is required for peak
%efficiency calculation and total area for STD peak efficiency calculation.

for n=1:4
    [pA(n), pMu(n), pSig(n), pfwhm(n), pres(n)] = ...
        localFit(energy, countSec, peak_Fin_Pos(n));
    [area(n), areaTot(n)] = localFitArea(channel,countSec,peak_Fin_Pos(n));
end

% Calculating peak efficiency
peakefficiency(1) = (area(1)/(strength*solidangle/(4*3.14)))*100;
peakefficiency(2) = (area(2)/(strength*solidangle/(4*3.14)))*100;
peakefficiency(3) = (area(3)/(strength*solidangle/(4*3.14)))*100;
peakefficiency(4) = (area(4)/(strength*solidangle/(4*3.14)))*100;

% Calculating STD peak efficiency
STDpeakefficiency(1) = areaTot(1)/(strength*solidangle/(4*3.14));
STDpeakefficiency(2) = areaTot(2)/(strength*solidangle/(4*3.14));
STDpeakefficiency(3) = areaTot(3)/(strength*solidangle/(4*3.14));
STDpeakefficiency(4) = areaTot(4)/(strength*solidangle/(4*3.14));

%% Writing values to the GUI

% String for the first part of output
out1 = sprintf('       %i                %.2e              %.2e\n', ...
    1, pA(1), pMu(1),...
    2, pA(2), pMu(2),...
    3, pA(3), pMu(3),...
    4, pA(4), pMu(4));
% String for the second part of output
out2 = sprintf('    %.3e             %.3e                   %.2e               %.2e                    %.2e\n', ...
    pSig(1),pfwhm(1), pres(1), peakefficiency(1), STDpeakefficiency(1), ...
    pSig(2),pfwhm(2), pres(2), peakefficiency(2), STDpeakefficiency(2), ...
    pSig(3),pfwhm(3), pres(3), peakefficiency(3), STDpeakefficiency(3), ...
    pSig(4),pfwhm(4), pres(4), peakefficiency(4), STDpeakefficiency(4));

set(handles.outTitle1,'String', 'Peak number     Counts/Sec      Energy (MeV)');
set(handles.out1,'String', out1);

set(handles.outTitle2,'String', 'Standard dev.         FWHM (MeV)            Resolution           %Peak Efficiency         STD Peak Efficiency');
set(handles.out2,'String', out2);

%% Writing values to output file

outFile = [path 'Result.txt'];                  % Path for the output file

fid = fopen(outFile,'w');
fprintf(fid,'Peak number     Counts/Sec     Energy (MeV)        Standard dev. \n');

out1_file = sprintf('   %i           %.2e        %.2e           %.3e\n', ...
    1, pA(1), pMu(1),pSig(1),...
    2, pA(2), pMu(2),pSig(2),...
    3, pA(3), pMu(3),pSig(3),...
    4, pA(4), pMu(4),pSig(4));

fprintf(fid,out1_file);
fprintf(fid,'\n\n\n');

fprintf(fid,'FWHM          Resolution           Peak Effic.      STD peak eff.\n');

out2_file = sprintf('%.3e        %.2e           %.2e        %.2e\n', ...
    pfwhm(1), pres(1), peakefficiency(1), STDpeakefficiency(1), ...
    pfwhm(2), pres(2), peakefficiency(2), STDpeakefficiency(2), ...
    pfwhm(3), pres(3), peakefficiency(3), STDpeakefficiency(3), ...
    pfwhm(4), pres(4), peakefficiency(4), STDpeakefficiency(4));

fprintf(fid,out2_file);

fclose(fid);                  % Closing file
%%
end





function ch2_Callback(~, ~, handles)

%% Checking the sign of channel value

ch2 = str2double(get(handles.ch2,'String'));

if ch2 <= 0
    errordlg('Channel number must be a positive number.','Input error');
    set(handles.time,'Enable','off');
    set(handles.en1,'Enable','off');
    set(handles.ch1,'Enable','off');
    set(handles.en2,'Enable','off');
    set(handles.scan,'Enable','off');
    set(handles.scan_Log,'Enable','off');
    set(handles.strength,'Enable','off');
    set(handles.solidangle,'Enable','off');
    set(handles.countChannel,'Enable','off');
    set(handles.countEnergy,'Enable','off');
    set(handles.log,'Enable','off');
    set(handles.reset,'Enable','off');
else
    set(handles.time,'Enable','on');
    set(handles.en1,'Enable','on');
    set(handles.ch1,'Enable','on');
    set(handles.en2,'Enable','on');
    set(handles.scan,'Enable','on');
    set(handles.scan_Log,'Enable','on');
    set(handles.strength,'Enable','on');
    set(handles.solidangle,'Enable','on');
    set(handles.countChannel,'Enable','on');
    set(handles.countEnergy,'Enable','on');
    set(handles.log,'Enable','on');
    set(handles.reset,'Enable','on');
end



% --- Executes during object creation, after setting all properties.
function ch2_CreateFcn(hObject, ~, ~)
% hObject    handle to ch2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function en2_Callback(~, ~, handles)

%% Checking the sign of energy value


en2 = str2double(get(handles.en2,'String'));

if en2 <= 0
    errordlg('Energy must be a positive number.','Input error');
    set(handles.time,'Enable','off');
    set(handles.ch1,'Enable','off');
    set(handles.ch2,'Enable','off');
    set(handles.en1,'Enable','off');
    set(handles.scan,'Enable','off');
    set(handles.scan_Log,'Enable','off');
    set(handles.strength,'Enable','off');
    set(handles.solidangle,'Enable','off');
    set(handles.countChannel,'Enable','off');
    set(handles.countEnergy,'Enable','off');
    set(handles.log,'Enable','off');
else
    set(handles.time,'Enable','on');
    set(handles.ch1,'Enable','on');
    set(handles.ch2,'Enable','on');
    set(handles.en1,'Enable','on');
    set(handles.scan,'Enable','on');
    set(handles.scan_Log,'Enable','on');
    set(handles.strength,'Enable','on');
    set(handles.solidangle,'Enable','on');
    set(handles.countChannel,'Enable','on');
    set(handles.countEnergy,'Enable','on');
    set(handles.log,'Enable','on');
end



% --- Executes during object creation, after setting all properties.
function en2_CreateFcn(hObject, ~, ~)
% hObject    handle to en2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function strength_Callback(~, ~, handles)

%% Checking the sign of energy strength

strength = str2double(get(handles.strength,'String'));

if strength <= 0
    errordlg('Source strength must be a positive number.','Input error');
    set(handles.time,'Enable','off');
    set(handles.ch1,'Enable','off');
    set(handles.ch2,'Enable','off');
    set(handles.en2,'Enable','off');
    set(handles.scan,'Enable','off');
    set(handles.scan_Log,'Enable','off');
    set(handles.en1,'Enable','off');
    set(handles.solidangle,'Enable','off');
    set(handles.countChannel,'Enable','off');
    set(handles.countEnergy,'Enable','off');
    set(handles.log,'Enable','off');
    set(handles.reset,'Enable','off');
else
    set(handles.time,'Enable','on');
    set(handles.ch1,'Enable','on');
    set(handles.ch2,'Enable','on');
    set(handles.en2,'Enable','on');
    set(handles.scan,'Enable','on');
    set(handles.scan_Log,'Enable','on');
    set(handles.en1,'Enable','on');
    set(handles.solidangle,'Enable','on');
    set(handles.countChannel,'Enable','on');
    set(handles.countEnergy,'Enable','on');
    set(handles.log,'Enable','on');
    set(handles.reset,'Enable','on');
end


% --- Executes during object creation, after setting all properties.
function strength_CreateFcn(hObject, ~, ~)
% hObject    handle to strength (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function solidangle_Callback(~, ~, handles)

%% Checking the sign of solid angle

solidangle = str2double(get(handles.solidangle,'String'));

if solidangle <= 0
    errordlg('Solid angle must be a positive number.','Input error');
    set(handles.time,'Enable','off');
    set(handles.ch1,'Enable','off');
    set(handles.ch2,'Enable','off');
    set(handles.en2,'Enable','off');
    set(handles.scan,'Enable','off');
    set(handles.scan_Log,'Enable','off');
    set(handles.en1,'Enable','off');
    set(handles.strength,'Enable','off');
    set(handles.countChannel,'Enable','off');
    set(handles.countEnergy,'Enable','off');
    set(handles.log,'Enable','off');
    set(handles.reset,'Enable','off');
else
    set(handles.time,'Enable','on');
    set(handles.ch1,'Enable','on');
    set(handles.ch2,'Enable','on');
    set(handles.en2,'Enable','on');
    set(handles.scan,'Enable','on');
    set(handles.scan_Log,'Enable','on');
    set(handles.en1,'Enable','on');
    set(handles.strength,'Enable','on');
    set(handles.countChannel,'Enable','on');
    set(handles.countEnergy,'Enable','on');
    set(handles.log,'Enable','on');
    set(handles.reset,'Enable','on');
end


% --- Executes during object creation, after setting all properties.
function solidangle_CreateFcn(hObject, ~, ~)
% hObject    handle to solidangle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in countChannel.
function countChannel_Callback(~, ~, handles)

%% Ploting Channel vs. counts 

global channel;
global countsTotal;

cla(handles.axes1,'reset');

axes(handles.axes1)

plot(channel, countsTotal,'LineWidth',1);
xlabel('Channel');
ylabel('Counts');
title('Channel vs. counts');
grid; 
axis([0 max(channel) 0 max(countsTotal)])

set(handles.reset,'Enable','on');




% --- Executes on button press in countEnergy.
function countEnergy_Callback(~, ~, handles)

%% Ploting energy vs. counts 

global channel;
global countsTotal;

cla(handles.axes1,'reset');

% Reading input values

ch1 = str2double(get(handles.ch1,'String'));
en1 = str2double(get(handles.en1,'String'));

ch2 = str2double(get(handles.ch2,'String'));
en2 = str2double(get(handles.en2,'String'));

%% Checkinh input values
if  ch1<=0 || ch2 <=0 || en1<=0 || en2<=0 
    ;
else

b = (en2 - en1)/(ch2 - ch1);
a = en1 - b * ch1;  

energy = a + b * channel;

% Ploting
axes(handles.axes1)

plot(energy, countsTotal,'LineWidth',1);
xlabel('Energy (MeV)');
ylabel('Counts');
title('Energy vs. Counts');
grid; 
axis([0 max(energy) 0 max(countsTotal)])  

set(handles.reset,'Enable','on');
end

% --- Executes on button press in reset.
function reset_Callback(~, ~, handles)
cla(handles.axes1,'reset');

energy = 0;
countSec = 0;
plot(energy, countSec,'LineWidth',1);
xlabel('Channel');
ylabel('Counts');
grid; 
axis([0 3 0 25])


% --- Executes on button press in log.
function log_Callback(~, ~, handles)

global channel;
global countsTotal;


%% Log Plot

cla(handles.axes1,'reset');

% Reading input values
time = str2double(get(handles.time,'String'));
ch1 = str2double(get(handles.ch1,'String'));
en1 = str2double(get(handles.en1,'String'));

ch2 = str2double(get(handles.ch2,'String'));
en2 = str2double(get(handles.en2,'String'));

%% Checking input values

if time<=0 || ch1<=0 || ch2 <=0 || en1<=0 || en2<=0 
    ;
else

% Calculating energy and countSec
b = (en2 - en1)/(ch2 - ch1);
a = en1 - b * ch1;  

countSec = countsTotal/(time*60);
energy = a + b * channel;

axes(handles.axes1)

countLog = log(countSec);

plot(energy, countLog,'LineWidth',1);
xlabel('Energy (MeV)');
ylabel('Counts/Sec (Log)');
title('Energy vs. Counts/Sec');
grid; 
axis([0 max(energy) min(countLog) max(countLog)])
end


% --- Executes on button press in scan_Log.
function scan_Log_Callback(hObject, eventdata, handles)
global channel;
global countsTotal;


%% Log Plot

cla(handles.axes1,'reset');

% Reading input values
time = str2double(get(handles.time,'String'));
ch1 = str2double(get(handles.ch1,'String'));
en1 = str2double(get(handles.en1,'String'));

ch2 = str2double(get(handles.ch2,'String'));
en2 = str2double(get(handles.en2,'String'));

strength_inp = str2double(get(handles.strength,'String'));
solidangle = str2double(get(handles.solidangle,'String'));

%% Checking input values

if time<=0 || ch1<=0 || ch2 <=0 || en1<=0 || en2<=0 || strength_inp<=0 || solidangle <=0
    ;
else

strength = strength_inp*(1e-6)*3.7*1e10;

% Calculating energy and countSec
b = (en2 - en1)/(ch2 - ch1);
a = en1 - b * ch1;  

countSec = countsTotal/(time*60);
energy = a + b * channel;

axes(handles.axes1)

countLog = log(countSec);

plot(energy, countLog,'LineWidth',1);
xlabel('Energy (MeV)');
ylabel('Counts/Sec (Log)');
title('Energy vs. Counts/Sec');
grid; 
axis([0 max(energy) min(countLog) max(countLog)])
end

%% Peak find algorithm

countSecM = medfilt1(countSec);                      % Median filter
countSecSmooth = smooth(energy,countSecM);           % Smoothing    

countSecLog = log(countSecSmooth);                  % Making log data
countSecLogSmooth = smooth(countSecLog,0.05,'rloess');      % Smoothing

hold on;
plot(energy, countSecLogSmooth,'LineWidth',1.5, 'Color','g');
legend('Spectrum','Smooth curve','Location','NorthEast');

% Finding the positions of maximums using  peakdet function

[maxtabPos, mintabPos] = peakdet(countSecLogSmooth, 0.5);    
                                                            
%Excluding first unwonted peak and coresponting data

newE = energy([2*maxtabPos(1): length(energy)]);            
       
newC = countSecLogSmooth([2*maxtabPos(1): length(countSecLogSmooth)]);

% Applying peakdet agein to this cut data right positions  of peaks are found 
[maxtabPos1, mintabPos1] = peakdet(newC, 0.5);         

% The values for energy and countSec for peaks will be

for i=1:length(maxtabPos1)
    peakCount(i) = countSecSmooth(maxtabPos1(i)+2*maxtabPos(1));
    peakEnergy(i) = energy(maxtabPos1(i)+2*maxtabPos(1));
    peak_Fin_Pos(i) = maxtabPos1(i)+2*maxtabPos(1);
end

% Ploting peaks
plot(peakEnergy, log(peakCount), 'r^','markerfacecolor',[1 0 0]);

%% Calculating the values for peaks

%Finding the values of amplituse, mean, sig, fwhm, resolution, area and
%total area of each peak using localFit11 function. Area is required for peak
%efficiency calculation and total area for STD peak efficiency calculation.

for n=1:4
    [pA(n), pMu(n), pSig(n), pfwhm(n), pres(n)] = ...
        localFit(energy, countSec, peak_Fin_Pos(n));
    [area(n), areaTot(n)] = localFitArea(channel,countSec,peak_Fin_Pos(n));
end

% Calculating peak efficiency
peakefficiency(1) = (area(1)/(strength*solidangle/(4*3.14)))*100;
peakefficiency(2) = (area(2)/(strength*solidangle/(4*3.14)))*100;
peakefficiency(3) = (area(3)/(strength*solidangle/(4*3.14)))*100;
peakefficiency(4) = (area(4)/(strength*solidangle/(4*3.14)))*100;

% Calculating STD peak efficiency
STDpeakefficiency(1) = areaTot(1)/(strength*solidangle/(4*3.14));
STDpeakefficiency(2) = areaTot(2)/(strength*solidangle/(4*3.14));
STDpeakefficiency(3) = areaTot(3)/(strength*solidangle/(4*3.14));
STDpeakefficiency(4) = areaTot(4)/(strength*solidangle/(4*3.14));

%% Writing values to the GUI

% String for the first part of output
out1 = sprintf('       %i                %.2e              %.2e\n', ...
    1, log(pA(1)), pMu(1),...
    2, log(pA(2)), pMu(2),...
    3, log(pA(3)), pMu(3),...
    4, log(pA(4)), pMu(4));
% String for the second part of output
out2 = sprintf('    %.3e             %.3e                   %.2e               %.2e                    %.2e\n', ...
    pSig(1),pfwhm(1), pres(1), peakefficiency(1), STDpeakefficiency(1), ...
    pSig(2),pfwhm(2), pres(2), peakefficiency(2), STDpeakefficiency(2), ...
    pSig(3),pfwhm(3), pres(3), peakefficiency(3), STDpeakefficiency(3), ...
    pSig(4),pfwhm(4), pres(4), peakefficiency(4), STDpeakefficiency(4));

set(handles.outTitle1,'String', 'Peak number     Counts/Sec(Log)   Energy (MeV)');
set(handles.out1,'String', out1);

set(handles.outTitle2,'String', 'Standard dev.         FWHM (MeV)            Resolution           %Peak Efficiency         STD Peak Efficiency');
set(handles.out2,'String', out2);


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over text16.
function text16_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to text16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over text5.
function text5_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to text5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when figure1 is resized.
function figure1_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
